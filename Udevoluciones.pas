unit Udevoluciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFdevoluciones = class(TForm)
    grid: TDBGrid;
    Panel2: TPanel;
    Label5: TLabel;
    Lfolio: TLabel;
    Label6: TLabel;
    Lcliente: TLabel;
    Label7: TLabel;
    Ldomicilio: TLabel;
    Label8: TLabel;
    Lcondicion: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Ltotal: TLabel;
    Efecha: TDateTimePicker;
    Panel1: TPanel;
    Eliminar: TSpeedButton;
    Btipo: TSpeedButton;
    PAgregar: TPanel;
    PGuardar: TPanel;
    Guardar: TSpeedButton;
    QryAux: TFDQuery;
    procedure cantidad_articulos;
    procedure GuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridDblClick(Sender: TObject);
    procedure total;
    procedure imprimirtiquet80(var suma:real);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdevoluciones: TFdevoluciones;
  ban:boolean;

implementation

{$R *.dfm}

uses Umodulo, Uinventario, UVerificarUsuario, UreporteRecepcion,
  Udevoluciones_cantidad;

procedure TFdevoluciones.total;
var
  suma:real;
begin
  if modulo.qryremiaux2.RecordCount>0 then
  begin
    suma:=0;
    modulo.qryremiaux2.First;
    while not modulo.qryremiaux2.Eof do
    begin
      suma:=suma+modulo.qryremiaux2['total'];
      modulo.qryremiaux2.Next;
    end;
    ltotal.Caption:=Format('%0:2f',[suma]);
  end;
end;

procedure TFdevoluciones.cantidad_articulos;
var
  suma:integer;
begin
  modulo.qryremiaux2.First;
  while not modulo.qryremiaux2.Eof do
  begin
    if modulo.qryremiaux2['cantidad']= 0 then
    begin
      showmessage('Cantidad incorrecta');
      ban:=false;exit;
    end;

    suma:=0;
    Qryaux.Close;
    Qryaux.Open('select * from remisiones where folio = '+quotedstr(lfolio.Caption));

    Qryaux.First;
    while not Qryaux.Eof do
    begin
      if modulo.qryremiaux2['producto']=Qryaux['producto'] then
        suma:=suma+Qryaux['cantidad'];
      Qryaux.Next;
    end;

    Qryaux.Close;
    Qryaux.Open('select * from devoluciones where folio = '+quotedstr(lfolio.Caption));

    Qryaux.First;
    while not Qryaux.Eof do
    begin
      if modulo.qryremiaux2['producto']=Qryaux['producto'] then
        suma:=suma-Qryaux['cantidad'];
      Qryaux.Next;
    end;


    if suma<modulo.qryremiaux2['cantidad'] then
    begin
      showmessage('La cantidad de articulos de '+modulo.qryremiaux2['producto']+' es mayor a la vendida o ya fue devuelto el articulo');
      ban:=false;
      exit;
    end;
    modulo.qryremiaux2.Next;
    ban:=true;
  end;

end;

procedure TFdevoluciones.EliminarClick(Sender: TObject);
begin
  if modulo.qryremiaux2.RecordCount >0 then
  begin
    modulo.qryremiaux2.Delete;
    total;
    onshow(sender);
  end;
end;

procedure TFdevoluciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
end;

procedure TFdevoluciones.FormShow(Sender: TObject);
var
  suma:real;
begin
  modulo.qryremiaux2.First;suma:=0;
          while not modulo.qryremiaux2.Eof do
          begin
            modulo.qryremiaux2.Edit;
            modulo.qryremiaux2['total']:=modulo.qryremiaux2['cantidad']*modulo.qryremiaux2['precio'];
            modulo.qryremiaux2.Post;
            suma:=suma+ modulo.qryremiaux2['total'];
            modulo.qryremiaux2.Next;
          end;

          ltotal.Caption:=Format('%0:2f',[suma]);
end;

