unit URecepciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRecepciones = class(TForm)
    PanelBotones: TPanel;
    Agregar: TSpeedButton;
    Guardar: TSpeedButton;
    Eliminar: TSpeedButton;
    Panel: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    Bproveedores: TSpeedButton;
    GroupBox1: TGroupBox;
    Efolio: TEdit;
    Efecha: TDateTimePicker;
    Eproveedor: TEdit;
    grid: TDBGrid;
    sqlred: TFDQuery;
    Label2: TLabel;
    Eproducto: TEdit;
    label10: TLabel;
    nota: TLabel;
    QryAux: TFDQuery;
    procedure AgregarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure guardado;
    procedure total;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EproductoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure EproductoEnter(Sender: TObject);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BproveedoresClick(Sender: TObject);
    procedure EproveedorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imprimirtiquet80(cliente,folio,nfecha:string;total:real);
    procedure imprimirtiquet58(cliente,folio,nfecha:string;total:real);
    procedure verificarDevolucion;
    function obtenerPiezas(empaque:string):integer;
    procedure guardarProveedor;
    procedure guardarDevolucion;
    procedure guardarDevolucionReparto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecepciones: TFRecepciones;
  bandera:boolean;

implementation

{$R *.dfm}

uses Udatos2, Umodulo, Ureportetiquet, UProveedores, UreporteRecepcion,
  UVerificarUsuario, Uremisiones, UreporteRecepcion58, Uinventario;


procedure TFRecepciones.total;
var
  suma:real;
begin
  suma:=0;
  modulo.qryremiaux2.First;
  while not modulo.qryremiaux2.Eof do
  begin
    suma:=suma+modulo.qryremiaux2['total'];
    modulo.qryremiaux2.Next;
  end;
  nota.Caption:=Format('%0:2f',[suma]);
end;

procedure TFRecepciones.verificarDevolucion;
var
  sumaRemision,sumaDevolucion:integer;
begin
  modulo.qryremiaux2.First;
  bandera:=true;
  while ((not modulo.qryremiaux2.Eof) and (bandera=true)) do
  begin
    sumaRemision:=0;sumaDevolucion:=0;

    if modulo.qryremiaux2['cantidad']= 0 then
    begin
      showmessage('Cantidad incorrecta de '+modulo.qryremiaux2['producto']);
      bandera:=false;
      exit;
    end;

    Qryaux.Close;
    Qryaux.Open('select * from remisiones where folio = '+quotedstr(Efolio.Text)+' and clave = '+quotedstr(modulo.qryremiaux2['clave']));
    if qryaux['folio']= null then
    begin
      showmessage('El cliente no compro el producto: '+ modulo.qryremiaux2['producto']);
      bandera:=false;
      exit;
    end;


    Qryaux.First;
    while not Qryaux.Eof do
    begin
      sumaRemision:=sumaRemision+Qryaux['cantidad'];
      Qryaux.Next;
    end;

    Qryaux.Close;
    Qryaux.Open('select * from devoluciones where folio = '+quotedstr(efolio.Text)+' and clave = '+quotedstr(modulo.qryremiaux2['clave']));

    Qryaux.First;
    while not Qryaux.Eof do
    begin
      sumaDevolucion:=sumaDevolucion+Qryaux['cantidad'];
      Qryaux.Next;
    end;

    if ((modulo.qryremiaux2['cantidad'])+sumaDevolucion) > (sumaRemision) then
    begin
      showmessage('Error: el articulo: '+modulo.qryremiaux2['producto']+' tiene:'+sLineBreak+
                  'vendido: '+inttostr(sumaRemision)+sLineBreak+
                  'devolucion anterior: '+inttostr(sumaDevolucion)+sLineBreak+
                  'quieres devolver: '+ inttostr(modulo.qryremiaux2['cantidad']));
      bandera:=false;

      exit;
    end;
    modulo.qryremiaux2.Next;
  end;


end;

procedure TFRecepciones.AgregarClick(Sender: TObject);
begin
  modulo.qryinventarioaux.Open('select * from inventario');
  fdatos2.show;
