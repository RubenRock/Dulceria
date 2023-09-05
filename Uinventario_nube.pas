unit Uinventario_nube;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Vcl.Buttons, Data.DB, FireDAC.Comp.DataSet,idftp, Vcl.StdCtrls,IdAntiFreezeBase,
  Vcl.ExtCtrls, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, IdHTTP, Vcl.Grids, Vcl.DBGrids,JSON;

type
  TFinventario_nube = class(TForm)
    Dsmemtable2: TDataSource;
    FDMemTable2: TFDMemTable;
    Dsmemtable: TDataSource;
    FDMemTable1: TFDMemTable;
    SpeedButton2: TSpeedButton;
    Sqlred: TFDQuery;
    Memo1: TMemo;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    qryActualizados: TFDQuery;
    DsActualizados: TDataSource;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    function checar_fecha_actualizacion:Boolean;
    procedure FormActivate(Sender: TObject);
    procedure ultimos_actualizados;
    procedure SpeedButton4Click(Sender: TObject);
    procedure actualizacion_fecha_local;
    procedure leerPaginaFTP(nombreArchivo:string);  //aceptar ñ y otros caracteres
    function  codificar_a_utf8(texto:string):AnsiString;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Finventario_nube: TFinventario_nube;

implementation

{$R *.dfm}

uses Umodulo, UmoduloAPI;

procedure TFinventario_nube.actualizacion_fecha_local;
var
  jsonText,nfecha, fecha, s, smfecha:string;
  JSOValue: TJSONValue;
  fecha_pag_web: tdatetime;
  F: TextFile;
  pag_web: TIdHTTP;
begin
  {moduloAPI.Requestfecha.Execute;
  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.Responsefecha.Content);
  fecha:=(((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('fecha').JSONValue.Value);

  nfecha:=fecha;

  fecha_pag_web:=strtodatetime(nfecha);}

  modulo.QryExtras.Open('select * from extras');
  smfecha:=modulo.QryExtras['fecha'];

  //FTP
  pag_web := TIdHTTP.Create(nil);
  try
    s := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+smfecha);
    pag_web.Free;
  except
    showmessage('Hay problemas con la conexion a internet');
    exit;
  end;

  AssignFile( F, modulo.QryExtras['direc_fecha'] );
  Rewrite( F );
  WriteLn( F, (s));
  CloseFile( F );



  {AssignFile( F, modulo.QryExtras['direc_fecha'] );
  Rewrite( F );
  WriteLn( F, (datetimetostr(fecha_pag_web)));
  CloseFile(F);  }
end;

function TFinventario_nube.checar_fecha_actualizacion;
var
  ultima_actualizacion: TStringList;
  fecha_pag_web, fecha_local: tdatetime;
  S: string;
  pag_web: TIdHTTP;
begin
  ultima_actualizacion := TStringList.Create;
  ultima_actualizacion.LoadFromFile(modulo.QryExtras['direc_fecha']);
  fecha_local:=strtodatetime(ultima_actualizacion.Text);

  pag_web := TIdHTTP.Create(nil);
  try
    S := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+modulo.QryExtras['fecha']);
    fecha_pag_web := strtodatetime(s);
    if fecha_pag_web<>fecha_local then
    begin
      showmessage('Existe una actualizacion pendiente, primero debes actualizar el inventario');
      Result:=false;
    end
    else
      Result:=true;
    pag_web.Free;

    except
      on e:exception do
          begin
             Result:=false;
             showmessage('Error : ' + e.message);
          end;
    {finally
      pag_web.Free;}
  end;


end;

function TFinventario_nube.codificar_a_utf8(texto: string): AnsiString;
var
  UTF8Str: UTF8String;
  I: Integer;
begin
  UTF8Str := UTF8String(texto);
  SetLength(Result, Length(UTF8Str));
  for I := 1 to Length(UTF8Str) do
    Result[I] := AnsiChar(Ord(UTF8Str[I]));
end;

procedure TFinventario_nube.FormActivate(Sender: TObject);
begin
  ultimos_actualizados;
end;



procedure TFinventario_nube.leerPaginaFTP(nombreArchivo: string);
var
  F: TextFile;
  pag_web: TIdHTTP;
  s:string;
