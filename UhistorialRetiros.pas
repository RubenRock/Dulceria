unit UhistorialRetiros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TFhistorialRetiros = class(TForm)
    PanelBotones: TPanel;
    imprimir: TSpeedButton;
    DBGrid1: TDBGrid;
    Qryretiros: TFDQuery;
    DsRetiros: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FhistorialRetiros: TFhistorialRetiros;

implementation

{$R *.dfm}

uses Umodulo, Ureportetiquet;

procedure TFhistorialRetiros.FormActivate(Sender: TObject);
begin
  qryretiros.Open('select * from retiros order by fecha desc');
end;

procedure TFhistorialRetiros.imprimirClick(Sender: TObject);
begin
  Freportetiquet.LRetiroRazon.Caption:=modulo.QryExtras['razon'];
  Freportetiquet.LretiroFecha.Caption:=qryretiros['fecha'];
  Freportetiquet.LRetiroTotal.Caption:=floattostrf(strtofloat(qryretiros['cantidad']),ffCurrency,20,2);
  Freportetiquet.LretiroUsuario.Caption:=qryretiros['cajero'];

  modulo.Qryimpresora.Open('select * from impresora');
  freportetiquet.ReporteRetiros.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
    freportetiquet.ReporteRetiros.DeviceType:='Screen'
  else
    freportetiquet.ReporteRetiros.DeviceType:='Printer';

  freportetiquet.ReporteRetiros.Print;
end;

end.
