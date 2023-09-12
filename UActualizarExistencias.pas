unit UActualizarExistencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFActualizarExistencias = class(TForm)
    Panel2: TPanel;
    Eproducto: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    Eexistencias: TEdit;
    Lclave: TLabel;
    BGuardar: TSpeedButton;
    QryAux: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure EexistenciasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FActualizarExistencias: TFActualizarExistencias;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFActualizarExistencias.BGuardarClick(Sender: TObject);
var
  new_existencia:integer;
begin
  if (length(trim(Eexistencias.Text))> 0) then
  begin
    try
      new_existencia := strtoint(Eexistencias.Text);
      QryAux.ExecSQL('update inventario set existencia = '+inttostr(new_existencia)+' where clave = '+quotedstr(Lclave.Caption));
      modulo.Conector.Commit;
      modulo.qryinventario.Open('select * from inventario order by producto');
    except on E: Exception do
      showmessage('Error en la cantidad: '+e.Message);
    end;
  end;

end;

procedure TFActualizarExistencias.EexistenciasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BGuardar.Click;
end;

procedure TFActualizarExistencias.FormActivate(Sender: TObject);
begin
  Eexistencias.SetFocus;
end;

end.