begin
    pag_web := TIdHTTP.Create(nil);
    try
      s := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+nombreArchivo);
      pag_web.Free;
    except
      showmessage('Hay problemas con la conexion a internet');
      exit;
    end;


    delete(s,1,3); //borro 3 caracteres basura que se general al descargar
    AssignFile( F, nombreArchivo );
    Rewrite( F );
    WriteLn( F, codificar_a_utf8(s));
    CloseFile( F );
end;

procedure TFinventario_nube.SpeedButton1Click(Sender: TObject);
begin
  sqlred.Open('select * from inventario');
  sqlred.SaveToFile('C:\inventario\SMinventario.json',sfJSON);
  sqlred.Open('select * from inventario_empaque');
  sqlred.SaveToFile('C:\inventario\SMempaque.json',sfJSON);

  sqlred.Open('select * from lista_similar');
  sqlred.SaveToFile('C:\inventario\SMlista_similar.json',sfJSON);
  sqlred.Open('select * from similar');
  sqlred.SaveToFile('C:\inventario\SMsimilar.json',sfJSON);
  memo1.Clear;
  memo1.lines.add('El archivo se creo exitosamente en la carpeta de "Inventario"');

end;

procedure TFinventario_nube.SpeedButton2Click(Sender: TObject);
var
  I:BYTE;
  F: TextFile;
  pag_web: TIdHTTP;
  s,sminventario,smempaque,smfecha,smlistasimilar,smsimilar,producto_aux:string;
