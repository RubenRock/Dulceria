unit UAbonos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFabonos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    fecha: TDateTimePicker;
    Cantidad: TEdit;
    Eclientes: TEdit;
    Efolio: TEdit;
    Panel2: TPanel;
    Bguardar: TSpeedButton;
    Label5: TLabel;
    Labono: TLabel;
    Label6: TLabel;
    Ldeuda: TLabel;
    Label7: TLabel;
    Ltotalabonado: TLabel;
    Label8: TLabel;
    Lresto: TLabel;
    Label9: TLabel;
    Ldevoluciones: TLabel;
    BCancelar: TBitBtn;
    Sqlaux: TFDQuery;
    procedure BguardarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure verificarreparto;
    procedure imprimirtiquet80;
    procedure imprimirtiquet58;
    PROCEDURE imprimirtiquetMatriz;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fabonos: TFabonos;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario, UReporteAbonos, Urepartos, UReporteAbonos58;

procedure TFabonos.verificarreparto;
begin
  sqlaux.Active:=false;
  sqlaux.SQL.Clear;
  sqlaux.SQL.Add('select folio, total,id from reparto where folio ='+efolio.Text);
  sqlaux.Active:=true;


  if sqlaux['folio']<> null then
  begin
    modulo.QryLista_reparto.Open('select total from lista_reparto where folio = '+inttostr(sqlaux['id']));
    //MODIFICAR EL TOTAL DE LA LISTA DE REPARTO
    modulo.QryLista_reparto.Edit;
    modulo.Qrylista_reparto['total']:=floattostr(strtofloat(modulo.Qrylista_reparto['total'])-strtofloat(cantidad.Text));
    modulo.QryLista_reparto.Post;

    //MODIFICAR LA NOTA QUE SE MODIFICO EL TOTAL
    SQLAUX.Edit;
    SQLAUX['total']:=floattostr(strtofloat(SQLAUX['total'])-strtofloat(cantidad.Text));
    SQLAUX.Post;
  end;
end;

procedure TFabonos.BCancelarClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TFabonos.BguardarClick(Sender: TObject);
var
  totresta:real;
  condicion:string;
begin
  if (trim(cantidad.Text)<>'') then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('remiagregar') then
    begin
      MODULO.QryAbonos.Close;
      MODULO.QryAbonos.Open('select * from abonos');

      try
        strtofloat(cantidad.Text)
      except
        showmessage('Debes ingresar unicamente numeros');
        exit;
      end;

      if (strtofloat(cantidad.Text)>strtofloat(lresto.Caption)) then
      begin
        showmessage('La cantidad abonada es mayor a la deuda pendiente');
        exit;
      end;

      modulo.QryAbonos.Append;
      modulo.QryAbonos['folio']:=efolio.Text;
      modulo.QryAbonos['cliente']:=eclientes.Text;
      modulo.QryAbonos['total']:=Format('%0:2f',[strtofloat(cantidad.text)]);
      modulo.QryAbonos['fecha']:=datetostr(fecha.Date)+ ' '+timetostr(time);
      modulo.QryAbonos['condicion']:='ABONO';
      modulo.QryAbonos['usuario']:=fverificausu.Lusuario.Caption;
      modulo.QryAbonos.Post;

      if strtofloat(cantidad.Text)=strtofloat(lresto.Caption) then
      begin
        if modulo.QrylistaPagos.Locate('folio',efolio.Text,[])then
        BEGIN
          modulo.QrylistaPagos.Edit;
          modulo.QrylistaPagos['estado']:='PAGADO';
          modulo.QrylistaPagos.Post;
          MODULO.QrylistaPagos.Close;MODULO.QrylistaPagos.Open;
        END;

      end;

      MODULO.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

      modulo.qryremiaux2.Append;
      modulo.qryremiaux2['CLAVE']:='ABONO';
      modulo.qryremiaux2['TOTAL']:=Format('%0:2f',[strtofloat(cantidad.text)]);
      modulo.qryremiaux2.Post;

      //checar si esta en reparto la nota, actualiza el monto a entregar
      if MODULO.QrylistaPagos['CONDICION']= 'PAGA AL RECIBIR' then
        verificarreparto;

      if MessageDlg('Abono correcto,¿deseas imprimir la informacion?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

        modulo.Qryimpresora.Open('select * from impresora');
        if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
        begin
          FREPORTEABONOS.report1.DeviceType:='Screen';
          FREPORTEABONOS.report_matriz_punto.DeviceType:='Screen';
          FREPORTEABONOS58.report1.DeviceType:='Screen';
        end
        else
        begin
          FREPORTEABONOS.report1.PrinterSetup.Copies:=2;    //se necesitan 2 tantos
          FREPORTEABONOS58.report1.PrinterSetup.Copies:=2;
          FREPORTEABONOS.report1.DeviceType:='Printer';
          FREPORTEABONOS.report_matriz_punto.DeviceType:='Printer';
          FREPORTEABONOS58.report1.DeviceType:='Printer';
        end;

       if modulo.QryExtras['tiquet']='0' then
          imprimirtiquet80;
       if modulo.QryExtras['tiquet']='1' then
          imprimirtiquet58;
       if modulo.QryExtras['tiquet']='2' then
          imprimirtiquetMatriz;
      end;

      CANTIDAD.Clear;

      MODULO.qryborraremiaux.ExecSQL;
      MODULO.qryremiaux2.Close;MODULO.qryremiaux2.Open;
      close;


    end;

  end
  else
    showmessage('Datos incompletos');
end;

procedure TFabonos.FormActivate(Sender: TObject);
begin
  CANTIDAD.SetFocus;
end;

procedure TFabonos.imprimirtiquet58;
begin
  FREPORTEABONOS58.razon.Caption:=modulo.QryExtras['razon'];
  FREPORTEABONOS58.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  FREPORTEABONOS58.CLIENTE.Caption:=eclientes.Text;
  FREPORTEABONOS58.FOLIO.Caption:=efolio.Text;
  FREPORTEABONOS58.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS58.HORA.Caption:=timetostr(time);
  FREPORTEABONOS58.fecha.Caption:=datetostr(date);
  FREPORTEABONOS58.DEUDA.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS58.abonos.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS58.devoluciones.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS58.RESTA.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)-strtofloat(cantidad.Text)]);

  try
    FREPORTEABONOS58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
    FREPORTEABONOS58.report1.Print;
    FREPORTEABONOS58.report1.PrinterSetup.Copies:=1;  //regresamos a una impresion
  except
    showmessage('Hay problemas con la impresora');
  end;