end;

procedure TFRecepciones.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F2 then
    agregar.Click;

  if key = vk_delete then
    eliminar.Click;
end;

procedure TFRecepciones.guardado;
begin
  modulo.Qryimpresora.Open('select * from impresora');

  FreporteRecepcion.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  FreporteRecepcion58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

  if modulo.qryremiaux2.RecordCount>0 then
  begin
    if label1.Caption='PROVEEDOR:' then //guardar recepcion
    BEGIN
        guardarProveedor;
    END
    ELSE  //devoluciones
      begin
          IF Label1.Caption = 'CLIENTE:' THEN //devolucion de un cliente
          begin
            verificarDevolucion;
            if bandera then
            begin
              guardarDevolucion;
              close;
            end
          end
          else
          begin
            guardarDevolucionReparto;   //devolucion de repartos
            close;
          end;
      end;

  end;


end;

procedure TFRecepciones.EproductoEnter(Sender: TObject);
begin
  fdatos2.eprodu.Clear;
end;

procedure TFRecepciones.EproductoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  pre,tot:real;
begin
  if key=vk_return then
  begin
    modulo.QryEmpaque.Open('select * from inventario_empaque');
    if modulo.QryEmpaque.Locate('barras',trim(eproducto.Text),[]) and (trim(eproducto.Text)<>'0') and (trim(eproducto.Text)<>'') then
    begin
      modulo.qryinventarioaux.Open('select * from inventario where clave ='+quotedstr(modulo.QryEmpaque['clave']));

      IF modulo.qryremiaux2.Locate('clave;empaque',VarArrayOf([modulo.QryEmpaque['clave'],modulo.QryEmpaque['empaque']]),[]) THEN //encuentra el producto en la remision
        begin
          modulo.qryremiaux2.Edit;
          modulo.qryremiaux2['cantidad']:=modulo.qryremiaux2['cantidad']+1;
          modulo.qryremiaux2['producto']:=modulo.qryinventarioaux['producto'];
          modulo.qryremiaux2['empaque']:=modulo.QryEmpaque['empaque'];
          modulo.qryremiaux2['producto2']:=modulo.QryEmpaque['empaque']+' '+modulo.qryinventarioaux['producto'];
          modulo.qryremiaux2['clave']:=modulo.qryinventarioaux['clave'];
          modulo.qryremiaux2['clave_empaque']:=modulo.QryEmpaque['id'];

          pre:=modulo.QryEmpaque['PRECIO'];
          tot:=modulo.qryremiaux2['cantidad']*pre;
          modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);
          modulo.qryremiaux2['total']:=Format('%0:2f',[tot]);
          modulo.qryremiaux2.Post;
        end
        ELSE
        begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['IVA']:=0;
          pre:=modulo.QryEmpaque['PRECIO'];
          tot:=pre;
          modulo.qryremiaux2['total']:=Format('%0:2f',[tot]);

          modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);

          modulo.qryremiaux2['cantidad']:=1;
          modulo.qryremiaux2['producto']:=modulo.qryinventarioaux['producto'];
          modulo.qryremiaux2['empaque']:=modulo.QryEmpaque['empaque'];
          modulo.qryremiaux2['producto2']:=modulo.QryEmpaque['empaque']+' '+modulo.qryinventarioaux['producto'];
          modulo.qryremiaux2['clave']:=modulo.qryinventarioaux['clave'];
          modulo.qryremiaux2['clave_empaque']:=modulo.QryEmpaque['id'];
          modulo.qryremiaux2.Post;

        end;

    end
    else
      if trim(eproducto.Text)<>'' then
        showmessage('El producto no existe en el sistema');

    Eproducto.Clear;
  END;

  if key = vk_F2 then
    agregar.Click;

end;

procedure TFRecepciones.EproveedorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    modulo.Qryproveedores.Open('select * from proveedores order by nombre');
    fproveedores.Panel1.Enabled:=false;
    fproveedores.ShowModal;
  end;

end;

