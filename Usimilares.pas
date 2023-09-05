unit Usimilares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFsimilares = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Eproducto: TEdit;
    GridEmpaque: TDBGrid;
    DBGrid1: TDBGrid;
    LCLAVE: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Qrysimilar: TFDQuery;
    Dssimilar: TDataSource;
    QryAux: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure bguardar2Click(Sender: TObject);
    procedure EproductoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure verificar_productos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsimilares: TFsimilares;
  valido:boolean;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFsimilares.verificar_productos;
var
  campos,precios:string;
begin
  //validamos que el producto que vamos agregar tenga los mismos datos
  //de precios y empaques

      Qrysimilar.First;
      qryaux.Active:=false;
      qryaux.SQL.Clear;
      qryaux.SQL.Add('select sum(precio)as precio,count(clave)as campos from inventario_empaque where clave ='+quotedstr(Qrysimilar['clave']));
      qryaux.Active:=true;
      CAMPOS:= qryaux['campos'];
      precios:=qryaux['precio'];

      Qrysimilar.First;
      qryaux.Active:=false;
      qryaux.SQL.Clear;
      qryaux.SQL.Add('select sum(precio)as precio,count(clave)as campos from inventario_empaque where clave ='+quotedstr(MODULO.qryinventarioaux['clave']));
      qryaux.Active:=true;

      valido:=(INTTOSTR(qryaux['campos'])=campos)and(FLOATTOSTR(qryaux['precio'])=precios);
end;

procedure TFsimilares.bguardar2Click(Sender: TObject);
begin
  if trim(eproducto.Text)<>'' then
  begin
    modulo.QryListaSimilar.Append;
    modulo.QryListaSimilar['descripcion']:=trim(eproducto.Text);
    modulo.QryListaSimilar.Post;
  end;
end;

procedure TFsimilares.EproductoChange(Sender: TObject);
begin
  if trim(EPRODUCTO.Text)='' then
    MODULO.qryinventarioaux.Open('select * from inventario order by producto')
  else
    modulo.qryinventarioaux.Open('select * from inventario where producto like '+quotedstr('%'+ EPRODUCTO.Text +'%')+ ' order by PRODUCTO' );
end;

procedure TFsimilares.FormActivate(Sender: TObject);
begin
  modulo.qryinventarioaux.Filtered:=false;
  EPRODUCTO.Clear;
  MODULO.qryinventarioaux.Open('select * from inventario order by producto');
  modulo.QrySimilar.Open('select * from similar');
  Qrysimilar.Open('select inventario.clave, similar.clave as clavesimi,inventario.producto, similar.producto as productosimi from '+
              'inventario,similar where inventario.clave = similar.producto and '+
              'similar.clave = '+quotedstr(lclave.Caption)+'order by inventario.producto');
end;

procedure TFsimilares.SpeedButton1Click(Sender: TObject);
begin
  if modulo.qryinventario.RecordCount>0 then
  begin
    if modulo.QrySimilar.Locate('clave;producto', VarArrayOf([lclave.Caption,MODULO.qryinventarioaux['clave']]), []) then
    begin
      showmessage('Ya esta agregado este producto');
      exit;
    end;

    valido:=true;
    if qrysimilar.RecordCount>0 then
    begin
      verificar_productos;
      if not valido then
      begin
        showmessage('Este producto no es similar');
        exit;
      end;
    end;

    modulo.QrySimilar.Append;
    modulo.QrySimilar['clave']:=lclave.Caption;
    modulo.QrySimilar['producto']:=MODULO.qryinventarioaux['clave'];
    modulo.QrySimilar.Post;
    Qrysimilar.Close;Qrysimilar.Open;
  end;
end;

procedure TFsimilares.SpeedButton2Click(Sender: TObject);
begin
  if QrySimilar.RecordCount>0 then
  begin
    if modulo.QrySimilar.Locate('clave;producto', VarArrayOf([lclave.Caption,QrySimilar['productosimi']]), []) then
      modulo.QrySimilar.Delete;
    Qrysimilar.Close;Qrysimilar.Open;
  end;
end;

end.
