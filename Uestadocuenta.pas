unit Uestadocuenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB;

type
  TFEstadocuenta = class(TForm)
    Panel1: TPanel;
    Lnombre: TLabel;
    Ldomicilio: TLabel;
    Lfolio: TLabel;
    Ldeuda: TLabel;
    Lnumabonos: TLabel;
    Ltotalabonado: TLabel;
    Lresto: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Ldevoluciones: TLabel;
    DBGrid1: TDBGrid;
    imprimir: TSpeedButton;
    Eliminar: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure imprimirtiquet80;
    procedure imprimirtiquet58;
    procedure EliminarClick(Sender: TObject);
    procedure imprimirtiquetMatriz;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadocuenta: TFEstadocuenta;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario, UReporteAbonos, UReporteAbonos58;

procedure TFEstadocuenta.EliminarClick(Sender: TObject);
begin
  if modulo.QryAbonos.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('abonoeliminar')then
    BEGIN
      modulo.QryAbonos.Delete;
      showmessage('Abono borrado correctamente');
    END;
  end;
end;

procedure TFEstadocuenta.FormActivate(Sender: TObject);
begin
  modulo.QryAbonos.Open('select * from abonos where folio = '+quotedstr(lfolio.Caption));
end;

procedure TFEstadocuenta.imprimirClick(Sender: TObject);
begin
   fverificausu.ShowModal;
    if fverificausu.verificar('remiagregar') then
    begin

      modulo.Qryimpresora.Open('select * from impresora');
      modulo.QryAbonos.Open('select * from abonos');
      modulo.QryAbonos.Filtered:=false;
      modulo.QryAbonos.Filter:=  ' folio ='+quotedstr(lfolio.Caption);
      modulo.QryAbonos.Filtered:=true;

      MODULO.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

      modulo.QryAbonos.First;
      while not (modulo.QryAbonos.Eof) do  //agrega la remision que se quiere aditar a la ventana de remisiones
      begin

        modulo.qryremiaux2.Append;
        modulo.qryremiaux2['CLAVE']:=modulo.QryAbonos['fecha'];
        modulo.qryremiaux2['TOTAL']:=modulo.QryAbonos['total'];
        modulo.qryremiaux2.Post;

        modulo.QryAbonos.Next;
      end;


      if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
        begin
          FREPORTEABONOS.report1.DeviceType:='Screen';
          FREPORTEABONOS58.report1.DeviceType:='Screen';
          FREPORTEABONOS.report_matriz_punto.DeviceType:='Screen';
        end
        else
        begin
          FREPORTEABONOS.report1.DeviceType:='Printer';
          FREPORTEABONOS58.report1.DeviceType:='Printer';
          FREPORTEABONOS.report_matriz_punto.DeviceType:='Printer';
        end;

       if modulo.QryExtras['tiquet']='0' then
          imprimirtiquet80;
       if modulo.QryExtras['tiquet']='1' then
          imprimirtiquet58;
       if modulo.QryExtras['tiquet']='2' then
          imprimirtiquetMatriz;

       modulo.QryAbonos.Filtered:=false;
       MODULO.qryborraremiaux.ExecSQL;
       MODULO.qryremiaux2.Close;MODULO.qryremiaux2.Open;
       close;
    end;
end;

procedure TFEstadocuenta.imprimirtiquet58;
begin
  FREPORTEABONOS58.CLIENTE.Caption:=lnombre.Caption;
  FREPORTEABONOS58.FOLIO.Caption:=lfolio.Caption;
  FREPORTEABONOS58.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS58.HORA.Caption:=timetostr(time);
  FREPORTEABONOS58.fecha.Caption:=datetostr(date);
  FREPORTEABONOS58.DEUDA.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS58.abonos.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS58.devoluciones.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS58.RESTA.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)]);

  FREPORTEABONOS58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  FREPORTEABONOS58.report1.Print;

end;

procedure TFEstadocuenta.imprimirtiquet80;
begin
  FREPORTEABONOS.CLIENTE.Caption:=lnombre.Caption;
  FREPORTEABONOS.FOLIO.Caption:=lfolio.Caption;
  FREPORTEABONOS.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS.HORA.Caption:=timetostr(time);
  FREPORTEABONOS.fecha.Caption:=datetostr(date);
  FREPORTEABONOS.DEUDA.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS.abonos.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS.devoluciones.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS.RESTA.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)]);

  FREPORTEABONOS.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  FREPORTEABONOS.report1.Print;
end;

procedure TFEstadocuenta.imprimirtiquetMatriz;
begin
  FREPORTEABONOS.CLIENTEM.Caption:=lnombre.Caption;
  FREPORTEABONOS.FOLIOM.Caption:=lfolio.Caption;
  FREPORTEABONOS.USUARIOM.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS.HORAM.Caption:=timetostr(time);
  FREPORTEABONOS.fechaM.Caption:=datetostr(date);
  FREPORTEABONOS.DEUDAM.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS.abonosM.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS.devolucionesM.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS.RESTAM.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)]);

  FREPORTEABONOS.report_matriz_punto.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  FREPORTEABONOS.report_matriz_punto.Print;

end;

end.
