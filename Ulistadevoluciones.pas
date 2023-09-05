unit Ulistadevoluciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Data.DB, Vcl.Buttons, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFlistadevoluciones = class(TForm)
    Panel: TPanel;
    DBGrid1: TDBGrid;
    Eliminar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Ebuscar: TEdit;
    imprimir: TSpeedButton;
    QryAux: TFDQuery;
    procedure EliminarClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistadevoluciones: TFlistadevoluciones;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario, UreporteRecepcion, UreporteRecepcion58,
  URecepciones;

procedure TFlistadevoluciones.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    ebuscar.Clear;

  if KEY = VK_RETURN then
    modulo.Qrydevoluciones.Open('select folio, cliente, cantidad, empaque ||'+quotedstr(' ')+' ||producto AS producto2, producto, total, fecha, usuario from DEVOLUCIONES where '+
                                          ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || CLIENTE || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%')+' order by fecha desc ROWS 50');
end;

procedure TFlistadevoluciones.EliminarClick(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('devoeliminar')then
  BEGIN
    if modulo.Qrydevoluciones.RecordCount>0 then
    begin
      modulo.Qrydevoluciones.Delete;
      showmessage('Devolucion eliminada');
    end;

  END;
end;

procedure TFlistadevoluciones.imprimirClick(Sender: TObject);
var
  pre,TOTAL:real;
  hora:string;
begin
     if modulo.Qrydevoluciones.RecordCount>0 then
     begin
        modulo.Qryimpresora.Open('select * from impresora');
        FreporteRecepcion.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
        FreporteRecepcion58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

        FRECEPCIONES.Label1.Caption := 'CLIENTE:';

        hora:= formatdatetime('mm/dd/yyyy hh:mm:ss',modulo.Qrydevoluciones['FECHA']);

        QRYAUX.Open('select * from DEVOLUCIONES where folio = '+quotedstr(modulo.Qrydevoluciones['folio'])+ ' and FECHA = '+quotedstr(hora));
        QRYAUX.First;
        TOTAL:=0;

        while not (QRYAUX.Eof) do  //agrega la DEVOLUCION que se quiere reimprimir a la ventana de RECEPCIONES
        begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['empaque']:=QRYAUX['empaque'];
          modulo.qryremiaux2['producto']:=QRYAUX['producto'];
          modulo.qryremiaux2['producto2']:=QRYAUX['empaque']+' '+QRYAUX['producto'];
          modulo.qryremiaux2['IVA']:=0;
          modulo.Qryremiaux2['cantidad']:=QRYAUX['cantidad'];
          modulo.Qryremiaux2['clave']:=QRYAUX['producto'];
          modulo.Qryremiaux2['total']:=QRYAUX['total'];
          modulo.Qryremiaux2['tipo']:='NO';
          pre:=QRYAUX['total']/QRYAUX['cantidad'];
          modulo.Qryremiaux2['precio']:=Format('%0:2f',[pre]);
          TOTAL:=TOTAL+QRYAUX['total'];
          modulo.Qryremiaux2.Post;
          QRYAUX.Next;
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

         fverificausu.Lusuario.Caption:= modulo.Qrydevoluciones['USUARIO'];//PONE EL NOMBRE DEL QUE HIZO LA DEVOLUCION EN EL TIQUET
         if modulo.QryExtras['tiquet']='0' then
            frecepciones.imprimirtiquet80(modulo.Qrydevoluciones['CLIENTE'],modulo.Qrydevoluciones['folio'],modulo.Qrydevoluciones['fecha'],TOTAL);
         if modulo.QryExtras['tiquet']='1' then
            frecepciones.imprimirtiquet58(modulo.Qrydevoluciones['CLIENTE'],modulo.Qrydevoluciones['folio'],modulo.Qrydevoluciones['fecha'],TOTAL);


         modulo.qryborraremiaux.ExecSQL;
         modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

     end;


end;

end.
