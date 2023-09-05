unit Utiponota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFtiponota = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    rdserie: TRadioButton;
    Txtcantidad: TEdit;
    Rdfolio: TRadioButton;
    fecha: TDateTimePicker;
    sqlred: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ftiponota: TFtiponota;

implementation

{$R *.dfm}

uses Uremisiones;

procedure TFtiponota.FormActivate(Sender: TObject);
var
  sfecha, nfecha,nfecha2: string;
begin
  sfecha:=datetostr(fecha.Date);
  nfecha:= sfecha[4]+sfecha[5]+'/'+sfecha[1]+sfecha[2]+'/'+sfecha[9]+sfecha[10];
  sfecha:=datetostr(fecha.Date+1);
  nfecha2:= sfecha[4]+sfecha[5]+'/'+sfecha[1]+sfecha[2]+'/'+sfecha[9]+sfecha[10];
  SQLRED.Close;SQLRED.Open('SELECT SUM(TOTAL)AS STOTAL FROM LISTA_FOLIOS WHERE FECHA >='+quotedstr(nfecha)+' and FECHA <'+quotedstr(nfecha2));
  txtcantidad.Text:='0';
  if SQLRED['STOTAL'] <> NULL then
    txtcantidad.Text:=SQLRED['STOTAL'];
end;

procedure TFtiponota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fremisiones.FormActivate(sender);
end;

end.