begin
  // variables de los archivos en la nube
  modulo.QryExtras.Open('select * from extras');
  sminventario:=modulo.QryExtras['inventario'];
  smempaque:=modulo.QryExtras['empaque'];
  smlistasimilar:='SL'+modulo.QryExtras['inventario'];
  smsimilar:='SI'+modulo.QryExtras['inventario'];
  smfecha:=modulo.QryExtras['fecha'];
  qryActualizados.Close;


  //** Actualizar la fecha del inventario en la nube
  //FTP
  pag_web := TIdHTTP.Create(nil);
  try
    s := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+smfecha);
    pag_web.Free;
  except
    showmessage('Hay problemas con la conexion a internet');
    exit;
  end;

  AssignFile( F, modulo.QryExtras['direc_fecha'] );
  Rewrite( F );
  WriteLn( F, (s));
  CloseFile( F );

  //**************************************************

   //actualizacion para mercado
   if 'AUGC-940427-UB1' = modulo.QryExtras['rfc'] then
   begin
    leerPaginaFTP(sminventario);
    leerPaginaFTP(smempaque);
    leerPaginaFTP(smlistasimilar);
    leerPaginaFTP(smsimilar);
   end
   else  //actualizacion para las demas tiendas
   begin
      memo1.Clear;
      memo1.Font.Color:=clWindowText;
      with TIdFtp.Create(self) do
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
              Get( ExtractFileName(sminventario), sminventario, true, False );
              memo1.lines.add('Primer archivo descargado....');
              Get( ExtractFileName( smempaque ), smempaque, true, False );
              memo1.lines.add('Segundo archivo descargado....');
              Get( ExtractFileName( smlistasimilar ), smlistasimilar, true, False );
              memo1.lines.add('Tercer archivo descargado....');
              Get( ExtractFileName( smsimilar ), smsimilar, true, False );
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

   end;


  FDMemTable1.LoadFromFile(sminventario,sfAuto);
  FDMemTable2.LoadFromFile(smempaque,sfAuto);

  SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
  SQLRED.SQL.Add('delete from inventario');
  SQLRED.ExecSQL;

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    producto_aux:= FDMemTable1['producto'];
    //COMPONGO LA LETRA Ñ PORQUE NO LA DESCARGA BIEN MERCADO
    if 'AUGC-940427-UB1' = modulo.QryExtras['rfc'] then
     begin
      //producto_aux:= FDMemTable1['producto'];
      for I := 1 to LENGTH(producto_aux) do
        if producto_aux[I]='Ã' then
        BEGIN
          producto_aux[I]:='Ñ';
          delete (producto_aux,I+1,1);
          break;
        END;
     end;
    SQLRED.SQL.Clear;
    if FDMemTable1['facturable']= null then
        SQLRED.SQL.Add('insert into INVENTARIO values('+quotedstr(FDMemTable1['clave'])+','+quotedstr(producto_aux)+','+inttostr(FDMemTable1['iva'])+','+quotedstr(FDMemTable1['usuario'])+','+quotedstr(formatdatetime('mm/dd/yyyy', FDMemTable1['fecha']))+','+inttostr(FDMemTable1['ieps'])+','+quotedstr('SI')+')')
    else
                                                                       //clave                         producto                             iva                     USUARIO                                     fecha             ieps
        SQLRED.SQL.Add('insert into INVENTARIO values('+quotedstr(FDMemTable1['clave'])+','+quotedstr(producto_aux)+','+inttostr(FDMemTable1['iva'])+','+quotedstr(FDMemTable1['usuario'])+','+quotedstr(formatdatetime('mm/dd/yyyy', FDMemTable1['fecha']))+','+inttostr(FDMemTable1['ieps'])+','+quotedstr(FDMemTable1['facturable'])+')');
    SQLRED.ExecSQL;

    FDMemTable1.Next;
  end;
  memo1.lines.add('INSERTE EN INVENTARIO');

  SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
  SQLRED.SQL.Add('delete from inventario_empaque');
  SQLRED.ExecSQL;

  FDMemTable2.First;
  while not FDMemTable2.Eof do
  begin
    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into INVENTARIO_EMPAQUE(clave,empaque,precio,piezas,barras,id) values('+quotedstr(FDMemTable2['clave'])+','+quotedstr(FDMemTable2['empaque'])+','+floattostr(FDMemTable2['precio'])+','+inttostr(FDMemTable2['piezas'])+','+quotedstr(FDMemTable2['barras'])+','+quotedstr(FDMemTable2['id'])+')');
    SQLRED.ExecSQL;

    FDMemTable2.Next;

  end;
  memo1.lines.add('INSERTE EN EMPAQUES');



  FDMemTable1.LoadFromFile(smlistasimilar,sfJSON);
  FDMemTable2.LoadFromFile(smsimilar,sfJSON);




  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from lista_similar');
  SQLRED.ExecSQL;

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    producto_aux:= FDMemTable1['descripcion'];
  //COMPONGO LA LETRA Ñ PORQUE NO LA DESCARGA BIEN MERCADO
    if 'AUGC-940427-UB1' = modulo.QryExtras['rfc'] then
     begin
      producto_aux:= FDMemTable1['descripcion'];
      for I := 1 to LENGTH(producto_aux) do
        if producto_aux[I]='Ã' then
        BEGIN
          producto_aux[I]:='Ñ';
          delete (producto_aux,I+1,1);
          break;
        END;
     end;

    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into lista_similar values('+quotedstr(FDMemTable1['clave'])+','+quotedstr(producto_aux)+')');
    SQLRED.ExecSQL;

    FDMemTable1.Next;

  end;

  memo1.lines.add('INSERTE EN LISTA SIMILARES');


  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from similar');
  SQLRED.ExecSQL;

  FDMemTable2.First;
  while not FDMemTable2.Eof do
  begin
    producto_aux:= FDMemTable2['PRODUCTO'];
    //COMPONGO LA LETRA Ñ PORQUE NO LA DESCARGA BIEN MERCADO
    if 'AUGC-940427-UB1' = modulo.QryExtras['rfc'] then
     begin
      producto_aux:= FDMemTable2['PRODUCTO'];
      for I := 1 to LENGTH(producto_aux) do
        if producto_aux[I]='Ã' then
        BEGIN
          producto_aux[I]:='Ñ';
          delete (producto_aux,I+1,1);
          break;
        END;
     end;

    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into similar values('+quotedstr(FDMemTable2['clave'])+','+quotedstr(producto_aux)+')');
    SQLRED.ExecSQL;

    FDMemTable2.Next;
  end;

  memo1.lines.add('INSERTE EN SIMILARES');

  //actualizar fecha local por la API
  actualizacion_fecha_local;

  modulo.qryinventario.Active:=false;modulo.qryinventario.Active:=true;
  MODULO.Conector.Commit;
  MessageDlg('Proceso de FTP descarga Finalizado', mtConfirmation , [mbok], 0);

end;

