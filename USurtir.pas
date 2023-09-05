unit USurtir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons;

type
  TFsurtir = class(TForm)
    panel1: TPanel;
    Lproducto: TLabel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Lpiezas: TLabel;
    GRIDEMPAQUE: TDBGrid;
    QryAux: TFDQuery;
    DsAux: TDataSource;
    Gridproductos: TDBGrid;
    Button1: TButton;
    Label2: TLabel;
    cantidad: TEdit;
    Label3: TLabel;
    Lpiezas_agregadas: TLabel;
    Agregar: TSpeedButton;
    Liva: TLabel;
    Lempaque: TLabel;
    Lclave: TLabel;
    Qryred: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure total_piezas;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AgregarClick(Sender: TObject);
    procedure GridproductosEnter(Sender: TObject);
    procedure GridproductosExit(Sender: TObject);
    procedure GRIDEMPAQUEEnter(Sender: TObject);
    procedure GRIDEMPAQUEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsurtir: TFsurtir;

implementation

{$R *.dfm}

uses Umodulo, Uremisiones, Udatos;

procedure TFsurtir.total_piezas;
var
  total:integer;
begin
  modulo.QrySurtir.First;
  total:=0;
  while not  modulo.QrySurtir.Eof do
  begin
    modulo.QryEmpaque.Locate('empaque',modulo.QrySurtir['empaque'],[]);
    total:=total+modulo.QrySurtir['cantidad']*modulo.QryEmpaque['piezas'];
    modulo.QrySurtir.Next;
  end;
  Lpiezas_agregadas.Caption:=inttostr(total);
  if strtoint(lpiezas_Agregadas.Caption)>strtoint(lpiezas.Caption) then
    showmessage('te has excedido en el numero de piezas');
end;

procedure TFsurtir.AgregarClick(Sender: TObject);
var
  tiempo, clave_prod:string;
begin
  if strtoint(lpiezas_Agregadas.Caption)>strtoint(lpiezas.Caption) then
    showmessage('te pasaste en el numero de piezas');

  if strtoint(lpiezas_Agregadas.Caption)<strtoint(lpiezas.Caption) then
    showmessage('te hace falta en el numero de piezas');

  if strtoint(lpiezas_Agregadas.Caption)=strtoint(lpiezas.Caption) then
    if modulo.QrySurtir.RecordCount>0 then
    begin
        //variable que identifica a todos los productos surtidos en este producto
        tiempo:=timetostr(time);

        modulo.qryremiaux2.Append;
        modulo.qryremiaux2['IVA']:=liva.Caption;
        modulo.qryremiaux2['total']:=Format('%0:2f',[strtofloat(fdatos.precio.Text)*strtoint(trim(fdatos.cantidad.Text))]);

        modulo.qryremiaux2['precio']:=Format('%0:2f',[strtofloat(fdatos.precio.Text)]);
        modulo.qryremiaux2['cantidad']:=strtoint(trim(fdatos.cantidad.Text));
        modulo.qryremiaux2['producto']:=lproducto.Caption;
        modulo.qryremiaux2['empaque']:='--'+lempaque.Caption;
        modulo.qryremiaux2['producto2']:='--'+lempaque.Caption+' '+LPRODUCTO.Caption;
        modulo.qryremiaux2['clave']:=modulo.qryinventarioaux['clave'];
        modulo.qryremiaux2['surtir']:=tiempo;
        modulo.qryremiaux2.Post;


        modulo.QrySurtir.First;
        while not modulo.QrySurtir.Eof do
        begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['IVA']:=liva.Caption;
          modulo.qryremiaux2['total']:='0';
          modulo.qryremiaux2['precio']:='0';
          modulo.qryremiaux2['cantidad']:=modulo.QrySurtir['cantidad'];
          modulo.qryremiaux2['producto']:=modulo.QrySurtir['producto'];
          modulo.qryremiaux2['empaque']:=modulo.QrySurtir['empaque'];
          modulo.qryremiaux2['producto2']:='      '+modulo.QrySurtir['empaque']+' '+modulo.QrySurtir['producto'];
          qryred.Open('select clave from inventario where producto = '+quotedstr(modulo.QrySurtir['producto']));
          modulo.qryremiaux2['clave']:=qryred['clave'];
          clave_prod:=qryred['clave'];
          qryred.Open('select id from inventario_empaque where clave = '+quotedstr(clave_prod)+' and empaque = '+quotedstr(modulo.QrySurtir['empaque']));
          modulo.qryremiaux2['clave_empaque']:=qryred['id'];
          modulo.qryremiaux2['surtir']:=tiempo;
          modulo.qryremiaux2.Post;

          modulo.QrySurtir.Next;
        end;

        fremisiones.total('NO');

        fremisiones.AgregarClick(sender);
        fdatos.seleccionar_producto;
        fdatos.CSurtir.Checked:=false;
        close;


    end;

end;

procedure TFsurtir.Button1Click(Sender: TObject);
begin
  if trim(cantidad.Text)<>'' then
  begin
    modulo.QrySurtir.Append;
    modulo.QrySurtir['cantidad']:= cantidad.Text;
    modulo.QrySurtir['producto']:= qryaux['producto'];
    modulo.QrySurtir['empaque']:= modulo.QryEmpaque['empaque'];
    modulo.QrySurtir['clave_empaque']:=modulo.QryEmpaque['id'];
    modulo.QrySurtir.Post;
    total_piezas;
    cantidad.Clear;
    cantidad.SetFocus;
  end;
end;

procedure TFsurtir.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if modulo.QrySimilar.RecordCount>0 then
    if KEY = VK_DELETE then
    begin
      modulo.QrySurtir.Delete;
      total_piezas;
    end;
end;

procedure TFsurtir.FormActivate(Sender: TObject);
begin
  modulo.QrySurtir.Close;
  modulo.QrySurtir.SQL.Clear;
  modulo.QrySurtir.SQL.Add('delete from surtir');
  modulo.QrySurtir.ExecSQL;


  modulo.QrySurtir.Open('select * from surtir');

  qryaux.Open('select INVENTARIO.producto from inventario, similar, lista_similar where '+
       'similar.PRODUCTO = inventario.CLAVE AND '+
       'lista_similar.CLAVE = similar.CLAVE AND '+
       'lista_similar.DESCRIPCION =  '+QUOTEDSTR(LPRODUCTO.Caption));

  Lpiezas_agregadas.Caption:='0';

  END;

procedure TFsurtir.GRIDEMPAQUEEnter(Sender: TObject);
begin
  GRIDEMPAQUE.Font.Color:=clWindowText;
  GRIDEMPAQUE.Font.Size:=10;
end;

procedure TFsurtir.GRIDEMPAQUEExit(Sender: TObject);
begin
  GRIDEMPAQUE.Font.Color:=cl3DDkShadow;
  GRIDEMPAQUE.Font.Size:=9;
end;

procedure TFsurtir.GridproductosEnter(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=clWindowText;
  GRIDPRODUCTOS.Font.Size:=10;
end;

procedure TFsurtir.GridproductosExit(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=cl3DDkShadow;
  GRIDPRODUCTOS.Font.Size:=9;
end;

end.
