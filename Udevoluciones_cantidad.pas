unit Udevoluciones_cantidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFdevoluciones_cantidad = class(TForm)
    Ecantidad: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure EcantidadKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdevoluciones_cantidad: TFdevoluciones_cantidad;

implementation

{$R *.dfm}

uses Umodulo, Udevoluciones;

procedure TFdevoluciones_cantidad.EcantidadKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_return then
  begin
    try
        strtoint(trim(ecantidad.Text));
        modulo.qryremiaux2.Edit;
        modulo.qryremiaux2['cantidad']:=trim(ecantidad.Text);
        modulo.qryremiaux2['total']:=floattostr(strtoint(trim(ecantidad.Text))*modulo.qryremiaux2['precio']);
        modulo.qryremiaux2.Post;
        fdevoluciones.total;
        close;
    except
        showmessage('Error al escribir la cantidad');
        ecantidad.SetFocus;
    end;
  end;

  if key = vk_escape then
    close;
end;

procedure TFdevoluciones_cantidad.FormActivate(Sender: TObject);
begin
  ecantidad.SetFocus;
end;

end.