procedure TFRecepciones.BproveedoresClick(Sender: TObject);
begin
  modulo.Qryproveedores.Open('select * from proveedores order by nombre');
  fproveedores.Panel1.Enabled:=false;
  fproveedores.ShowModal;
end;

procedure TFRecepciones.EliminarClick(Sender: TObject);
begin
  modulo.qryremiaux2.Delete;
  total;
end;

procedure TFRecepciones.FormActivate(Sender: TObject);
begin
  modulo.qryinventarioaux.Open('select * from inventario'); //para que no tenga ningun filtro anterior
  if EFOLIO.Enabled then
    efolio.SetFocus
  else
    eproducto.SetFocus;

end;

procedure TFRecepciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  modulo.Qrylistarecepcion.Open('select * from lista_RECEPCION order by fecha desc rows 50');
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
  fdatos2.Close;
end;

procedure TFRecepciones.GuardarClick(Sender: TObject);
begin
  modulo.qryinventarioaux.Open('select * from inventario ');

  //la lista de inventario debe estar completa para encontrar a todos los productos
  if modulo.qryremiaux2.RecordCount>0 then
  begin
    if ((trim(eproveedor.Text)<>'')and(efolio.Text<>'')) then
    begin
      guardado;
    end
    else
    begin
      showmessage('Datos incompletos');
      Efolio.SetFocus;
    end;
  end;
end;

procedure TFRecepciones.guardarDevolucion;
var
  total:real;
  sfecha, nfecha, hora: string;