end;

procedure TFabonos.imprimirtiquet80;
begin
  FREPORTEABONOS.razon.Caption:=modulo.QryExtras['razon'];
  FREPORTEABONOS.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  FREPORTEABONOS.CLIENTE.Caption:=eclientes.Text;
  FREPORTEABONOS.FOLIO.Caption:=efolio.Text;
  FREPORTEABONOS.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS.HORA.Caption:=timetostr(time);
  FREPORTEABONOS.fecha.Caption:=datetostr(date);
  FREPORTEABONOS.DEUDA.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS.abonos.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS.devoluciones.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS.RESTA.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)-strtofloat(cantidad.Text)]);

  try
    FREPORTEABONOS.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
    FREPORTEABONOS.report1.Print;
    FREPORTEABONOS.report1.PrinterSetup.Copies:=1; //regresamos a una impresion
  except
     showmessage('Hay problemas con la impresora');
  end;

end;

procedure TFabonos.imprimirtiquetMatriz;
begin
  FREPORTEABONOS.razonM.Caption:=modulo.QryExtras['razon'];
  FREPORTEABONOS.nombreM.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  FREPORTEABONOS.CLIENTEM.Caption:=eclientes.Text;
  FREPORTEABONOS.FOLIOM.Caption:=efolio.Text;
  FREPORTEABONOS.USUARIOM.Caption:=fverificausu.Lusuario.Caption;
  FREPORTEABONOS.HORAM.Caption:=timetostr(time);
  FREPORTEABONOS.fechaM.Caption:=datetostr(date);
  FREPORTEABONOS.DEUDAM.Caption:=Format('%0:2f',[strtofloat(ldeuda.Caption)]);
  FREPORTEABONOS.abonosM.Caption:=Format('%0:2f',[strtofloat(ltotalabonado.Caption)]);
  FREPORTEABONOS.devolucionesM.Caption:=Format('%0:2f',[strtofloat(ldevoluciones.Caption)]);
  FREPORTEABONOS.RESTAM.Caption:=Format('%0:2f',[strtofloat(lresto.Caption)-strtofloat(cantidad.Text)]);

  try
    FREPORTEABONOS.report_matriz_punto.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
    FREPORTEABONOS.report_matriz_punto.Print;
  except
     showmessage('Hay problemas con la impresora');
  end;

end;

end.
