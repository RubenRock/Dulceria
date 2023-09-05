unit Uusuariosmodificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TFusuariosmodificar = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtnvacontra: TEdit;
    txtconfirmar: TEdit;
    txtcontraante: TEdit;
    cmbusuario: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure txtconfirmarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fusuariosmodificar: TFusuariosmodificar;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFusuariosmodificar.FormActivate(Sender: TObject);
begin
  txtcontraante.Clear;
  txtnvacontra.Clear;
  txtconfirmar.Clear;
  cmbusuario.SetFocus;
end;

procedure TFusuariosmodificar.txtconfirmarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_return then
  begin
    if not(txtnvacontra.Text = txtconfirmar.Text) then
      showmessage('Las contraseñas no concuerdan')
    else
    begin
      if cmbusuario.KeyValue=txtcontraante.Text then
      begin
        modulo.QryUsuarios.Edit;
        modulo.QryUsuarios['passwd']:=txtconfirmar.Text;
        modulo.QryUsuarios.Post;
        modulo.QryUsuarios.Close;
        modulo.QryUsuarios.Open;

        showmessage('Se cambio correctamente la contraseña');
        formactivate(sender);
      end
      else
      begin
        showmessage('Contraseña anterior incorrecta');
        txtcontraante.SetFocus;
      end;
    end
  end;
end;

end.