procedure TFinventario_nube.SpeedButton3Click(Sender: TObject);
begin
  FDMemTable1.LoadFromFile('C:\inventario\SMinventario.json',sfJSON);
  FDMemTable2.LoadFromFile('C:\inventario\SMempaque.json',sfJSON);
  memo1.Clear;

  SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
  SQLRED.SQL.Add('delete from inventario');
  SQLRED.ExecSQL;

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
    SQLRED.SQL.Add('insert into INVENTARIO values('+quotedstr(FDMemTable1['clave'])+','+quotedstr(FDMemTable1['producto'])+','+inttostr(FDMemTable1['iva'])+','+quotedstr(FDMemTable1['usuario'])+','+quotedstr(formatdatetime('mm/dd/yyyy', FDMemTable1['fecha']))+','+inttostr(FDMemTable1['ieps'])+','+quotedstr(FDMemTable1['facturable'])+')');
    SQLRED.ExecSQL;

    FDMemTable1.Next;

  end;

  memo1.lines.add('Inventario actualizado....');

  SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
  SQLRED.SQL.Add('delete from inventario_empaque');
  SQLRED.ExecSQL;

  FDMemTable2.First;
  while not FDMemTable2.Eof do
  begin
    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into INVENTARIO_EMPAQUE(clave,empaque,precio,piezas,barras,id) values('+quotedstr(FDMemTable2['clave'])+','+quotedstr(FDMemTable2['empaque'])+','+floattostr(FDMemTable2['precio'])+','+inttostr(FDMemTable2['piezas'])+','+quotedstr(FDMemTable2['barras'])+','+quotedstr(FDMemTable2['id'])+')');
    SQLRED.ExecSQL;

    FDMemTable2.Next;
  end;

  FDMemTable1.LoadFromFile('C:\inventario\SMlista_similar.json',sfJSON);
  FDMemTable2.LoadFromFile('C:\inventario\SMsimilar.json',sfJSON);
  memo1.Clear;

  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from lista_similar');
  SQLRED.ExecSQL;

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into lista_similar values('+quotedstr(FDMemTable1['clave'])+','+quotedstr(FDMemTable1['descripcion'])+')');
    SQLRED.ExecSQL;

    FDMemTable1.Next;

  end;

  memo1.lines.add('Similares actualizado....');

  SQLRED.SQL.Clear;                                        //clave                         producto                             iva                     USUARIO                                     fecha             ieps
  SQLRED.SQL.Add('delete from similar');
  SQLRED.ExecSQL;

  FDMemTable2.First;
  while not FDMemTable2.Eof do
  begin
    SQLRED.SQL.Clear;
    SQLRED.SQL.Add('insert into similar values('+quotedstr(FDMemTable2['clave'])+','+quotedstr(FDMemTable2['producto'])+')');
    SQLRED.ExecSQL;

    FDMemTable2.Next;
  end;


  modulo.qryinventario.Active:=false;modulo.qryinventario.Active:=true;
  memo1.lines.add('Empaques actualizados....');
  MODULO.Conector.Commit;

  MessageDlg('Se actualizó correctamente el inventario', mtConfirmation , [mbok], 0);
  memo1.Clear;
  MODULO.Conector.Commit;

  ultimos_actualizados;
end;

procedure TFinventario_nube.SpeedButton4Click(Sender: TObject);
var
  JSo :  TJSONObject;
  JSOarray : TJSONArray;
  JSOValue: TJSONValue;
  remitente, destinatario, mensaje, estado: string;
  folio,folio_agente:integer;
