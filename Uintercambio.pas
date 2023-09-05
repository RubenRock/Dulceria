unit Uintercambio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFintercambio = class(TForm)
    Panel1: TPanel;
    ECANTIDAD: TEdit;
    GridNota: TDBGrid;
    DBGrid1: TDBGrid;
    Qrynota: TFDQuery;
    Dsnota: TDataSource;
    Qrysimilar: TFDQuery;
    Dssimilar: TDataSource;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Lfolio: TLabel;
    Lnombre: TLabel;
    LTOTAL: TLabel;
    Label3: TLabel;
    QRYAUX: TFDQuery;
    Bactualizar: TSpeedButton;
    procedure GridNotaCellClick(Column: TColumn);
    procedure GridNotaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clicknota;
    procedure BactualizarClick(Sender: TObject);
    procedure GridNotaMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GridNotaEditButtonClick(Sender: TObject);
    procedure QrynotaAfterDelete(DataSet: TDataSet);
    procedure QrynotaAfterEdit(DataSet: TDataSet);
    procedure QrynotaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fintercambio: TFintercambio;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFintercambio.BactualizarClick(Sender: TObject);
begin
  if QRYNOTA['cantidad']<strtoint(ecantidad.Text) then
  begin
    showmessage('Cantidad incorrecta 1');
    exit;
  end;

  if strtoint(ecantidad.Text)<=0 then
  begin
    showmessage('Cantidad incorrecta 2');
    exit;
  end;


  if QRYNOTA['cantidad']=strtoint(ecantidad.Text) then
  begin
      modulo.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(qrysimilar['clave_1'])+' and empaque = '+quotedstr(qrynota['empaque']));
      if modulo.QryEmpaque['clave']<>null then
      begin
          // qrynota = tabla de remisiones
          qrynota.Edit;
          qrynota['clave']:= modulo.QryEmpaque['clave'];
          qrynota['clave_empaque']:= modulo.QryEmpaque['id'];
          qrynota['producto']:= qrysimilar['producto_1'];
          qrynota.Post;
          showmessage('Producto intercambiado');
      end
      else
        showmessage('No se puede intercambiar este producto')
  end;

  if QRYNOTA['cantidad']>strtoint(ecantidad.Text) then
  begin
      modulo.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(qrysimilar['clave_1'])+' and empaque = '+quotedstr(qrynota['empaque']));
      if modulo.QryEmpaque['clave']<>null then
      begin
          // qrynota = tabla de remisiones
          qrynota.Edit;
          qrynota['cantidad']:= qrynota['cantidad']- strtoint(ecantidad.Text);
          qrynota.Post;

          qrynota.Insert;
          qrynota['folio']:= lfolio.Caption;
          qrynota['cantidad']:= trim(ecantidad.Text);
          qrynota['producto']:= qrysimilar['producto_1'];
          qrynota['total']:= '0';
          qrynota['tipo']:= modulo.QryListaremision['impresion'];
          qrynota['empaque']:= modulo.QryEmpaque['empaque'];
          qrynota['clave']:= modulo.QryEmpaque['clave'];
          qrynota['clave_empaque']:= modulo.QryEmpaque['id'];
          qrynota.Post;
          showmessage('Producto intercambiado');
      end
      else
        showmessage('No se puede intercambiar este producto')



  end;



end;

procedure TFintercambio.clicknota;
begin
   ECANTIDAD.Text:=QRYNOTA['CANTIDAD'];

  if qrynota['clave_empaque']<> null then //elemento surtido sin clave
  begin
       try
           QRYAUX.Open('SELECT * FROM SIMILAR WHERE PRODUCTO = '+quotedstr(qrynota['clave']));
           if QRYAUX['clave']<> null then
            qrysimilar.Open('select * from similar, inventario where similar.clave = '+quotedstr(qryaux['clave'])+ ' and inventario.clave = similar.producto')
           else
            qrysimilar.Close;
       except on E: Exception do
        qrysimilar.Close;
       end;
  end
  else
    qrysimilar.Close;



end;

procedure TFintercambio.GridNotaCellClick(Column: TColumn);
begin
    clicknota;
end;

procedure TFintercambio.GridNotaEditButtonClick(Sender: TObject);
begin
  showmessage('derecho')
end;

procedure TFintercambio.GridNotaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  clicknota;
end;

procedure TFintercambio.GridNotaMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  close;
end;

procedure TFintercambio.QrynotaAfterDelete(DataSet: TDataSet);
begin
  modulo.conector.Commit;
end;

procedure TFintercambio.QrynotaAfterEdit(DataSet: TDataSet);
begin
  modulo.conector.Commit;
end;

procedure TFintercambio.QrynotaAfterPost(DataSet: TDataSet);
begin
  modulo.conector.Commit;
end;

end.
