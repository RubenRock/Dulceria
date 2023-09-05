unit Uinventario_agregar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFinventario_agregar = class(TForm)
    Label8: TLabel;
    epiezas: TEdit;
    Sqlred: TFDQuery;
    QryEmpaque: TFDQuery;
    DsEmpaque: TDataSource;
    eclave: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Eproducto: TEdit;
    bguardar2: TSpeedButton;
    Label7: TLabel;
    Label9: TLabel;
    Eiva: TEdit;
    Eieps: TEdit;
    Label3: TLabel;
    eprecio_uni: TEdit;
    Label5: TLabel;
    eprecio_seis: TEdit;
    Label10: TLabel;
    eprecio_doce: TEdit;
    procedure EproductoExit(Sender: TObject);
    procedure bguardar2Click(Sender: TObject);
    procedure limpiar;
    procedure bquitarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EprecioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SqlredAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Finventario_agregar: TFinventario_agregar;
  existe:boolean=false;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario;

procedure TFinventario_agregar.limpiar;
begin
  eproducto.Clear;
  eprecio_uni.Clear;
  eprecio_seis.Clear;
  epiezas.Clear;
  eprecio_doce.Clear;
  eproducto.SetFocus;
  eprecio_uni.Text:= '0';
  eprecio_seis.Text:= '0';
  eprecio_doce.Text:= '0';
  eiva.Text:='0';
  eieps.Text:='0';
  epiezas.Text:= '0';
end;

procedure TFinventario_agregar.SqlredAfterPost(DataSet: TDataSet);
begin
  MODULO.conector.Commit;
end;

procedure TFinventario_agregar.bguardar2Click(Sender: TObject);
var
  nfecha:string;
begin
  if ((trim(eproducto.Text)<>'')and(trim(eprecio_uni.Text)<>'')and(trim(eprecio_seis.Text)<>'')and(trim(eprecio_doce.Text)<>'')and(trim(epiezas.Text)<>'')and(trim(eieps.Text)<>'')and(trim(eiva.Text)<>'')) then
  begin
    try
      StrToFloat(trim(eprecio_uni.Text));
      StrToFloat(trim(eprecio_seis.Text));
      StrToFloat(trim(eprecio_doce.Text));
      StrToInt(trim(eiva.Text));
      StrToInt(trim(eieps.Text));
      StrToInt(trim(epiezas.Text));
    except on E: Exception do
      begin
        showmessage('Estas poniendo datos incorrectos: '+E.Message);
        exit;
      end;
    end;

    modulo.QryListaSimilar.Open('select * from lista_similar');
    if modulo.QryListaSimilar.Locate('descripcion',trim(eproducto.Text),[]) then
    begin
      showmessage('Este nombre ya existe en lista de similares');
      exit;
    end;


    if not existe then
    begin
      nfecha :=formatdatetime('mm/dd/yyyy HH:nn:ss', now);
      SQLRED.SQL.Clear;
      SQLRED.SQL.Add('insert into INVENTARIO (clave, producto, precio_uni, precio_seis, precio_doce, existencia, iva, piezas, relacionpz, usuario, fecha, ieps) values('+
                      quotedstr(eclave.Caption)+','+
                      quotedstr(trim(eproducto.Text))+','+
                      quotedstr(trim(eprecio_uni.Text))+','+
                      quotedstr(trim(eprecio_seis.Text))+','+
                      quotedstr(trim(eprecio_doce.Text))+','+
                      quotedstr('1')+','+//existencia
                      trim(eiva.Text)+','+
                      quotedstr(trim(epiezas.Text))+','+
                      quotedstr('relacion')+','+ //relacionpz
                      quotedstr(fverificausu.Lusuario.Caption)+','+
                      quotedstr(nfecha)+','+
                      trim(eieps.Text)+')');
      SQLRED.ExecSQL;
      MODULO.qryinventario.Close;MODULO.qryinventario.Open;
      MODULO.qryinventarioaux.Close;MODULO.qryinventarioaux.Open;

      Finventario_agregar.Caption:= 'Actualizar inventario';
      showmessage('¡¡Articulo guardado!!');

      limpiar;
    end
    else
      showmessage('Producto existente');
  end
  else
    showmessage('Datos incompletos');

  Finventario_agregar.Caption:= 'Actualizar inventario';
end;

procedure TFinventario_agregar.bquitarClick(Sender: TObject);
begin
  if fverificausu.verificar('inveeliminar') then
    if qryempaque.RecordCount>0 then
      if MessageDlg('¿Deseas borrar este empaque?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            qryempaque.Delete;
          end;
end;

procedure TFinventario_agregar.EprecioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_return then
    bguardar2.Click;
end;

procedure TFinventario_agregar.EproductoExit(Sender: TObject);
begin
  existe:=false;
  sqlred.Open('select * from inventario where producto ='+ quotedstr(eproducto.Text));
  if sqlred.RecordCount>0 then
  begin
    showmessage('Producto ya existe en el sistema');
    existe:=true;
  end;
end;

procedure TFinventario_agregar.FormActivate(Sender: TObject);
begin
  limpiar;
end;

procedure TFinventario_agregar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryempaque.RecordCount>0 then
    if not MODULO.qryinventario.Locate('clave',eclave.Caption,[]) then
      bguardar2.Click;




end;

end.
