unit Upago_creditos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFpago_creditos = class(TForm)
    Panel: TPanel;
    Agregar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Label3: TLabel;
    Ebuscar: TEdit;
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AgregarClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpago_creditos: TFpago_creditos;

implementation

{$R *.dfm}

uses Umodulo, Uestadocuenta, UAbonos;

procedure TFpago_creditos.AgregarClick(Sender: TObject);
var
  suma:real;
begin
  if modulo.QrylistaPagos.RecordCount>0 then
  begin

    modulo.QryAbonos.Close;
    modulo.QryAbonos.Open('select * from abonos where folio ='+quotedstr(modulo.QrylistaPagos['folio']));



    fabonos.Labono.Caption:=inttostr(modulo.QryAbonos.RecordCount+1);
    fabonos.Ldeuda.Caption:=MODULO.QrylistaPagos['TOTAL'];

    modulo.QryAbonos.CLOSE;
    modulo.QryAbonos.Open('select SUM(CAST(TOTAL AS DECIMAL(6,2))) as suma from abonos where folio = '+quotedstr(modulo.QrylistaPagos['folio']));
    fabonos.Ltotalabonado.Caption:='0';
    if modulo.QryAbonos['suma']<>NULL then
      fabonos.Ltotalabonado.Caption:=modulo.QryAbonos['suma'];

    modulo.QryDevoluciones.Close;
    modulo.QryDevoluciones.Open('SELECT SUM(CAST(TOTAL AS DECIMAL(6,2))) AS SUMA FROM DEVOLUCIONES where folio = '+quotedstr(modulo.QrylistaPagos['folio']));
    fabonos.Ldevoluciones.Caption:='0';
    if modulo.QryDevoluciones['suma']<>NULL then
      fabonos.Ldevoluciones.Caption:=modulo.QryDevoluciones['suma'];

    fabonos.Lresto.Caption:=floattostr(MODULO.QrylistaPagos['total']-fabonos.Ltotalabonado.Caption-fabonos.Ldevoluciones.Caption);



    fabonos.Efolio.Text:=modulo.QrylistaPagos['folio'];
    fabonos.Eclientes.Text:=modulo.QrylistaPagos['cliente'];


    if strtofloat(fabonos.Lresto.Caption)<=0 then
    begin
      if modulo.QrylistaPagos.Locate('folio',fabonos.Efolio.Text,[]) then
      begin
        modulo.QrylistaPagos.Edit;
        modulo.QrylistaPagos['estado']:='PAGADO';
        modulo.QrylistaPagos.Post;
        showmessage('Esta deuda esta cubierta, se va a eliminar de esta lista');
      end;
    end
    else
    begin
      FABONOS.fecha.Date:=DATE;
      FABONOS.Cantidad.Clear;
      fabonos.showmodal;
    end;
  end;
end;

procedure TFpago_creditos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if modulo.QrylistaPagos.RecordCount>0 then
  begin
    IF ((strtodatetime(MODULO.QrylistaPagos['fecha'])+13)<date) and (MODULO.QrylistaPagos['condicion']='CREDITO') THEN
    BEGIN
      //DBGrid1.Canvas.Font.Color:= clWhite;
      DBGrid1.Canvas.Brush.Color:= clYellow;
    END;

    IF ((strtodatetime(MODULO.QrylistaPagos['fecha'])+15)<date) and (MODULO.QrylistaPagos['condicion']='CREDITO') THEN
    BEGIN
      DBGrid1.Canvas.Font.Color:= clWhite;
      DBGrid1.Canvas.Brush.Color:= clred;
      //DBGrid1.DefaultDrawColumnCell
      //(Rect, DataCol, Column, State);
    END;
  end;



  //PINNTAR UNA SOLA CELDA
  IF ((DataCol > 0) AND  (DataCol < 5)) THEN
  BEGIN
   DBGrid1.DefaultDrawColumnCell
  (Rect, DataCol, Column, State);
 END;
end;

procedure TFpago_creditos.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_RETURN then
  begin
    if trim(EBUSCAR.Text) <> '' then
      modulo.QrylistaPagos.Open('select FOLIO,CLIENTE,TOTAL,VENDEDOR,FECHA,DOMICILIO,CONDICION,ESTADO,FECHA+15 AS FECHA2 from lista_REMISION where (CONDICION='+quotedstr('CREDITO')+') and (ESTADO <>'+quotedstr('PAGADO')+') and '+
                                          ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || CLIENTE || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%') +
                                          ' ORDER BY FOLIO DESC rows 100')
    else
      modulo.QrylistaPagos.Open('select FOLIO,CLIENTE,TOTAL,VENDEDOR,FECHA,DOMICILIO,CONDICION,ESTADO,FECHA+15 AS FECHA2 from lista_REMISION where (CONDICION='+quotedstr('CREDITO')+' and (ESTADO <>'+quotedstr('PAGADO')+')) ORDER BY FOLIO ');
  end;
end;

procedure TFpago_creditos.FormActivate(Sender: TObject);
begin
  modulo.QryExtras.Open('select * from extras');
  //agregar.Visible:=not(modulo.QryExtras['segundacaja']='1'); //true
  agregar.Visible:=true;
end;

procedure TFpago_creditos.SpeedButton1Click(Sender: TObject);
begin
  if modulo.QrylistaPagos.RecordCount>0 then
  begin

    modulo.QryAbonos.Close;
    modulo.QryAbonos.Open('select * from abonos where folio ='+quotedstr(modulo.QrylistaPagos['folio']));


    festadocuenta.Lnombre.Caption:=modulo.QrylistaPagos['cliente'];
    festadocuenta.Ldomicilio.Caption:=modulo.QrylistaPagos['domicilio'];
    festadocuenta.Lfolio.Caption:=modulo.QrylistaPagos['folio'];
    festadocuenta.Lnumabonos.Caption:=inttostr(modulo.QryAbonos.RecordCount);
    festadocuenta.Ldeuda.Caption:=MODULO.QrylistaPagos['TOTAL'];

    modulo.QryAbonos.CLOSE;
    modulo.QryAbonos.Open('select SUM(CAST(TOTAL AS DECIMAL(6,2))) as suma from abonos where folio = '+quotedstr(modulo.QrylistaPagos['folio']));
    festadocuenta.Ltotalabonado.Caption:='0';
    if modulo.QryAbonos['suma']<>NULL then
      festadocuenta.Ltotalabonado.Caption:=modulo.QryAbonos['suma'];

    modulo.QryDevoluciones.Close;
    modulo.QryDevoluciones.Open('SELECT SUM(CAST(TOTAL AS DECIMAL(6,2))) AS SUMA FROM DEVOLUCIONES where folio = '+quotedstr(modulo.QrylistaPagos['folio']));
    festadocuenta.Ldevoluciones.Caption:='0';
    if modulo.QryDevoluciones['suma']<>NULL then
      festadocuenta.Ldevoluciones.Caption:=modulo.QryDevoluciones['suma'];

    festadocuenta.Lresto.Caption:=floattostr(MODULO.QrylistaPagos['total']-festadocuenta.Ltotalabonado.Caption-festadocuenta.Ldevoluciones.Caption);

    festadocuenta.showmodal;
  end;
end;

end.
