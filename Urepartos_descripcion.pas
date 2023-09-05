unit Urepartos_descripcion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrepartos = class(TForm)
    Panel1: TPanel;
    Eliminar: TSpeedButton;
    PAgregar: TPanel;
    Agregar: TSpeedButton;
    PGuardar: TPanel;
    Guardar: TSpeedButton;
    Panel: TPanel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Eid: TEdit;
    Efecha: TDateTimePicker;
    Panel5: TPanel;
    Panel4: TPanel;
    label10: TLabel;
    nota: TLabel;
    grid: TDBGrid;
    Label5: TLabel;
    Erepartidor: TEdit;
    Label1: TLabel;
    Efolio: TEdit;
    QryAux: TFDQuery;
    RadioGroup: TRadioGroup;
    RFIRMA: TRadioButton;
    RPAGA: TRadioButton;
    Label2: TLabel;
    Edescripcion: TEdit;
    procedure AgregarClick(Sender: TObject);
    procedure total;
    procedure EliminarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure EfolioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridCellClick(Column: TColumn);
    procedure RFIRMAClick(Sender: TObject);
    procedure RPAGAClick(Sender: TObject);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clickgrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frepartos: TFrepartos;

implementation

{$R *.dfm}

uses Umodulo, Urepartos;

procedure TFrepartos.total;
var
  suma:real;
begin
  if modulo.qryremiaux2.RecordCount>0 then
  begin
    suma:=0;
    modulo.qryremiaux2.First;
    while not modulo.qryremiaux2.Eof do
    begin
      if modulo.qryremiaux2['PRODUCTO']='PAGA AL RECIBIR' then
        suma:=suma+modulo.qryremiaux2['total'];

      if modulo.qryremiaux2['EMPAQUE']='PAGA' then
        suma:=suma+modulo.qryremiaux2['total'];

      modulo.qryremiaux2.Next;

    end;
    nota.Caption:=Format('%0:2f',[suma]);
  end;
end;

procedure TFrepartos.AgregarClick(Sender: TObject);
var
  folio:String;
  abonos, devoluciones:real;
begin
  STRTOINT(efolio.Text);//VALIDAR QUE SEA ENTERO
  folio:=trim(efolio.Text);
  if folio<>'' then
  begin
      modulo.QryListaremision.Open('select * from lista_remision where folio ='+folio);
      if modulo.QryListaremision.RecordCount>0 then
      begin

        modulo.QryRepartos.Open('select * from reparto where folio = '+folio+' and descripcion <> '+quotedstr('FIRMA') );
        if modulo.QryRepartos.RecordCount>0 then
          showmessage('Este folio ya fue agregado en otra nota de reparto')
        else
        begin
          if modulo.qryremiaux2.Locate('clave',folio,[]) then
            showmessage('Ya has agregado este folio a esta nota')
          else
          begin
              abonos:=0;
              qryaux.Open('select * from abonos where folio = '+folio);
              qryaux.first;
              while not qryaux.Eof do
              begin
                abonos:=abonos+qryaux['total'];
                qryaux.Next;
              end;

              devoluciones:=0;
              qryaux.Open('select * from devoluciones where folio = '+folio);
              qryaux.First;
              while not qryaux.Eof do
              begin
                devoluciones:=devoluciones+qryaux['total'];
                qryaux.Next;
              end;



              modulo.qryremiaux2.Append;
              modulo.qryremiaux2['clave']:=efolio.Text;
              modulo.qryremiaux2['producto2']:=modulo.QryListaremision['cliente'];
              modulo.qryremiaux2['producto']:=modulo.QryListaremision['condicion'];
              modulo.qryremiaux2['precio']:=modulo.QryListaremision['estado'];
              modulo.qryremiaux2['total']:=floattostr(strtofloat(modulo.QryListaremision['total'])-abonos-devoluciones);
              modulo.qryremiaux2['tipo']:=Edescripcion.Text;

              IF modulo.QryListaremision['CONDICION']= 'CREDITO' THEN
                modulo.qryremiaux2['empaque']:='FIRMA'
              ELSE
                modulo.qryremiaux2['empaque']:=' ';
              modulo.qryremiaux2['cantidad']:='1';
              modulo.qryremiaux2['iva']:='1';


              modulo.qryremiaux2.Post;

              efolio.Clear;
              Edescripcion.Clear;

              total;
          end;
        end;
      end
      else
          showmessage('folio incorrecto');
  end;


end;

