unit Urepartos_modificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrepartos_modificar = class(TForm)
    grid: TDBGrid;
    Panel1: TPanel;
    Eliminar: TSpeedButton;
    label10: TLabel;
    nota: TLabel;
    procedure EliminarClick(Sender: TObject);
    PROCEDURE TOTAL;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepartos_modificar: TFrepartos_modificar;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFrepartos_modificar.FormActivate(Sender: TObject);
begin
  total;
end;

Procedure TFrepartos_modificar.TOTAL;
var
  suma:real;
begin
  suma:=0;
  modulo.Qryrepartos.First;
  while not modulo.Qryrepartos.Eof do
  begin
    if modulo.Qryrepartos['CONDICION']='PAGA AL RECIBIR' then
      suma:=suma+modulo.Qryrepartos['total'];
    if modulo.Qryrepartos['DESCRIPCION']='PAGA' then
      suma:=suma+modulo.Qryrepartos['total'];
    modulo.Qryrepartos.Next;
  end;
  nota.Caption:=Format('%0:2f',[suma]);
end;

procedure TFrepartos_modificar.EliminarClick(Sender: TObject);
begin
  if modulo.QryLista_reparto.RecordCount>0 then
    if MessageDlg('¿Estas seguro de eliminar esta nota de los repartos?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            modulo.Qryrepartos.Delete;
            total;
            modulo.QryLista_reparto.Edit;
            modulo.QryLista_reparto['total']:= nota.Caption;
            modulo.QryLista_reparto.Post;

          end;
end;

end.