begin
  DateTimeToString(hora, 'HH:nn:ss', time);  //pone en 24rs el formato del reloj
  delete(hora,9,5);//borra los caracteres despues de la fecha como a.m.
  nfecha:= formatdatetime('mm/dd/yyyy',date)+' '+hora;

  try
    total:=0;
    modulo.Qrydevoluciones.Open('select * from devoluciones');
    modulo.qryremiaux2.First;

      while not modulo.qryremiaux2.Eof do
      begin
        modulo.QryDevoluciones.Append;
        modulo.QryDevoluciones['folio']:=efolio.Text;
        modulo.QryDevoluciones['clave']:=modulo.qryremiaux2['clave'];
        modulo.QryDevoluciones['clave_empaque']:='.';
        modulo.QryDevoluciones['empaque']:='.';
        modulo.QryDevoluciones['producto']:=modulo.qryremiaux2['producto'];
        modulo.QryDevoluciones['cliente']:=EPROVEEDOR.Text;

        SQLRED.Open('SELECT * FROM LISTA_REMISION WHERE FOLIO = '+QUOTEDSTR(EFOLIO.Text));
        modulo.QryDevoluciones['CONDICION']:=SQLRED['CONDICION'];
        modulo.QryDevoluciones['cantidad']:=modulo.qryremiaux2['cantidad'];
        modulo.QryDevoluciones['total']:=modulo.qryremiaux2['total'];
        modulo.QryDevoluciones['fecha']:=datetostr(efecha.Date)+ ' '+timetostr(time);
        modulo.QryDevoluciones['usuario']:=fverificausu.Lusuario.Caption;
        total:=total+modulo.qryremiaux2['total'];
        modulo.QryDevoluciones.Post;

        if modulo.QryExtras['manejar_inventario']=1 then
          Finventario.aumentarInventario(modulo.qryremiaux2['clave'],'',modulo.qryremiaux2['cantidad']);

        modulo.qryremiaux2.Next;
      end;


      if MessageDlg('Devolucion correcta,¿deseas imprimir la informacion?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

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
            imprimirtiquet80(eproveedor.Text,EFOLIO.Text,nfecha,total);
         if modulo.QryExtras['tiquet']='1' then
            imprimirtiquet58(eproveedor.Text,EFOLIO.Text,nfecha,total);

      end;
  except
    on E: Exception do
    showmessage('Ocurrio un problema en el proceso de guardado: '+ e.Message);
  end;

end;

procedure TFRecepciones.guardarDevolucionReparto;
var
  total:real;

  sfecha, nfecha, hora: string;
  cerrarVentana:boolean;
begin
  try
    sfecha:=datetimetostr(efecha.Time);
    DateTimeToString(hora, 'HH:nn:ss', time);  //pone en 24rs el formato del reloj
    delete(hora,9,5);//borra los caracteres despues de la fecha como a.m.
    nfecha:= formatdatetime('mm/dd/yyyy',date)+' '+hora;

    modulo.Qrydevoluciones.Open('select * from devoluciones');
    modulo.qryremiaux2.First;  total:=0;

      while not modulo.qryremiaux2.Eof do
      begin
        modulo.QryDevoluciones.Append;
        modulo.QryDevoluciones['folio']:=efolio.Text;
        modulo.QryDevoluciones['clave']:=modulo.qryremiaux2['clave'];
        modulo.QryDevoluciones['clave_empaque']:=modulo.qryremiaux2['clave_empaque'];
        modulo.QryDevoluciones['empaque']:=modulo.qryremiaux2['empaque'];
        modulo.QryDevoluciones['producto']:=modulo.qryremiaux2['producto'];
        modulo.QryDevoluciones['cliente']:='REPARTO: '+EPROVEEDOR.Text;
        modulo.QryDevoluciones['CONDICION']:='CONTADO';
        modulo.QryDevoluciones['cantidad']:=modulo.qryremiaux2['cantidad'];
        modulo.QryDevoluciones['total']:=modulo.qryremiaux2['total'];
        modulo.QryDevoluciones['fecha']:=datetostr(efecha.Date)+ ' '+timetostr(time);
        modulo.QryDevoluciones['usuario']:=fverificausu.Lusuario.Caption;
        total:=total+modulo.qryremiaux2['total'];
        modulo.QryDevoluciones.Post;

        if modulo.QryExtras['manejar_inventario']=1 then
          Finventario.aumentarInventario(modulo.qryremiaux2['clave'],modulo.qryremiaux2['clave_empaque'],modulo.qryremiaux2['cantidad']);


        modulo.qryremiaux2.Next;
      end;


      if MessageDlg('Devolucion correcta,¿deseas imprimir la informacion?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

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
            imprimirtiquet80(eproveedor.Text,EFOLIO.Text,nfecha,total);
          if modulo.QryExtras['tiquet']='1' then
            imprimirtiquet58(eproveedor.Text,EFOLIO.Text,nfecha,total);

      end;
  except
    on E: Exception do
    showmessage('Ocurrio un problema en el proceso de guardado: '+ e.Message);
  end;

end;

procedure TFRecepciones.guardarProveedor;
var
  total,decimales:real;
  cont:integer;
  sfecha, nfecha, hora: string;
begin
  modulo.Qrylistarecepcion.Filtered:=false;
  modulo.Qrylistarecepcion.Open('select * from lista_recepcion');
  modulo.Qrylistarecepcion.Last;
  if modulo.Qrylistarecepcion.Locate('folio;proveedor',vararrayof([efolio.Text,eproveedor.text]),[])then
  begin
    showmessage('La recepcion No.'+efolio.Text+' de este proveedor ya existe en el sistema');
    efolio.SetFocus;exit;
  end;
  DateTimeToString(hora, 'HH:nn:ss', time);  //pone en 24rs el formato del reloj
  delete(hora,9,5);//borra los caracteres despues de la fecha como a.m.
  nfecha:= formatdatetime('mm/dd/yyyy',date)+' '+hora;
  SQLRED.SQL.Clear;
  Sqlred.SQL.Add('insert into LISTA_RECEPCION (FOLIO,FECHA,TOTAL,USUARIO,PROVEEDOR)values ('+Quotedstr(efolio.Text)+','+Quotedstr(nfecha)+','+NOTA.Caption+','+Quotedstr(fverificausu.lusuario.caption)+','+Quotedstr(eproveedor.Text)+')');
  Sqlred.ExecSQL;


  modulo.QryRecepciones.Open('select * from recepciones');
  modulo.qryremiaux2.First;total:=0;
  while not modulo.qryremiaux2.Eof do
  begin
    modulo.QryRecepciones.Append;
    modulo.QryRecepciones['folio']:=efolio.Text;
    modulo.QryRecepciones['clave']:=modulo.qryremiaux2['clave'];
    modulo.QryRecepciones['clave_empaque']:='.';
    modulo.QryRecepciones['cantidad']:=modulo.qryremiaux2['cantidad'];
    modulo.QryRecepciones['empaque']:='.';
    modulo.QryRecepciones['producto']:=modulo.qryremiaux2['producto'];
    modulo.QryRecepciones['total']:=modulo.qryremiaux2['total'];
    modulo.QryRecepciones['proveedor']:=trim(eproveedor.Text);
    total:=total+modulo.qryremiaux2['total'];
    modulo.QryRecepciones.Post;

    if modulo.QryExtras['manejar_inventario']=1 then
      Finventario.aumentarInventario(modulo.qryremiaux2['clave'],modulo.qryremiaux2['clave_empaque'],modulo.qryremiaux2['cantidad']);

    modulo.qryremiaux2.Next;
  end;


  if MessageDlg('Recepcion correcta,¿deseas imprimir la informacion?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
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
        imprimirtiquet80(eproveedor.Text,EFOLIO.Text,nfecha,total)
      else
        imprimirtiquet58(eproveedor.Text,EFOLIO.Text,nfecha,total)
  end;
   efolio.Clear;eproveedor.Clear;eproducto.Clear;
   efolio.Enabled:=true;eproveedor.Enabled:=true;

  Fremisiones.Close;
end;

procedure TFRecepciones.imprimirtiquet58(cliente,folio,nfecha:string;total:real);
begin
  freporterecepcion58.razon.Caption:=modulo.QryExtras['razon'];
  freporterecepcion58.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  freporterecepcion58.fecha.Caption:='';
  freporterecepcion58.CLIENTE.Caption:=cliente;
  freporterecepcion58.total.Caption:=Format('%0:2f',[total]);
  freporterecepcion58.hora.Caption:=nfecha;;
  freporterecepcion58.folio.Caption:=folio;

  IF Label1.Caption = 'CLIENTE:' THEN
    freporterecepcion58.Titulo.Caption:='DEVOLUCION DE MERCANCIA'
  ELSE
    freporterecepcion58.Titulo.Caption:='RECEPCION DE MERCANCIA';

  freporterecepcion58.Titulo.Caption:='RECEPCION DE MERCANCIA';
  freporterecepcion58.Texto.Caption:='TICKET DE CONTROL INTERNO';
  freporterecepcion58.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  freporterecepcion58.TOTAL.Caption:=FLOATTOSTR(TOTAL);

  try
    freporterecepcion58.report1.Print;
  except
    showmessage('Hay problemas con la impresora');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    close;
  end;
end;

procedure TFRecepciones.imprimirtiquet80(cliente,folio,nfecha:string;total:real);
begin
  freporterecepcion.razon.Caption:=modulo.QryExtras['razon'];
  freporterecepcion.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  freporterecepcion.CLIENTE.Caption:=cliente;
  freporterecepcion.total.Caption:=Format('%0:2f',[total]);
  freporterecepcion.hora.Caption:=nfecha;;
  freporterecepcion.folio.Caption:=folio;

  IF (Label1.Caption = 'CLIENTE:') or (Label1.Caption = 'REPARTIDOR:') THEN
    freporterecepcion.Titulo.Caption:='DEVOLUCION DE MERCANCIA'
  ELSE
    freporterecepcion.Titulo.Caption:='RECEPCION DE MERCANCIA';


  freporterecepcion.USUARIO.Caption:=fverificausu.Lusuario.Caption;
  freporterecepcion.TOTAL.Caption:=FLOATTOSTR(TOTAL);

  try
    freporterecepcion.report1.Print;
  except
    showmessage('Hay problemas con la impresora');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    close;
  end;

end;

function TFRecepciones.obtenerPiezas(empaque: string): integer;
begin
    sqlred.Open('select piezas from inventario_empaque where id = '+quotedstr(empaque));
    obtenerPiezas:=sqlred['piezas'];
end;

end.
