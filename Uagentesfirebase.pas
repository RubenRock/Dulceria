unit Uagentesfirebase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.Buttons, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, JSON, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IdHTTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, REST.Response.Adapter, Vcl.StdCtrls ;

type
  TFAgentesMongo = class(TForm)
    Bacccion: TSpeedButton;
    Qryaux: TFDQuery;
    Bpost: TSpeedButton;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    Memo1: TMemo;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    procedure BacccionClick(Sender: TObject);
    procedure BpostClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure post(resturl:string;tabla:string;json:string);
    procedure FormActivate(Sender: TObject);
    procedure fecha(resturl:string);
    function  codificar_a_utf8(texto:string):AnsiString;  //aceptar ñ y otros caracteres
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgentesMongo: TFAgentesMongo;

implementation

{$R *.dfm}

uses Umodulo, UmoduloAPI;

procedure TFAgentesMongo.post(resturl:string;tabla:string;json:string);
var
  UTF8Str: UTF8String;
  cont:integer;
  jsonText, empaque:string;
begin
  moduloapi.RestDelete.BaseURL:=resturl;
  moduloapi.RestPost.BaseURL:=resturl;

  qryaux.Open(tabla);qryaux.last;
  cont:=0;jsonText:='';
  ModuloAPI.RESTRequest12.Execute;  //borra la coleccion ejecutando RestDelete
  qryaux.First;
  while not qryaux.Eof do
  begin
    inc(cont);

    if json = 'listasimilar' then
      jsonText:= jsonTExt+codificar_a_utf8('{"clave":'+inttostr(qryaux['clave'])+',"descripcion":"'+qryaux['descripcion']+'"},');

    if json = 'similares' then
      jsonText:= jsonTExt+codificar_a_utf8('{"id":'+inttostr(cont)+',"clave":'+inttostr(qryaux['clave'])+',"producto":"'+qryaux['producto']+'"},');

    if json = 'inventario' then
      jsonText:= jsonTExt+codificar_a_utf8('{"clave":"'+qryaux['clave']+'","producto":"'+qryaux['producto']+'","iva":'+inttostr(qryaux['iva'])+',"usuario":"'+qryaux['usuario']+'","fecha":"'+datetimetostr(qryaux['fecha'])+'","ieps":'+inttostr(qryaux['ieps'])+',"facturable":"'+qryaux['facturable']+'"},');

    if json = 'clientes' then
      jsonText:= jsonTExt+codificar_a_utf8('{"nombre":"'+qryaux['nombre']+'","apellidos":"'+qryaux['apellidos']+'","direccion":"'+qryaux['direccion']+'","telefono":"'+qryaux['telefono']+'","email":"'+qryaux['email']+'","credito":"'+qryaux['credito']+'","multicredito":"'+qryaux['multicredito']+'","id":"'+qryaux['id']+'"},');

      {"_id":"617d480584c4b513fcc969e7","nombre":"prueba2","direccion":"402","telefono":"963","email":"specter","credito":"no","multicredito":"si","id":"my id 2","tienda":"mercado"}

      //showmessage(codificar_a_utf8('{"clave":"'+qryaux['clave']+'","producto":"'+qryaux['producto']+'","iva":'+inttostr(qryaux['iva'])+',"usuario":"'+qryaux['usuario']+'","fecha":"'+datetimetostr(qryaux['fecha'])+'","ieps":'+inttostr(qryaux['ieps'])+',"facturable":"'+qryaux['facturable']+'"},'));


    if json = 'empaque' then
    begin
      empaque:=qryaux['empaque'];
      if qryaux['empaque']='6' then
        empaque:='SEIS'
      else
        if qryaux['empaque']='12' then
          empaque := 'DOCE';

      jsonText:= jsonTExt+codificar_a_utf8('{"clave":"'+qryaux['clave']+'","empaque":"'+empaque+'","precio":'+floattostr(qryaux['precio'])+',"piezas":'+inttostr(qryaux['piezas'])+',"barras":"'+qryaux['barras']+'","id":'+inttostr(qryaux['id'])+'},');
    end;



    if cont = 500 then  //carga 500 registros hacemos Post
    begin
      jsonText[length(jsonText)]:= ']';//le quito la ultima ','
      ModuloAPI.RESTRequest11.Params[0].Value:='['+jsonText;
      ModuloAPI.RESTRequest11.Execute;
      cont:=0;
      jsonText:='';
    end;
    qryaux.Next;
  end;

  if cont > 0 then //para el resto que no llego a 500 registros
  begin
    jsonText[length(jsonText)]:= ']';//le quito la ultima ','
    ModuloAPI.RESTRequest11.Params[0].Value:='['+jsonText;
    ModuloAPI.RESTRequest11.Execute;
  end;
  memo1.Lines.Add(ModuloAPI.RESTRequest11.Params[0].Value);


