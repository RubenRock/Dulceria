unit UretiroEfectivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFretiroefectivo = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit0: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit10: TEdit;
    Imprimir: TSpeedButton;
    Panel3: TPanel;
    Label14: TLabel;
    LtotalVisible: TLabel;
    Label15: TLabel;
    Edit11: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Emanual: TEdit;
    Label16: TLabel;
    Qryretiros: TFDQuery;
    ltotal: TLabel;
    Bhistorial: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Edit0Change(Sender: TObject);
    procedure ObtenerTotal;
    procedure Limpiar;
    function ValidarCantidad(cantidad:String;dinero:real):real;
    procedure SpeedButton1Click(Sender: TObject);
    procedure EmanualChange(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure QryretirosAfterPost(DataSet: TDataSet);
    procedure imprimirRetiro(fecha:tdatetime);
    procedure BhistorialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fretiroefectivo: TFretiroefectivo;
  CantidadesCorrectas:boolean;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario, Ureportetiquet, UhistorialRetiros;

procedure TFretiroefectivo.BhistorialClick(Sender: TObject);
begin
  FhistorialRetiros.ShowModal;
end;

procedure TFretiroefectivo.Edit0Change(Sender: TObject);
begin
  ObtenerTotal;
end;

procedure TFretiroefectivo.EmanualChange(Sender: TObject);
var
  tot:real;
begin
  tot:=ValidarCantidad(emanual.Text,1);
  ltotal.Caption:=floattostr(tot);
  LtotalVisible.Caption:=floattostrf(tot,ffCurrency,20,2);
end;

procedure TFretiroefectivo.FormActivate(Sender: TObject);
begin
  Limpiar;
end;


procedure TFretiroefectivo.ImprimirClick(Sender: TObject);
var
  fecha:tdatetime;
begin
  try
    if strtofloat(ltotal.Caption) > 0 then
    begin
      fecha:=now;
      qryretiros.Open('select * from retiros');
      qryretiros.Append;
      qryretiros['fecha']:=fecha;
      qryretiros['cajero']:=Fverificausu.Lusuario.Caption;
      qryretiros['cantidad']:=ltotal.Caption;
      qryretiros.Post;
      imprimirRetiro(fecha);
      Limpiar;
    end
    else
      showmessage('la cantidad debe ser mayo a 0');

  except on E: Exception do
    showmessage('Error en la operacion: '+e.Message);
  end;
end;

procedure TFretiroefectivo.imprimirRetiro(fecha:tdatetime);
begin
  Freportetiquet.LRetiroRazon.Caption:=modulo.QryExtras['razon'];
  Freportetiquet.LretiroFecha.Caption:=datetimetostr(fecha);
  Freportetiquet.LRetiroTotal.Caption:=LtotalVisible.Caption;
  Freportetiquet.LretiroUsuario.Caption:=Fverificausu.Lusuario.Caption;

  modulo.Qryimpresora.Open('select * from impresora');
  freportetiquet.ReporteRetiros.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
    freportetiquet.ReporteRetiros.DeviceType:='Screen'
  else
    freportetiquet.ReporteRetiros.DeviceType:='Printer';

  freportetiquet.ReporteRetiros.Print;
end;

procedure TFretiroefectivo.Limpiar;
begin
  edit0.Text:='';edit1.Text:='';
  edit2.Text:='';edit3.Text:='';
  edit4.Text:='';edit5.Text:='';
  edit6.Text:='';edit7.Text:='';
  edit8.Text:='';edit9.Text:='';
  edit10.Text:='';edit11.Text:='';
  Emanual.Clear;ltotal.Caption:='0';
  LtotalVisible.Caption:='0';
  edit0.SetFocus;
end;

procedure TFretiroefectivo.ObtenerTotal;
var
  tot:real;
begin
  tot:=ValidarCantidad(edit0.Text,1000)+ValidarCantidad(edit1.Text,500)+ValidarCantidad(edit2.Text,200)+
  ValidarCantidad(edit3.Text,100)+ValidarCantidad(edit4.Text,50)+ValidarCantidad(edit5.Text,20)+
  ValidarCantidad(edit6.Text,20)+ValidarCantidad(edit7.Text,10)+ValidarCantidad(edit8.Text,5)+
  ValidarCantidad(edit9.Text,2)+ValidarCantidad(edit10.Text,1)+ValidarCantidad(edit11.Text,0.5);

  ltotal.Caption:=floattostr(tot);
  LtotalVisible.Caption:=floattostrf(tot,ffCurrency,20,2);
end;

procedure TFretiroefectivo.QryretirosAfterPost(DataSet: TDataSet);
begin
  modulo.Conector.Commit;
end;

procedure TFretiroefectivo.SpeedButton1Click(Sender: TObject);
begin
  limpiar;
end;

function TFretiroefectivo.ValidarCantidad(cantidad:String;dinero:real):real;
begin
  try
    if (length(trim(cantidad))>0) or (trim(cantidad)<>'') then
      ValidarCantidad:=strtoint(cantidad)*dinero
    else
      ValidarCantidad:=0;
  except on E: Exception do
    showmessage('cantidad incorrecta');
  end;

end;

end.