procedure TFrepartos.clickgrid;
begin
  RadioGroup.Visible:=MODULO.qryremiaux2['PRODUCTO']='CREDITO';
  RPAGA.Visible:=MODULO.qryremiaux2['PRODUCTO']='CREDITO';
  RFIRMA.Visible:=MODULO.qryremiaux2['PRODUCTO']='CREDITO';

  if MODULO.qryremiaux2['EMPAQUE']='PAGA' then
    RPAGA.Checked:=TRUE
  ELSE
    RFIRMA.Checked:=TRUE;
end;

procedure TFrepartos.EfolioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_return then
    self.Agregar.Click;
end;

procedure TFrepartos.EliminarClick(Sender: TObject);
begin
  modulo.qryremiaux2.Delete;
  total;
end;

procedure TFrepartos.FormActivate(Sender: TObject);
var
  folio:integer;
begin
  efecha.Date:=date;
  qryaux.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_reparto');

  folio:=1;
  if qryaux['numfolio']<>null then
    folio:= qryaux['numfolio'];

  eid.Text:=inttostr(folio);


  erepartidor.Clear;efolio.Clear;Edescripcion.Clear;

end;

procedure TFrepartos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
end;

procedure TFrepartos.gridCellClick(Column: TColumn);
begin
  clickgrid;
end;

procedure TFrepartos.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 clickgrid;
end;

procedure TFrepartos.GuardarClick(Sender: TObject);
var
  folio:integer;
begin
  if modulo.qryremiaux2.RecordCount >0 then
  begin
      if Trim(erepartidor.Text) = '' then
      begin
        showmessage('Escribe quien es el repartidor');
        erepartidor.SetFocus;
        exit;
      end;

      efecha.Date:=date;
      modulo.QryLista_reparto.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_reparto');
      folio:=1;
      if modulo.QryLista_reparto['numfolio']<>null then
        folio:= modulo.QryLista_reparto['numfolio'];
      eid.Text:=inttostr(folio);

      modulo.QryRepartos.Open('select * from reparto');
      modulo.QryLista_reparto.Open('select * from LISTA_reparto');

      modulo.qryremiaux2.First;
      while not modulo.qryremiaux2.Eof do
      begin
        modulo.QryRepartos.Append;
        modulo.QryRepartos['folio']:=modulo.qryremiaux2['clave'];
        modulo.QryRepartos['cliente']:=modulo.qryremiaux2['producto2'];
        modulo.QryRepartos['condicion']:=modulo.qryremiaux2['producto'];
        modulo.QryRepartos['total']:=modulo.qryremiaux2['total'];
        modulo.QryRepartos['id']:=eid.Text;
        modulo.QryRepartos['DESCRIPCION']:=modulo.qryremiaux2['empaque'];
        modulo.QryRepartos['adicional']:=modulo.qryremiaux2['tipo'];

        modulo.QryRepartos.Post;

        modulo.qryremiaux2.Next
      end;

      modulo.QryLista_reparto.Append;
      modulo.QryLista_reparto['folio']:=eid.Text;
      modulo.QryLista_reparto['repartidor']:=erepartidor.Text;
      modulo.QryLista_reparto['fecha']:=datetostr(date)+' '+timetostr(time);
      modulo.QryLista_reparto['total']:=nota.Caption;
      modulo.QryLista_reparto['estado']:='PENDIENTE';
      modulo.QryLista_reparto.Post;

      FLista_repartos.RPENDIENTES.Checked:=TRUE;
      modulo.QryLista_reparto.Open('select * from lista_reparto where estado <> '+quotedstr('PAGADO')+' order by fecha desc');

      Self.OnActivate(sender);
      modulo.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
      SHOWMEsSAGE('Se guardo correctamante ');
  end;



end;

procedure TFrepartos.RFIRMAClick(Sender: TObject);
begin
  if MODULO.qryremiaux2['PRODUCTO']='CREDITO' then
  BEGIN
    modulo.qryremiaux2.Edit;
    modulo.qryremiaux2['EMPAQUE']:='FIRMA';
    modulo.qryremiaux2.Post;
    TOTAL;
  END;

end;

procedure TFrepartos.RPAGAClick(Sender: TObject);
begin
  if MODULO.qryremiaux2['PRODUCTO']='CREDITO' then
  BEGIN
    modulo.qryremiaux2.Edit;
    modulo.qryremiaux2['EMPAQUE']:='PAGA';
    modulo.qryremiaux2.Post;
    TOTAL;
  END;

end;

end.