procedure TFdevoluciones.gridDblClick(Sender: TObject);
begin
   if modulo.qryremiaux2.RecordCount>0 then
   begin
     fdevoluciones_cantidad.ecantidad.text:=modulo.qryremiaux2['cantidad'];
     fdevoluciones_cantidad.showmodal;
   end;
end;

procedure TFdevoluciones.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_delete then
    eliminar.Click;
  if key = vk_return then
    grid.OnDblClick(sender);
end;

procedure TFdevoluciones.GuardarClick(Sender: TObject);
var
  descuento,decimales,suma:real;
  cantidad:string;
begin
  if modulo.qryremiaux2.RecordCount>0 then
  begin
      modulo.QryDevoluciones.close;
      modulo.QryDevoluciones.Open('select * from devoluciones');

        cantidad_articulos;
        if ban then //bandera para comprobar que no se devuelvan mas articulos de los comprados en la nota
        begin
           fverificausu.ShowModal;
          if fverificausu.verificar('devoagregar')then
          begin
            modulo.qryremiaux2.First;
            while not modulo.qryremiaux2.Eof do
            begin
              modulo.QryDevoluciones.Append;
              modulo.QryDevoluciones['folio']:=lfolio.Caption;
              modulo.QryDevoluciones['clave']:=modulo.qryremiaux2['clave'];
              modulo.QryDevoluciones['clave_empaque']:=modulo.qryremiaux2['clave_empaque'];
              modulo.QryDevoluciones['empaque']:=modulo.qryremiaux2['empaque'];
              modulo.QryDevoluciones['producto']:=modulo.qryremiaux2['producto'];
              modulo.QryDevoluciones['cliente']:=lcliente.Caption;
              modulo.QryDevoluciones['cantidad']:=modulo.qryremiaux2['cantidad'];
               decimales:= modulo.qryremiaux2['cantidad']*modulo.qryremiaux2['precio'];
              modulo.QryDevoluciones['total']:=Format('%0:2f',[decimales]);
              modulo.QryDevoluciones['fecha']:=datetostr(efecha.Date)+ ' '+timetostr(time);
              modulo.QryDevoluciones['usuario']:=fverificausu.Lusuario.Caption;
              modulo.QryDevoluciones['CONDICION']:=Lcondicion.Caption;
              modulo.QryDevoluciones.Post;

              Finventario.aumentarInventario(modulo.qryremiaux2['clave'],modulo.qryremiaux2['clave_empaque'],modulo.qryremiaux2['cantidad']);

              modulo.qryremiaux2.Next;
            end;

            if MessageDlg('Devolucion correcta,¿deseas imprimir la informacion?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              modulo.qryremiaux2.First;suma:=0;
              while not modulo.qryremiaux2.Eof do
              begin
                modulo.qryremiaux2.Edit;
                modulo.qryremiaux2['total']:=modulo.qryremiaux2['cantidad']*modulo.qryremiaux2['precio'];
                modulo.qryremiaux2.Post;
                suma:=suma+ modulo.qryremiaux2['total'];
                modulo.qryremiaux2.Next;
              end;

              if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
              begin
                freporterecepcion.report1.DeviceType:='Screen';
              end
              else
              begin
                freporterecepcion.report1.DeviceType:='Printer';
              end;


              if modulo.QryExtras['tiquet']='0' then
                imprimirtiquet80(suma)

            end;

          close;
        end;
      end;
    end;

end;

procedure TFdevoluciones.imprimirtiquet80(var suma:real);
begin
  freporterecepcion.razon.Caption:=modulo.QryExtras['razon'];
  freporterecepcion.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  freporterecepcion.Titulo.Caption:='DEVOLUCION DE MERCANCIA';
  freporterecepcion.CLIENTE.Caption:=lcliente.Caption;
  freporterecepcion.HORA.Caption:=datetostr(efecha.date) + ' '+timetostr(time);
  freporterecepcion.total.Caption:=Format('%0:2f',[suma]);
  freporterecepcion.folio.Caption:=LFOLIO.Caption;
  freporterecepcion.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  freporterecepcion.report1.Print;

end;

end.