begin
  memo1.Clear;
  memo1.lines.add('Inicia actualizacion de invetario');


  //------------------  Inventario ---------------------------------
  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from inventario');
  SQLRED.ExecSQL;
  qryActualizados.Close;

  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/inventario'
  else
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/papel_inventario';

  moduloAPI.RequestGet.Execute;

  modulo.qryinventario.Open('select * from inventario');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.ResponseGet.Content);

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.qryinventario.Append;
    modulo.qryinventario['clave']:=JSo.Values['clave'].value;
    modulo.qryinventario['producto']:=JSo.Values['producto'].value;
    modulo.qryinventario['iva']:=JSo.Values['iva'].value;
    modulo.qryinventario['usuario']:=JSo.Values['usuario'].value;
    modulo.qryinventario['fecha']:=JSo.Values['fecha'].value;
    modulo.qryinventario['ieps']:=JSo.Values['ieps'].value;

    modulo.qryinventario.Post;
  end;
  memo1.Lines.Add(timetostr(time)+': Inventario cargado');

  //------------------  Empaques ---------------------------------
  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from inventario_empaque');
  SQLRED.ExecSQL;

  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/empaque'
  else
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/papel_empaque';

  moduloAPI.RequestGet.Execute;

  modulo.qryinventario.Open('select * from inventario_empaque');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.ResponseGet.Content);

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.qryinventario.Append;
    modulo.qryinventario['clave']:=JSo.Values['clave'].value;
    modulo.qryinventario['clave']:=JSo.Values['clave'].value;
    modulo.qryinventario['empaque']:=JSo.Values['empaque'].value;
    if JSo.Values['empaque'].value = 'SEIS' then
      modulo.qryinventario['empaque']:='6';
    if JSo.Values['empaque'].value = 'DOCE' then
      modulo.qryinventario['empaque']:='12';
    modulo.qryinventario['precio']:=JSo.Values['precio'].value;
    modulo.qryinventario['piezas']:=JSo.Values['piezas'].value;
    modulo.qryinventario['barras']:=JSo.Values['barras'].value;
    modulo.qryinventario['id']:=JSo.Values['id'].value;
    modulo.qryinventario.Post;
  end;
  memo1.Lines.Add(timetostr(time)+': Empaques cargado');

  //actualizamos ultima_actualizacion local
  actualizacion_fecha_local;
  showmessage('ya se actualizo lo suficiente, pueden continuar con las notas ');


  //------------------  Lista Similares ---------------------------------
  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from lista_similar');
  SQLRED.ExecSQL;

  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/listasimilar'
  else
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/papel_listasimilar';

  moduloAPI.RequestGet.Execute;

  modulo.qryinventario.Open('select * from lista_similar');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.ResponseGet.Content);

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.qryinventario.Append;
    modulo.qryinventario['clave']:=JSo.Values['clave'].value;
    modulo.qryinventario['descripcion']:=JSo.Values['descripcion'].value;
    modulo.qryinventario.Post;
  end;
  memo1.Lines.Add(timetostr(time)+': Lista similar cargado');

//------------------  Similares ---------------------------------
  SQLRED.SQL.Clear;
  SQLRED.SQL.Add('delete from similar');
  SQLRED.ExecSQL;

  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/similares'
  else
    moduloapi.RestGet.BaseURL:='https://vercel-api-eta.vercel.app/api/papel_similares';

  moduloAPI.RequestGet.Execute;

  modulo.qryinventario.Open('select * from similar');

  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.ResponseGet.Content);

  JSOarray := JSOValue as TJSONArray;

  for JSOValue in JSOarray do
  begin
    JSo := TJSONObject.ParseJSONValue(JSOValue.ToJSON) as TJSONObject;
    modulo.qryinventario.Append;
    modulo.qryinventario['clave']:=JSo.Values['clave'].value;
    modulo.qryinventario['producto']:=JSo.Values['producto'].value;
    modulo.qryinventario.Post;
  end;
  memo1.Lines.Add(timetostr(time)+': Similares cargado');
  modulo.qryinventario.Open('select * from inventario');

  memo1.Lines.Add(timetostr(time)+': Similares cargado');


  memo1.Lines.Add('');
  memo1.Lines.Add('**-----------------------------**');
  memo1.Lines.Add(timetostr(time)+': Proceso terminado');
  ultimos_actualizados;
end;

procedure TFinventario_nube.ultimos_actualizados;
var
  jsonText, fecha_anterior, nfecha:string;
  JSOValue: TJSONValue;
begin
  //Obtengo el valor de la ultima fecha para ponerla como fecha anterior
  moduloAPI.Requestfecha.Execute;
  JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.Responsefecha.Content);
  fecha_anterior:=(((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('fecha_anterior').JSONValue.Value);

  nfecha :=formatdatetime('mm/dd/yyyy HH:nn:ss', strtodatetime(fecha_anterior));
  qryActualizados.Open('select producto from inventario where fecha > '+quotedstr(nfecha));
end;

end.


