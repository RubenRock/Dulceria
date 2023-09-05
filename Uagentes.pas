unit Uagentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,System.JSON, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,IdHTTP, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TFagentes = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    SpeedButton2: TSpeedButton;
    Qryred: TFDQuery;
    IdFTP1: TIdFTP;
    Dsmemtable2: TDataSource;
    FDMemTable2: TFDMemTable;
    Dsmemtable: TDataSource;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fagentes: TFagentes;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFagentes.FormActivate(Sender: TObject);
begin
  memo1.Clear;
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Active:=false;modulo.qryremiaux2.Active:=true;
end;

procedure TFagentes.SpeedButton1Click(Sender: TObject);
var
  JSo,JSo2 :  TJSONObject;
  JSOarray : TJSONArray;
  JSOValue,JSOValue2,JsonValue,JsonValue1,JsonValue2: TJSONValue;
  mensaje,valor : string;
  numero,I,folio,folio_agente:integer;
  texto1,texto2: TStringList;
  precio:real;
  smlista_remision,smremisiones,total:string;
begin
  smlista_remision:=modulo.QryExtras['lista_remision'];
  IdFTP1:= TIdFTP.Create;
  with IdFTP1 do
  try
      Username := 'mysilver';
      Password := 'Avlatome1';
      Passive := true;
      Host := 'ftp.webcindario.com';
      Port := StrToIntDef('21', 21);
      Connect;
      ChangeDir('/web/Tiendas');
       try
          Application.ProcessMessages;
          Get( ExtractFileName(smlista_remision), smlista_remision, true, False );
       except
          on e:exception do
          begin
             showmessage('No se puede ver la vista previa, no hay notas en la nube o no tiene internet');
             exit;
          end;
       end;
   finally
      free;
   end;

   FDMemTable1.LoadFromFile((Application.GetNamePath)+smlista_remision,sfJSON);

end;

procedure TFagentes.SpeedButton2Click(Sender: TObject);
var
  JSo,JSo2 :  TJSONObject;
  JSOarray : TJSONArray;
  JSOValue,JSOValue2,JsonValue,JsonValue1,JsonValue2: TJSONValue;
  mensaje,valor : string;
  numero,I,folio,folio_agente:integer;
  texto1,texto2: TStringList;
  precio:real;
  smlista_remision,smremisiones,total:string;