end;

procedure TFAgentesMongo.BacccionClick(Sender: TObject);
var
  JSo :  TJSONObject;
  JSOarray : TJSONArray;
  JSOValue: TJSONValue;
  remitente, destinatario, mensaje, estado : string;
  folio,folio_agente:integer;
begin
  moduloAPI.RESTRequest1.Execute;
  qryaux.Open('select max(folio) as maxfolio from lista_remision');
  folio :=qryaux['maxfolio']+1;

  modulo.qryremisiones.Open('select * from remisiones');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.RESTResponse1.Content);
  folio_agente:=strtoint((((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('folio').JSONValue.Value));

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.QryRemisiones.Append;
    modulo.QryRemisiones['folio']:=strtoint(JSo.Values['folio'].value)-folio_agente+folio;
    modulo.QryRemisiones['cantidad']:=JSo.Values['cantidad'].value;
    modulo.QryRemisiones['producto']:=JSo.Values['producto'].value;
    modulo.QryRemisiones['total']:=JSo.Values['total'].value;
    modulo.QryRemisiones['tipo']:=JSo.Values['tipo'].value;
    modulo.QryRemisiones['empaque']:=JSo.Values['empaque'].value;
    modulo.QryRemisiones.Post;
  end;
  showmessage('termino')
end;

procedure TFAgentesMongo.BpostClick(Sender: TObject);
begin
  memo1.Lines.Add(timetostr(time));
  post('https://vercel-api-eta.vercel.app/api/inventario',
        'select * from inventario ORDER BY PRODUCTO',
        'inventario');

  post('https://vercel-api-eta.vercel.app/api/empaque',
        'select * from inventario_EMPAQUE ORDER BY id',
        'empaque');

 post('https://vercel-api-eta.vercel.app/api/similares',
        'select * from similar order by clave',
        'similares');

  post('https://vercel-api-eta.vercel.app/api/listasimilar',
        'select * from lista_similar order by clave',
        'listasimilar');
  memo1.Lines.Add(timetostr(time));

   showmessage('listo');
end;

function  TFAgentesMongo.codificar_a_utf8(texto: string):AnsiString;
var
  UTF8Str: UTF8String;
  I: Integer;
begin
  UTF8Str := UTF8String(texto);
  SetLength(Result, Length(UTF8Str));
  for I := 1 to Length(UTF8Str) do
    Result[I] := AnsiChar(Ord(UTF8Str[I]));
end;

procedure TFAgentesMongo.fecha(resturl: string);
var
  F: TextFile;
  jsonText, nfecha, fecha_anterior,fecha:string;
  JSOValue: TJSONValue;

begin
  moduloapi.RestDelete.BaseURL:=resturl;
  moduloapi.RestPost.BaseURL:=resturl;

  //Obtengo el valor de la ultima fecha para ponerla como fecha anterior
  moduloAPI.Requestfecha.Execute;
  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.Responsefecha.Content);
  fecha_anterior:=(((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('fecha').JSONValue.Value);

  ModuloAPI.RESTRequest12.Execute;  //borra la coleccion ejecutando RestDelete

  nfecha :=formatdatetime('dd/mm/yyyy HH:nn:ss', now);
 { fecha:=datetimetostr(now);
  nfecha:=fecha;
  //arreglo el formato de fecha
  nfecha[1]:=fecha[4];
  nfecha[2]:=fecha[5];
  nfecha[4]:=fecha[1];
  nfecha[5]:=fecha[2];  }

  //** Actualizar la fecha local del inventario en la nube
  AssignFile( F, modulo.QryExtras['direc_fecha'] );
  Rewrite( F );
  WriteLn( F, nfecha);
  CloseFile( F );
  //**************************************************

  jsonText:='{"fecha":"'+nfecha+'","fecha_anterior":"'+fecha_anterior+'"}';

  ModuloAPI.RESTRequest11.Params[0].Value:=jsonText;
  ModuloAPI.RESTRequest11.Execute;   //ejecuta RestPost


end;

procedure TFAgentesMongo.FormActivate(Sender: TObject);
begin
  memo1.Clear;
end;

procedure TFAgentesMongo.SpeedButton2Click(Sender: TObject);
var
  JSo :  TJSONObject;
  JSOarray : TJSONArray;
  JSOValue: TJSONValue;
  remitente, destinatario, mensaje, estado : string;
  folio,folio_agente, folio_inicio:integer;
begin
  memo1.Clear;
  memo1.Lines.Add('Empezo desgarga de notas de agentes de venta');
  memo1.Lines.Add('Descargando productos de las notas');
  //------remisiones-------


  qryaux.Open('select max(folio) as maxfolio from lista_remision');

  IF qryaux['maxfolio'] <> null then
      folio :=qryaux['maxfolio']+1
  else
      folio := 1;

  modulo.qryremisiones.Open('select * from remisiones');

  moduloAPI.RESTRequest3.Execute;
  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.RESTResponse3.Content);
  folio_inicio:=strtoint((((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('folio').JSONValue.Value));

  moduloAPI.RESTRequest1.Execute;
  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.RESTResponse1.Content);
  folio_agente:=strtoint((((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('folio').JSONValue.Value));

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.QryRemisiones.Append;
    //SHOWMESSAGE(INTTOSTR(strtoint(JSo.Values['folio'].value)-folio_inicio+folio));
    //modulo.QryRemisiones['folio']:=strtoint(JSo.Values['folio'].value)-folio_agente+folio;
    modulo.QryRemisiones['folio']:=strtoint(JSo.Values['folio'].value)-folio_inicio+folio;
    modulo.QryRemisiones['cantidad']:=JSo.Values['cantidad'].value;
    modulo.QryRemisiones['producto']:=JSo.Values['producto'].value;
    modulo.QryRemisiones['total']:=JSo.Values['total'].value;
    modulo.QryRemisiones['tipo']:=JSo.Values['tipo'].value;
    modulo.QryRemisiones['empaque']:=JSo.Values['empaque'].value;
    modulo.QryRemisiones['clave']:='..';//JSo.Values['clave'].value;
    modulo.QryRemisiones['clave_empaque']:='..';//JSo.Values['clave_empaque'].value;
    modulo.QryRemisiones.Post;
  end;

  //------lista de remisiones-------
  memo1.Lines.Add('Descargando lista de remisiones');

  moduloAPI.RESTRequest3.Execute;

  modulo.QryListaremision.Open('select * from lista_remision');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.RESTResponse3.Content);
  folio_agente:=strtoint((((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('folio').JSONValue.Value));

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.QryListaremision.Append;
    //modulo.QryListaremision['folio']:=strtoint(JSo.Values['folio'].value)-folio_agente+folio;
    modulo.QryListaremision['folio']:=strtoint(JSo.Values['folio'].value)-(folio_inicio)+folio;
    modulo.QryListaremision['cliente']:=JSo.Values['cliente'].value;
    modulo.QryListaremision['total']:=JSo.Values['total'].value;
    modulo.QryListaremision['fecha']:=JSo.Values['fecha'].value;
    modulo.QryListaremision['vendedor']:=JSo.Values['vendedor'].value;
    modulo.QryListaremision['condicion']:=JSo.Values['condicion'].value;
    modulo.QryListaremision['estado']:=JSo.Values['estado'].value;
    modulo.QryListaremision['domicilio']:=JSo.Values['domicilio'].value;
    modulo.QryListaremision['impresion']:=JSo.Values['impresion'].value;
    modulo.QryListaremision['descuento']:=JSo.Values['descuento'].value;
    modulo.QryListaremision.Post;
  end;
  memo1.Lines.Add('Descarga completa');
  showmessage('Termino el proceso de descarga');
end;

end.
