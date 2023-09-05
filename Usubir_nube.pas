unit Usubir_nube;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,IdHTTP,idftp,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdAttachment,IdAttachmentFile;

type
  TFSubir_nube = class(TForm)
    Bsubir: TSpeedButton;
    Memo1: TMemo;
    Label1: TLabel;
    FDMemTable1: TFDMemTable;
    Dsmemtable: TDataSource;
    Sqlred: TFDQuery;
    Dsmemtable2: TDataSource;
    FDMemTable2: TFDMemTable;
    SMTP: TIdSMTP;
    mailMensaje: TIdMessage;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    Bagentes: TSpeedButton;
    procedure BsubirClick(Sender: TObject);
    procedure mandar_mail;
    procedure BagentesClick(Sender: TObject);
    //crtl+shift+C  crea mas rapido el procedimiento
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSubir_nube: TFSubir_nube;


implementation

{$R *.dfm}

uses Umodulo, Uinventario_nube, UVerificarUsuario, Uagentesfirebase, Uproyecto;

procedure TFSubir_nube.mandar_mail;
VAR
  Attachment: TIdAttachment;
begin
  try
    smtp.Host:='smtp.gmail.com'; showmessage('host');
    smtp.IOHandler:=SSL;                             showmessage('ssl');
    smtp.Username:='laherradura.margaritas@gmail.com';               showmessage('mail');
    smtp.Password:='Abarrotes1';                                                      showmessage('password');
    smtp.Port:=587;
    smtp.UseTLS:= utUseExplicitTLS;



    mailMensaje.Subject :='actualizacion de  inventario '+datetimetostr(now);//asunto
    mailMensaje.Recipients.EMailAddresses := 'ramses673@hotmail.com';
    //mailMensaje.Body := memo1.Lines;
    mailMensaje.Body.Add('Actualizo: '+Fverificausu.Lusuario.Caption);
    mailMensaje.Body.Add('Desde: '+modulo.QryExtras['razon']);

    //Attachment := TIdAttachmentFile.Create(mailMensaje.MessageParts, 'C:\inventario\inventario_empaque.json');
    Attachment := TIdAttachmentFile.Create(mailMensaje.MessageParts, Application.GetNamePath+modulo.QryExtras['INVENTARIO']);
    Attachment := TIdAttachmentFile.Create(mailMensaje.MessageParts, Application.GetNamePath+modulo.QryExtras['EMPAQUE']);
    Attachment := TIdAttachmentFile.Create(mailMensaje.MessageParts, Application.GetNamePath+modulo.QryExtras['LISTA_REMISION']);
    Attachment := TIdAttachmentFile.Create(mailMensaje.MessageParts, Application.GetNamePath+modulo.QryExtras['REMISIONES']);

    try
      smtp.Connect;
      showmessage('conectar');
      smtp.Send(mailMensaje);

    finally
      smtp.Disconnect(true);
      //showmessage('Correcto');

    end;


  except
    on e:exception do
      showmessage(e.Message);

  end;
end;

procedure TFSubir_nube.BagentesClick(Sender: TObject);
begin

  memo1.Clear;
