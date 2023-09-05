unit Urepartos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ButtonGroup;

type
  TFLista_repartos = class(TForm)
    DBGrid1: TDBGrid;
    PanelBotones: TPanel;
    Agregar: TSpeedButton;
    Bpagar: TSpeedButton;
    Bdevoluciones: TSpeedButton;
    Bactualizar: TSpeedButton;
    RadioGroup2: TRadioGroup;
    RPENDIENTES: TRadioButton;
    RTODOS: TRadioButton;
    procedure AgregarClick(Sender: TObject);
    procedure BpagarClick(Sender: TObject);
    procedure BdevolucionesClick(Sender: TObject);
    procedure BactualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Actualizarlista(folio: string;total:string);
    procedure RPENDIENTESClick(Sender: TObject);
    procedure RTODOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLista_repartos: TFLista_repartos;

implementation

{$R *.dfm}

uses Urepartos_descripcion, Umodulo, URecepciones, Urepartos_modificar,
  UVerificarUsuario, UAbonos;

procedure TFLista_repartos.AgregarClick(Sender: TObject);
begin
  Frepartos.ShowModal;
end;

procedure TFLista_repartos.BpagarClick(Sender: TObject);
begin

  if modulo.QryLista_reparto.RecordCount>0 then
  begin
    if modulo.QryLista_reparto['estado']='PAGADO' then
    BEGIN
      Showmessage('este reparto ya fue entregado');
      exit;
    END;



    modulo.QryRepartos.Open('select * from reparto where id = '+quotedstr(modulo.QryLista_reparto['folio']));
    modulo.QryRepartos.First;
    while not modulo.QryRepartos.Eof do
    begin
      if modulo.Qryrepartos['CONDICION']='PAGA AL RECIBIR' then
      BEGIN
        modulo.QryAbonos.Append;
        modulo.QryAbonos['folio']:= modulo.Qryrepartos['FOLIO'];
        modulo.QryAbonos['cliente']:= modulo.Qryrepartos['CLIENTE'];
        modulo.QryAbonos['total']:=modulo.Qryrepartos['TOTAL'];
        modulo.QryAbonos['fecha']:=datetostr(Date)+ ' '+timetostr(time);
        modulo.QryAbonos['condicion']:='ABONO';
        modulo.QryAbonos['usuario']:=fverificausu.Lusuario.Caption;
        modulo.QryAbonos.Post;

        {if modulo.QrylistaPagos.Locate('folio',modulo.Qryrepartos['FOLIO'],[])then
        BEGIN
          modulo.QrylistaPagos.Edit;
          modulo.QrylistaPagos['estado']:='PAGADO';
          modulo.QrylistaPagos.Post;
          MODULO.QrylistaPagos.Close;MODULO.QrylistaPagos.Open;
        END;}

      END;

      //VALES QUE SE VAN A PAGAR
      If modulo.Qryrepartos['descripcion']='PAGA' then
      BEGIN
        modulo.QryAbonos.Append;
        modulo.QryAbonos['folio']:= modulo.Qryrepartos['FOLIO'];
        modulo.QryAbonos['cliente']:= modulo.Qryrepartos['CLIENTE'];
        modulo.QryAbonos['total']:=modulo.Qryrepartos['TOTAL'];
        modulo.QryAbonos['fecha']:=datetostr(Date)+ ' '+timetostr(time);
        modulo.QryAbonos['condicion']:='ABONO';
        modulo.QryAbonos['usuario']:=fverificausu.Lusuario.Caption;
        modulo.QryAbonos.Post;
      END;

      //NO PONER PAGADO EN VALES QUE SE REGRESAN FIRMADOS
      If modulo.Qryrepartos['descripcion']<>'FIRMA' then
      BEGIN
        modulo.QryListaremision.Open('select * from lista_remision where folio =' +INTTOSTR(modulo.QryRepartos['folio']));
        modulo.QryListaremision.Edit;
        modulo.QryListaremision['estado']:='PAGADO';
        modulo.QryListaremision.Post;
      END;

      modulo.QryRepartos.Next;
    end;

    modulo.QryLista_reparto.Edit;
    modulo.QryLista_reparto['estado']:='PAGADO';
    modulo.QryLista_reparto.Post;

  end;
end;

procedure TFLista_repartos.FormActivate(Sender: TObject);
begin
  MODULO.QryAbonos.Open('select * from abonos');
  modulo.QrylistaPagos.Open('select * from lista_REMISION where (CONDICION<>'+quotedstr('CONTADO')+' and (ESTADO <>'+quotedstr('PAGADO')+')) ORDER BY FOLIO DESC rows 50');

  modulo.QryExtras.Open('select * from extras');
  //SI ACTIVO LA 2DA CAJA, NO SE DEBE HACER DEVOLUCIONES NI COBROS EN LOS NODOS
  Bdevoluciones.Enabled:= NOT(modulo.QryExtras['segundacaja']='1'); //true
  Bpagar.Enabled:= NOT(modulo.QryExtras['segundacaja']='1'); //true
end;

procedure TFLista_repartos.RPENDIENTESClick(Sender: TObject);
begin
  modulo.QryLista_reparto.Open('select * from lista_reparto where estado <> '+quotedstr('PAGADO')+' order by fecha desc');
end;

procedure TFLista_repartos.RTODOSClick(Sender: TObject);
begin
  modulo.QryLista_reparto.Open('select * from lista_reparto  order by fecha desc');
end;

procedure TFLista_repartos.Actualizarlista(folio: string; total: string);
begin
  modulo.QryRepartos.Open('select * from reparto where id = ' + quotedstr(folio));
  FREPARTOS_MODIFICAR.nota.Caption:=Format('%0:2f',[strtofloat(total)]);
  frepartos_modificar.ShowModal
end;

procedure TFLista_repartos.BactualizarClick(Sender: TObject);
begin
  Actualizarlista(modulo.QryLista_reparto['folio'],modulo.QryLista_reparto['TOTAL']);
end;

procedure TFLista_repartos.BdevolucionesClick(Sender: TObject);
begin
  frecepciones.Efolio.Text:=modulo.QryLista_reparto['folio'];
  frecepciones.Eproveedor.Text:=modulo.QryLista_reparto['repartidor'];
  frecepciones.Efecha.Date:=date;
  frecepciones.Label1.Caption:='REPARTIDOR:';


  frecepciones.Efolio.Enabled:=false;
  frecepciones.Eproveedor.Enabled:=false;

  frecepciones.ShowModal;
end;

end.
