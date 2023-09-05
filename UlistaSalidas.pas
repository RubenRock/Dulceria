unit UlistaSalidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB;

type
  TFListaSalidas = class(TForm)
    PanelBotones: TPanel;
    Agregar: TSpeedButton;
    Modificar: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Ebuscar: TEdit;
    DBGrid1: TDBGrid;
    Eliminar: TSpeedButton;
    procedure AgregarClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaSalidas: TFListaSalidas;

implementation

{$R *.dfm}

uses Usalidas, Umodulo, UVerificarUsuario;

procedure TFListaSalidas.AgregarClick(Sender: TObject);
begin
  fsalidas.Panel.ShowHint:=TRUE;//BANDERA DE ALTAS
  fsalidas.ShowModal;
end;

procedure TFListaSalidas.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_RETURN then
  begin
    if trim(EBUSCAR.Text) <> '' then
      modulo.QrySalidas.Open('select * from SALIDAS where'+
                                ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || DESCRIPCION || '+QUOTEDSTR(' ')+ ' || CANTIDAD) like ' + quotedstr('%'+ ebuscar.Text +'%') +
                                ' ORDER BY FOLIO DESC rows 30')
    else
      modulo.QrySalidas.Open('select * from salidas order by folio desc ROWS 30');
  end;
end;

procedure TFListaSalidas.EliminarClick(Sender: TObject);
begin
  if modulo.QrySalidas.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('salimodificar') then
    begin
      MODULO.QrySalidas.Delete;
    end;
  end;
end;

procedure TFListaSalidas.ModificarClick(Sender: TObject);
begin
  if modulo.QrySalidas.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('salimodificar') then
    begin
      fsalidas.Efolio.Text:=modulo.QrySalidas['folio'];
      fsalidas.EMonto.Text:=modulo.QrySalidas['cantidad'];
      fsalidas.EDescripcion.Text:=modulo.QrySalidas['descripcion'];
      fsalidas.Fecha.Date:=modulo.QrySalidas['fecha'];
      fsalidas.Panel.ShowHint:=FALSE;
      fsalidas.ShowModal;
    end;
  end;
end;

end.
