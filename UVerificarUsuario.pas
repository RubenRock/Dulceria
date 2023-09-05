unit UVerificarUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFverificausu = class(TForm)
    txtcontra: TEdit;
    Lusuario: TLabel;
    procedure FormActivate(Sender: TObject);
    function verificar(acceso:string):boolean;
    procedure txtcontraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fverificausu: TFverificausu;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFverificausu.FormActivate(Sender: TObject);
begin
  lusuario.Caption:='';
  txtcontra.Clear;
end;

function TFverificausu.verificar(acceso:string):boolean;
begin
  verificar:=false;
  if trim(txtcontra.Text) = '' then
    exit;
  if modulo.QryUsuarios.Locate('passwd',txtcontra.Text,[])then
  begin
    modulo.QryAccesos.Open('select * from accesos');
    if modulo.QryAccesos.Locate('login;acceso',VarArrayOf([modulo.QryUsuarios['Login'],acceso]),[]) then
      verificar:=true
    else
      showmessage('No tienes el acceso necesario para ejecutar esta accion ');
  end
  else
    showmessage('Usuario no valido');
end;

procedure TFverificausu.txtcontraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key =vk_return then
  begin
    modulo.QryUsuarios.Open('select * from usuarios');
    if modulo.QryUsuarios.Locate('passwd',txtcontra.Text,[])then
    begin
      {freportenotas.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freporteticket.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freporteticket.lblusuario2.Caption:=modulo.SetUsuarios['Login'];
      //freporteticket.lblusuario3.Caption:=modulo.SetUsuarios['Login'];
      freportevales.Usuario.Caption:=modulo.SetUsuarios['Login'];
      freporteabonos.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freporteabonos2.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freporterecepcion.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freporteticketcredito.lblusuario.Caption:=modulo.SetUsuarios['Login'];
      freportesinticket.lblusuario2.Caption:=modulo.SetUsuarios['Login'];}
      lusuario.caption:= modulo.QryUsuarios['Login'];
      close;
    end
    else
    begin
      showmessage('Usuario incorrecto');
      txtcontra.SetFocus;
    end
  end;

  if key = vk_escape then
  begin
    txtcontra.Clear;lusuario.caption:='';
    close;
  end;
end;

end.