begin
  memo1.Clear;
  modulo.qryinventario.Open('select * from inventario');
  modulo.QryEmpaque.Open('select * from inventario_empaque');
  modulo.QryExtras.Open('select * from extras');
  smlista_remision:=modulo.QryExtras['lista_remision'];
  smremisiones:=modulo.QryExtras['remisiones'];
  IdFTP1:= TIdFTP.Create;
  with IdFTP1 do
  try
      Username := 'mysilver';
      Password := 'Avlatome1';
      Passive := true;
      Host := 'ftp.webcindario.com';
      Port := StrToIntDef('21', 21);
      Connect;
      ChangeDir('/web/Tiendas');
       try
          Application.ProcessMessages;
          memo1.lines.add('Iniciando descarga de archivos....');
          Get( ExtractFileName(smlista_remision), smlista_remision, true, False );
          memo1.lines.add('Primer archivo descargado....');
          Get( ExtractFileName(smremisiones), smremisiones, true, False );
          memo1.lines.add('Finalizando descarga de archivos...');
       except
          on e:exception do
          begin
             memo1.Font.Color:=clRed;
             memo1.lines.add('Error en FTP descarga: ' + e.message);
             MessageDlg('Proceso de FTP download Finalizo con Error', mtError , [mbok], 0);
             exit;
          end;
       end;
   finally
      free;
   end;


  qryred.Open('select max(folio)as maxifolio from LISTA_REMISION');
  folio:=qryred['maxifolio'];
  modulo.QryListaremision.Open('select * from lista_remision');
  modulo.QryRemisiones.Open('select * from remisiones');

  FDMemTable1.LoadFromFile((Application.GetNamePath)+smlista_remision,sfJSON);
  FDMemTable2.LoadFromFile((Application.GetNamePath)+smremisiones,sfJSON);

  FDMemTable1.First;
  folio_agente:= FDMemTable1['folio']-1;
  while not FDMemTable1.Eof do
  begin
    modulo.QryListaremision.Append;
    modulo.QryListaremision['folio']:=FDMemTable1['folio']-folio_agente+folio;
    modulo.QryListaremision['cliente']:=FDMemTable1['cliente'];

    //la tableta manda los decimales con ',' en lugar de '.'
    total:=FDMemTable1['total'];
    for I := 0 to length(total)-1 do
    begin
      if total[i]=',' then
        total[i]:='.'
    end;
    modulo.QryListaremision['total']:=total;
    modulo.QryListaremision['fecha']:=FDMemTable1['fecha'];
    modulo.QryListaremision['vendedor']:=FDMemTable1['vendedor'];
    modulo.QryListaremision['condicion']:=FDMemTable1['condicion'];
    if FDMemTable1['condicion']='CONTADO' then
      modulo.QryListaremision['estado']:='PAGADO'
    ELSE
      modulo.QryListaremision['estado']:='PENDIENTE';
    modulo.QryListaremision['domicilio']:=FDMemTable1['domicilio'];
    modulo.QryListaremision['impresion']:=FDMemTable1['impresion'];
    modulo.QryListaremision['descuento']:=FDMemTable1['descuento'];
    modulo.QryListaremision.Post;

    FDMemTable1.Next;

  end;

  FDMemTable2.First;
  folio_agente:= FDMemTable2['folio']-1;
  while not FDMemTable2.Eof do
  begin
    modulo.QryRemisiones.Append;
    modulo.QryRemisiones['folio']:=FDMemTable2['folio']-folio_agente+folio;
    modulo.QryRemisiones['cantidad']:=FDMemTable2['cantidad'];
    modulo.QryRemisiones['producto']:=FDMemTable2['producto'];
    modulo.QryRemisiones['empaque']:=FDMemTable2['empaque'];

    if modulo.qryinventario.Locate('producto',FDMemTable2['producto'],[]) then
      modulo.QryRemisiones['clave']:= modulo.qryinventario['clave'];

    qryred.Open('select * from inventario_empaque where clave = '+QuotedStr(modulo.qryinventario['clave'])+
                    ' and empaque = '+quotedstr(FDMemTable2['empaque']));


    if qryred.RecordCount > 0 then
      modulo.qryremisiones['clave_empaque']:=qryred['id'];
      //showmessage(qryred['clave']+'    '+qryred['id']);

    {if modulo.QryEmpaque.Locate('clave;empaque',VarArrayOf([modulo.qryinventario['clave'],FDMemTable2['empaque']]),[]) then
      modulo.qryremisiones['clave_empaque']:=modulo.QryEmpaque['id']
    else
      showmessage('-'+FDMemTable2['producto']+'   '+modulo.qryinventario['producto']+'         -'+modulo.qryinventario['CLAVE']);}

    //la tableta manda los decimales con ',' en lugar de '.'
    total:=FDMemTable2['total'];
    for I := 0 to length(total)-1 do
    begin
      if total[i]=',' then
        total[i]:='.'
    end;
    modulo.QryRemisiones['total']:=total;
    modulo.QryRemisiones['tipo']:=FDMemTable2['tipo'];

    modulo.QryRemisiones.Post;

    FDMemTable2.Next;

  end;

  SHOWMESSAGE('Se cargaron correctamente las notas de la nube');


  //este codigo  lee archivos json creados desde una pagina web que yo hice
  //pero que ya no use por ser dificil las actualizacion de esa pagina
  {texto1 := TStringList.Create;
  texto2 := TStringList.Create;



  texto1.LoadFromFile((Application.GetNamePath)+smlista_remision);
  valor :=texto1.Text;

  //Obtenemos el numero de registros del archivo JSON
  JSo := TJSonObject.Create;
  JsonValue:=JSo.ParseJSONValue(valor);
  JsonValue1:=(JsonValue as TJSONObject).Get('registros').JSONValue;
  numero :=  (JsonValue1 as TJSONArray).Count;

  //Obtenemos el texto de JSON
  JSOValue := TJSonObject.ParseJSONValue(valor);

  for I := 0 to numero-1 do
  begin
    modulo.QryListaremision.Append;
    modulo.QryListaremision['folio']:=inttostr(strtoint(JSOValue.GetValue<string>('registros['+inttostr(I)+'].folio'))+folio);
    modulo.QryListaremision['cliente']:=JSOValue.GetValue<string>('registros['+inttostr(I)+'].cliente');
    modulo.QryListaremision['total']:=JSOValue.GetValue<string>('registros['+inttostr(I)+'].cantidad');
    modulo.QryListaremision['fecha']:=JSOValue.GetValue<string>('registros['+inttostr(I)+'].fecha');
    modulo.QryListaremision['vendedor']:='tableta';
    modulo.QryListaremision['condicion']:=JSOValue.GetValue<string>('registros['+inttostr(I)+'].condicion');;
    modulo.QryListaremision['estado']:='ACTIVO';
    modulo.QryListaremision['domicilio']:=JSOValue.GetValue<string>('registros['+inttostr(I)+'].domicilio');;
    modulo.QryListaremision['impresion']:='SERIE';
    modulo.QryListaremision['descuento']:='0';
    modulo.QryListaremision.Post;
  end;
  JSOValue.Free;


  memo1.Lines.Add('-----------------------------------------');
  memo1.Lines.Add('Se agregaron '+inttostr(numero)+' notas');

  texto2.LoadFromFile((Application.GetNamePath)+smremisiones);
  valor :=texto2.Text;

  //Obtenemos el numero de registros del archivo JSON
  JSo2 := TJSonObject.Create;
  JsonValue2:=JSo2.ParseJSONValue(valor);
  JsonValue2:=(JsonValue2 as TJSONObject).Get('registros').JSONValue;
  numero :=  (JsonValue2 as TJSONArray).Count;



  //Obtenemos el texto de JSON
  JSOValue2 := TJSonObject.ParseJSONValue(valor);

  for I := 0 to numero-1 do
  begin
    modulo.QryRemisiones.Append;
    modulo.QryRemisiones['folio']:=inttostr(strtoint(JSOValue2.GetValue<string>('registros['+inttostr(I)+'].folio'))+folio);
    modulo.QryRemisiones['cantidad']:=JSOValue2.GetValue<string>('registros['+inttostr(I)+'].cantidad');
    modulo.QryRemisiones['producto']:=JSOValue2.GetValue<string>('registros['+inttostr(I)+'].producto');
    modulo.QryRemisiones['total']:=JSOValue2.GetValue<string>('registros['+inttostr(I)+'].precio');
    modulo.QryRemisiones['tipo']:='SERIE';
    modulo.QryRemisiones['empaque']:=JSOValue2.GetValue<string>('registros['+inttostr(I)+'].empaque');
    modulo.QryRemisiones.Post;
  end;

  JSOValue2.Free;
  memo1.Lines.Add('Se agregaron todos los productos de las notas');
  memo1.Lines.Add('Proceso terminado'); }

end;

end.
