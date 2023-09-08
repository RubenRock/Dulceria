unit Udatos2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFdatos2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Sqlred: TFDQuery;
    Label1: TLabel;
    Label2: TLabel;
    precio: TEdit;
    cantidad: TMaskEdit;
    eprodu: TEdit;
    GRIDPRODUCTOS: TDBGrid;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListaClick(Sender: TObject);
    procedure eproduChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure seleccionar_producto;
    procedure obtener_total;
    procedure GRIDPRODUCTOSCellClick(Column: TColumn);
    procedure GRIDPRODUCTOSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDEMPAQUECellClick(Column: TColumn);
    procedure GRIDEMPAQUEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eproduKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GRIDPRODUCTOSEnter(Sender: TObject);
    procedure GRIDPRODUCTOSExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GRIDPRODUCTOSMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure GRIDPRODUCTOSMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure GRIDEMPAQUEMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure GRIDEMPAQUEMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure GRIDPRODUCTOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDEMPAQUEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cantidadChange(Sender: TObject);
    procedure precioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdatos2: TFdatos2;

implementation

{$R *.dfm}

uses Umodulo, Uinventario, URecepciones, UVerificarUsuario;

procedure TFdatos2.seleccionar_producto;
begin
  if modulo.qryinventarioaux.RecordCount>0 then
  begin
    {//recepcion
    if frecepciones.Efolio.Enabled then
      precio.Text:='0.00'
    else }
     obtener_total; //devolucion
  end

end;

procedure TFdatos2.obtener_total;
begin

  //si es devolucion si debe poner precios
  //if not frecepciones.Efolio.Enabled then
  //begin

  if modulo.qryinventarioaux.RecordCount>0 then
  begin
    precio.Text:=modulo.qryinventarioaux['precio_uni'];

    if trim(cantidad.Text)='6' then
    begin
      IF (strtofloat(modulo.qryinventarioaux['precio_seis']) > 0) then
        precio.Text:=floattostr(strtofloat(modulo.qryinventarioaux['precio_seis'])/6);
    end;

    if trim(cantidad.Text)='12' then
    begin
      IF (strtofloat(modulo.qryinventarioaux['precio_doce']) > 0) then
        precio.Text:=floattostr(strtofloat(modulo.qryinventarioaux['precio_seis'])/12);
    end;
  end
  else
    precio.Text:='0.00';

  //end;
end;


procedure TFdatos2.precioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    //fverificausu.ShowModal;
      if fverificausu.verificar('remicambiar') then
        precio.ReadOnly:=false;
  end;
end;

procedure TFdatos2.Button1Click(Sender: TObject);
var
  bclave:boolean;
  entero:string;
  tot,pre:real;
begin
    if modulo.qryinventarioaux.RecordCount>0 then
      bclave:=true;
    entero:=trim(cantidad.Text);

    if frecepciones.Efolio.Enabled then//si es recepcion
      precio.ReadOnly:=false
    else
      precio.ReadOnly:=true; //si es devolucion

    //en devoluciones no acepta precio 0
    if ((frecepciones.Label1.Caption = 'CLIENTE:' )and (strtofloat(precio.Text)<=0)) then
    begin
      showmessage('datos incompletos');
      exit;
    end;

    if((strtoint(entero)>0)and(bclave))then
    begin
        tot:=strtofloat(precio.Text)*strtoint(entero);
        pre:=strtofloat(precio.Text);

        modulo.qryremiaux2.Append;

        modulo.qryremiaux2['IVA']:=0;//solo agrego al inventario no interesa si tiene iva
        modulo.qryremiaux2['total']:=Format('%0:2f',[tot]);
        modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);
        modulo.qryremiaux2['cantidad']:=strtoint(entero);
        modulo.qryremiaux2['empaque']:='.';
        modulo.qryremiaux2['clave_empaque']:='.';
        modulo.qryremiaux2['producto']:=modulo.qryinventarioaux['producto'];
        modulo.qryremiaux2['producto2']:=modulo.qryinventarioaux['producto'];
        modulo.qryremiaux2['clave']:=modulo.qryinventarioaux['clave'];
        modulo.qryremiaux2.Post;

        formshow(sender);
        frecepciones.total;

    end
    else
      showmessage('datos incompletos');
end;

procedure TFdatos2.Button2Click(Sender: TObject);
begin
  modulo.qryremiaux2.Cancel;
  eprodu.Clear;
  close;
end;

procedure TFdatos2.cantidadChange(Sender: TObject);
begin
  obtener_total;
end;

procedure TFdatos2.eproduChange(Sender: TObject);
begin
  modulo.qryinventarioaux.Filtered:=false;
  modulo.qryinventarioaux.Filter:='producto like '+quotedstr('%'+ eprodu.Text +'%');
  modulo.qryinventarioaux.Filtered:=true;

  seleccionar_producto;
end;

procedure TFdatos2.eproduKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then
    gridproductos.SetFocus;
end;

procedure TFdatos2.FormActivate(Sender: TObject);
begin
  if frecepciones.Efolio.Enabled then//si es recepcion
    precio.ReadOnly:=false
  else
    precio.ReadOnly:=true; //si es devolucion

end;

procedure TFdatos2.FormShow(Sender: TObject);
begin
  cantidad.Text:='1';eprodu.Clear;cantidad.SetFocus;precio.Clear;
  modulo.qryinventarioaux.Filtered:=false;
end;

procedure TFdatos2.GRIDEMPAQUECellClick(Column: TColumn);
begin
  obtener_total;
end;

procedure TFdatos2.GRIDEMPAQUEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  button1.Enabled:=false;
end;

procedure TFdatos2.GRIDEMPAQUEKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  button1.Enabled:=true;
  obtener_total;
end;

procedure TFdatos2.GRIDEMPAQUEMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  close;
end;

procedure TFdatos2.GRIDEMPAQUEMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  close;
end;

procedure TFdatos2.GRIDPRODUCTOSCellClick(Column: TColumn);
begin
  seleccionar_producto;
end;

procedure TFdatos2.GRIDPRODUCTOSEnter(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=clWindowText;
  GRIDPRODUCTOS.Font.Size:=10;
end;

procedure TFdatos2.GRIDPRODUCTOSExit(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=cl3DDkShadow;
  GRIDPRODUCTOS.Font.Size:=9;
end;

procedure TFdatos2.GRIDPRODUCTOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  button1.Enabled:=false;
end;

procedure TFdatos2.GRIDPRODUCTOSKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  button1.Enabled:=true;
  seleccionar_producto;

end;

procedure TFdatos2.GRIDPRODUCTOSMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  close;
end;

procedure TFdatos2.GRIDPRODUCTOSMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  close;
end;

procedure TFdatos2.ListaClick(Sender: TObject);
begin
  precio.Text:=modulo.qryinventarioaux['precio_uni'];
end;

end.
