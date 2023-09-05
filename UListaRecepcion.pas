unit UListaRecepcion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB;

type
  TFListaRecepcion = class(TForm)
    PanelBotones: TPanel;
    Agregar: TSpeedButton;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    Ebuscar: TEdit;
    Reutilizar: TSpeedButton;
    imprimir: TSpeedButton;
    procedure AgregarClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ReutilizarClick(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaRecepcion: TFListaRecepcion;

implementation

{$R *.dfm}

uses Umodulo, URecepciones, UVerificarUsuario, UreporteRecepcion,
  UreporteRecepcion58;

procedure TFListaRecepcion.AgregarClick(Sender: TObject);
begin
  if fverificausu.verificar('receagregar')then
  begin
    //devoluciones de reparto lo deja desabilitado
    frecepciones.Efolio.Enabled:=true;
    frecepciones.Eproveedor.Enabled:=true;
    frecepciones.Label1.Caption:='PROVEEDOR:';
    FRecepciones.Caption:='Recepcion de mercancia' ;

    modulo.qryborraremiaux.ExecSQL;
    frecepciones.Efecha.DateTime:=date;
    frecepciones.Efolio.Clear;
    frecepciones.Eproveedor.Clear;
    modulo.QryRecepciones.Open('select * from recepciones');
    frecepciones.showmodal;
  end;
end;

procedure TFListaRecepcion.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    ebuscar.Clear;

  if KEY = VK_RETURN then
    modulo.Qrylistarecepcion.Open('select * from lista_RECEPCION where '+
                                          ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || PROVEEDOR || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%')+' order by fecha desc rows 50');
end;

procedure TFListaRecepcion.FormActivate(Sender: TObject);
begin
  modulo.Qrylistarecepcion.Open('select * from lista_RECEPCION order by fecha desc rows 50');
end;

procedure TFListaRecepcion.imprimirClick(Sender: TObject);
var
  pre:real;
begin
     if modulo.Qrylistarecepcion.RecordCount>0 then
     begin
        modulo.Qryimpresora.Open('select * from impresora');
        FreporteRecepcion.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
        FreporteRecepcion58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

        frecepciones.Label1.Caption:='PROVEEDOR:';
        modulo.QryRecepciones.Open('select * from recepciones where folio = '+quotedstr(modulo.Qrylistarecepcion['folio'])+ ' and proveedor = '+quotedstr(modulo.Qrylistarecepcion['proveedor']));
        modulo.QryRecepciones.First;

        while not (modulo.QryRecepciones.Eof) do  //agrega la recepcion que se quiere reimprimir a la ventana de remisiones
        begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['empaque']:=modulo.QryRecepciones['empaque'];
          modulo.qryremiaux2['producto']:=modulo.QryRecepciones['producto'];
          modulo.qryremiaux2['producto2']:=modulo.QryRecepciones['empaque']+' '+modulo.QryRecepciones['producto'];
          modulo.qryremiaux2['IVA']:=0;
          modulo.Qryremiaux2['cantidad']:=modulo.QryRecepciones['cantidad'];
          modulo.Qryremiaux2['clave']:=modulo.QryRecepciones['producto'];
          modulo.Qryremiaux2['total']:=modulo.QryRecepciones['total'];
          modulo.Qryremiaux2['tipo']:='NO';
          pre:=modulo.QryRecepciones['total']/modulo.QryRecepciones['cantidad'];
          modulo.Qryremiaux2['precio']:=Format('%0:2f',[pre]);
          modulo.Qryremiaux2.Post;
          modulo.QryRecepciones.Next;
        end;

        if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
            begin
              freporterecepcion.report1.DeviceType:='Screen';
              freporterecepcion58.report1.DeviceType:='Screen';
            end
            else
            begin
              freporterecepcion.report1.DeviceType:='Printer';
              freporterecepcion58.report1.DeviceType:='Printer';
            end;

        if modulo.QryExtras['tiquet']='0' then
          frecepciones.imprimirtiquet80(modulo.Qrylistarecepcion['proveedor'],modulo.Qrylistarecepcion['folio'],modulo.Qrylistarecepcion['fecha'],modulo.Qrylistarecepcion['total']);
        if modulo.QryExtras['tiquet']='1' then
          frecepciones.imprimirtiquet58(modulo.Qrylistarecepcion['proveedor'],modulo.Qrylistarecepcion['folio'],modulo.Qrylistarecepcion['fecha'],modulo.Qrylistarecepcion['total']);


         modulo.qryborraremiaux.ExecSQL;
         modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

     end;


end;

procedure TFListaRecepcion.ReutilizarClick(Sender: TObject);
var
  pre:real;
begin
    if modulo.Qrylistarecepcion.RecordCount>0 then
    begin
      modulo.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;
      modulo.qryremiaux2.Open;

      modulo.QryRecepciones.Open('select * from recepciones where folio = '+quotedstr(modulo.Qrylistarecepcion['folio'])+ ' and proveedor = '+quotedstr(modulo.Qrylistarecepcion['proveedor']));

      modulo.QryRecepciones.First;
      while not (modulo.QryRecepciones.Eof) do
      begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['empaque']:=modulo.QryRecepciones['empaque'];
          modulo.qryremiaux2['producto']:=modulo.QryRecepciones['producto'];
          modulo.qryremiaux2['producto2']:=modulo.QryRecepciones['empaque']+' '+modulo.QryRecepciones['producto'];
          modulo.qryremiaux2['cantidad']:=modulo.QryRecepciones['cantidad'];
          modulo.qryremiaux2['clave']:=modulo.QryRecepciones['clave'];
          modulo.qryremiaux2['clave_empaque']:=modulo.QryRecepciones['clave_empaque'];
          modulo.qryremiaux2['total']:=modulo.QryRecepciones['total'];
          modulo.qryremiaux2['tipo']:='no';
          pre:=modulo.QryRecepciones['total']/modulo.QryRecepciones['cantidad'];
          modulo.Qryremiaux2['precio']:=Format('%0:2f',[pre]);
          modulo.qryremiaux2.Post;
          modulo.QryRecepciones.Next;
      end;
      frecepciones.Efolio.Text:= modulo.Qrylistarecepcion['folio'];
      frecepciones.Eproveedor.Text:= modulo.Qrylistarecepcion['proveedor'];
      frecepciones.Efecha.Date:=date;
      FRECEPCIONES.total;

      modulo.QryRecepciones.Open('select * from recepciones');  // quitar filtro

      frecepciones.ShowModal;
    end;
end;

end.
