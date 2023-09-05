unit Uusuariosalta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFusuariosalta = class(TForm)
    GroupBox1: TGroupBox;
    txtusuario: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    txtcontra: TEdit;
    txtconfirmar: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure txtconfirmarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fusuariosalta: TFusuariosalta;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFusuariosalta.FormActivate(Sender: TObject);
begin
  txtusuario.Clear;
  txtcontra.Clear;
  txtconfirmar.Clear;
  TXTUSUARIO.SetFocus
end;

procedure TFusuariosalta.txtconfirmarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (trim(txtusuario.Text)<>'') then
  begin
      if txtcontra.Text = txtconfirmar.Text then
      begin
        if modulo.QryUsuarios.Locate('passwd',txtcontra.Text,[])then
        begin
          showmessage('Contraseña invalida');
          txtcontra.Clear;txtconfirmar.Clear;
          txtcontra.SetFocus;
        end
        else
        begin
          modulo.QryUsuarios.Append;
          modulo.QryUsuarios['Login']:=txtusuario.Text;
          modulo.QryUsuarios['passwd']:=txtcontra.Text;
          modulo.QryUsuarios.Post;
          showmessage('Usuario ' + txtusuario.Text + ' dado de alta');
          FormActivate(SENDER);
        end;
      end
      else
      begin
        showmessage('Las contraseñas no concuerdan');
        txtcontra.SetFocus;
      end;
  end
end;

end.