//  if modulo.QryExtras['verificar_fecha']=1 then
//    if not fprincipal.checar_fecha_actualizacion then  // avisa si falta actualizar el inventario
//        exit;

  memo1.Lines.Add(timetostr(time)+': Inicio');
  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
  begin
      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/inventario',
            'select * from inventario ORDER BY PRODUCTO',
            'inventario');
      memo1.Lines.Add(timetostr(time)+': Inventario');

      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/empaque',
            'select * from inventario_EMPAQUE ORDER BY id',
            'empaque');
      memo1.Lines.Add(timetostr(time)+': Empaques');

     FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/similares',
            'select * from similar order by clave',
            'similares');
     memo1.Lines.Add(timetostr(time)+': Similares');

      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/listasimilar',
            'select * from lista_similar order by clave',
            'listasimilar');
      memo1.Lines.Add(timetostr(time)+': Lista similares');

      FAgentesMongo.fecha('https://vercel-api-eta.vercel.app/api/fecha');
  end
  else
  begin
       FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/papel_inventario',
            'select * from inventario ORDER BY PRODUCTO',
            'inventario');
        memo1.Lines.Add(timetostr(time)+': Inventario');

      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/papel_empaque',
            'select * from inventario_EMPAQUE ORDER BY id',
            'empaque');
       memo1.Lines.Add(timetostr(time)+': Empaques');

     FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/papel_similares',
            'select * from similar order by clave',
            'similares');
      memo1.Lines.Add(timetostr(time)+': Similares');

      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/papel_listasimilar',
            'select * from lista_similar order by clave',
            'listasimilar');
       memo1.Lines.Add(timetostr(time)+': Lista de similares');

      FAgentesMongo.fecha('https://vercel-api-eta.vercel.app/api/papel_fecha');

  end;
  //mandar_mail;
  memo1.Lines.Add('');
  memo1.Lines.Add('**------------------------------------------**');
  memo1.Lines.Add(timetostr(time)+': Proceso terminado con exito');


end;

procedure TFSubir_nube.BsubirClick(Sender: TObject);
var
  F: TextFile;
  sminventario,smempaque,smfecha,smlistasimilar,smsimilar:string;
  texto1: TStringList;
begin
  // variables de los archivos en la nube
  modulo.QryExtras.Open('select * from extras');
  sminventario:=modulo.QryExtras['inventario'];
  smempaque:=modulo.QryExtras['empaque'];
  smfecha:=modulo.QryExtras['fecha'];
  smlistasimilar:='SL'+modulo.QryExtras['inventario'];
  smsimilar:='SI'+modulo.QryExtras['inventario'];

  sqlred.Open('select * from inventario');
  sqlred.SaveToFile(sminventario,sfJSON);
  sqlred.Open('select * from inventario_empaque');
  sqlred.SaveToFile(smempaque,sfJSON);
  sqlred.Open('select * from lista_similar');
  sqlred.SaveToFile(smlistasimilar,sfJSON);
  sqlred.Open('select * from similar');
  sqlred.SaveToFile(smsimilar,sfJSON);

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


       //** Actualizar la fecha del inventario en la nube
        AssignFile( F, modulo.QryExtras['direc_fecha'] );
        Rewrite( F );
        WriteLn( F, datetimetostr(now));
        CloseFile( F );
        //**************************************************

        showmessage('hola');

       try
          Application.ProcessMessages;
          memo1.lines.add('Iniciando carga de archivos....');
          Put((Application.GetNamePath)+sminventario, ExtractFileName((Application.GetNamePath)+sminventario),False);
          memo1.lines.add('Primer archivo agregado....');
          Put((Application.GetNamePath)+smempaque, ExtractFileName((Application.GetNamePath)+smempaque),False);
          memo1.lines.add('Segundo archivo agregado....');
          Put((Application.GetNamePath)+smlistasimilar, ExtractFileName((Application.GetNamePath)+smlistasimilar),False);
          memo1.lines.add('Tercero archivo agregado....');
          Put((Application.GetNamePath)+smsimilar, ExtractFileName((Application.GetNamePath)+smsimilar),False);
          memo1.lines.add('Cuarto archivo agregado....');
          Put(modulo.QryExtras['direc_fecha'], smfecha,False);
          memo1.lines.add('Finalizando carga de archivos...');
       except
          on e:exception do
          begin
             memo1.Font.Color:=clRed;
             memo1.lines.add('Error en FTP carga: ' + e.message);
             MessageDlg('Proceso de FTP Upload Finalizo con Error', mtError , [mbok], 0);
             exit;
          end;
       end;
       //mandar_mail;
       MessageDlg('Proceso de actualizacion Finalizado', mtConfirmation , [mbok], 0);


      MODULO.Conector.Commit;
   finally
      free;
   end;
end;

end.
