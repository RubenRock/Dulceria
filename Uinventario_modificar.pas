unit Uinventario_modificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFinventario_modificar = class(TForm)
    Sqlred: TFDQuery;
    QryEmpaque: TFDQuery;
    DsEmpaque: TDataSource;
    eclave: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    Eproducto: TEdit;
    bguardar2: TSpeedButton;
    LID: TLabel;
    Label8: TLabel;
    epiezas: TEdit;
    Button2: TButton;
    Label3: TLabel;
    eprecio_uni: TEdit;
    Label5: TLabel;
    eprecio_seis: TEdit;
    Label10: TLabel;
    eprecio_doce: TEdit;
    Eiva: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    Eieps: TEdit;
    procedure bguardar2Click(Sender: TObject);
    procedure limpiar;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SqlredAfterPost(DataSet: TDataSet);
    procedure SqlredAfterExecute(DataSet: TFDDataSet);
    procedure eprecio_uniKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Finventario_modificar: TFinventario_modificar;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario;

procedure TFinventario_modificar.limpiar;
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

procedure TFinventario_modificar.SqlredAfterExecute(DataSet: TFDDataSet);
begin
  MODULO.conector.Commit;
end;

procedure TFinventario_modificar.SqlredAfterPost(DataSet: TDataSet);
begin
  MODULO.conector.Commit;
end;

procedure TFinventario_modificar.bguardar2Click(Sender: TObject);
var
  nfecha:string;
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

  modulo.qryinventarioaux.Open('select * from inventario where clave <>'+quotedstr(eclave.Caption));
  if ((trim(eproducto.Text)<>'')and(trim(eprecio_uni.Text)<>'')and(trim(eprecio_seis.Text)<>'')and(trim(eprecio_doce.Text)<>'')and(trim(epiezas.Text)<>'')and(trim(eieps.Text)<>'')and(trim(eiva.Text)<>'')) then
  begin
    modulo.QryListaSimilar.Open('select * from lista_similar');
    if modulo.QryListaSimilar.Locate('descripcion',trim(eproducto.Text),[]) then
    begin
      showmessage('Este nombre ya existe en lista de similares');
      exit;
    end;

    if modulo.qryinventarioaux.Locate('producto',trim(eproducto.Text),[])then
    begin
      showmessage('Nombre de producto existente');exit;
    end;

    nfecha :=formatdatetime('mm/dd/yyyy HH:nn:ss', now);

    text:='update inventario set PRODUCTO = '+QUOTEDSTR(trim(eproducto.Text))+
          ', PRECIO_UNI = '+quotedstr(trim(eprecio_uni.Text))+
          ', PRECIO_SEIS = '+quotedstr(trim(eprecio_seis.Text))+
          ', PRECIO_DOCE = '+quotedstr(trim(eprecio_doce.Text))+
          ', iva = '+trim(eiva.Text)+
          ', PIEZAS = '+quotedstr(trim(epiezas.Text))+
          ', usuario = '+quotedstr(fverificausu.Lusuario.Caption)+
          ', fecha = '+quotedstr(nfecha)+
          ', IEPS = '+trim(eieps.Text)+
          ' WHERE clave = '+quotedstr(eclave.Caption);

    SQLRED.SQL.Clear;
    SQLRED.SQL.Add(text);
    SQLRED.ExecSQL;
    MODULO.qryinventario.Close;
    MODULO.qryinventario.Open;
    Finventario_modificar.Caption:= 'Actualizar inventario';
    showmessage('¡¡Articulo actualizado!!');

  end
  else
    showmessage('Datos incompletos');

  Finventario_modificar.Caption:= 'Actualizar inventario';

end;

procedure TFinventario_modificar.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFinventario_modificar.eprecio_uniKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_return then
      bguardar2.Click;
end;

procedure TFinventario_modificar.FormActivate(Sender: TObject);
begin
  modulo.QryListaSimilar.Open('select * from lista_similar');
  modulo.QrySimilar.Open('select * from similar');
  eprecio_uni.SetFocus;
end;

end.
