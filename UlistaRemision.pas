unit UlistaRemision;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin;

type
  TFlistaRemision = class(TForm)
    PanelBotones: TPanel;
    Reutilizar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Ebuscar: TEdit;
    DBGrid1: TDBGrid;
    imprimir: TSpeedButton;
    Panel1: TPanel;
    POP: TPopupMenu;
    Devolucion1: TMenuItem;
    QryAux: TFDQuery;
    FlowPanel1: TFlowPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Eregistros: TEdit;
    Label1: TLabel;
    Tregistros: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Intercambiodemercancia1: TMenuItem;
    procedure ReutilizarClick(Sender: TObject);
    procedure RclienteClick(Sender: TObject);
    procedure RFOLIOSClick(Sender: TObject);
    procedure RSERIEClick(Sender: TObject);
    procedure Devolucion1Click(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure paginar;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure imprimirtiquet80;
    procedure imprimirtiquet80Traspaso;
    procedure imprimirtiquet58;
    procedure imprimirtiquetMatriz;
    procedure imprimirmatriz;
    procedure imprimircarta;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Intercambiodemercancia1Click(Sender: TObject);
    procedure ejecutarSQL(sentencia: string);
    procedure llenarRemiaux2;
    procedure configuracionImpresoras;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlistaRemision: TFlistaRemision;

implementation

{$R *.dfm}

uses Umodulo, Uremisiones, Udevoluciones, UVerificarUsuario, Ureportetiquet,
  Ureportenotas, Uproyecto, ureportenotascarta, Ureportetiquet58, URecepciones,
  Uintercambio;

procedure TFlistaRemision.paginar;
var
  busqueda:string;
  paginacion,registros,total,inicio,fin:integer;
begin
  paginacion:=50;
  inicio:=(strtoint(eregistros.Text)-1)*paginacion+1;
  fin:=paginacion*strtoint(eregistros.Text);
   if Length(trim(ebuscar.Text))>0  then
      begin
        modulo.QryListaremision.Open('select * from lista_REMISION where '+
                                      ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || CLIENTE || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%') +
                                      ' ORDER BY FOLIO DESC rows '+inttostr(inicio)+' to '+inttostr(fin));
        modulo.QryListaremision.Last;
        registros:=modulo.QryListaremision.RecordCount;
        total:= registros div paginacion;
        if (registros mod paginacion)>0  then
          total:=total+1;
        Tregistros.Caption:=inttostr(total);
      end
      else
      begin
        modulo.QryListaremision.Open('select count(folio) as registros from lista_remision');
        registros:=modulo.QryListaremision['registros'];
        total:= registros div paginacion;
        if (registros mod paginacion)>0  then
          total:=total+1;
        Tregistros.Caption:=inttostr(total);
        modulo.QryListaremision.Open('select * from lista_REMISION order by FOLIO desc rows '+inttostr(inicio)+' to '+inttostr(fin));
      end;

end;

procedure TFlistaRemision.configuracionImpresoras;
begin
  modulo.Qryimpresora.Open('select * from impresora');

  freportenotas.Reportenotas.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotas.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotascarta.Reportenotas.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotascarta.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];

  freportetiquet.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.report_matriz_punto.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.Report1_copia.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.reporteTraspaso.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
  begin
    freportenotas.ReporteNotas.DeviceType:='Screen';
    freportenotas.Reportecredito.DeviceType:='Screen';
    freportenotascarta.ReporteNotas.DeviceType:='Screen';
    freportenotascarta.Reportecredito.DeviceType:='Screen';
    freportetiquet.report1.DeviceType:='Screen';
    freportetiquet.Report1_copia.DeviceType:='Screen';
    freportetiquet.report2.DeviceType:='Screen';
    freportetiquet.reporteTraspaso.DeviceType:='Screen';
    freportetiquet.report_matriz_punto.DeviceType:='Screen';
    freportetiquet58.report1.DeviceType:='Screen';
    freportetiquet58.report2.DeviceType:='Screen';
  end
  else
  begin
    freportenotas.ReporteNotas.DeviceType:='Printer';
    freportenotas.Reportecredito.DeviceType:='Printer';
    freportenotascarta.ReporteNotas.DeviceType:='Printer';
    freportenotascarta.Reportecredito.DeviceType:='Printer';
    freportetiquet.report1.DeviceType:='Printer';
    freportetiquet.Report1_copia.DeviceType:='Printer';
    freportetiquet.report2.DeviceType:='Printer';
    freportetiquet.reporteTraspaso.DeviceType:='Printer';
    freportetiquet.report_matriz_punto.DeviceType:='Printer';
    freportetiquet58.report1.DeviceType:='Printer';
    freportetiquet58.report2.DeviceType:='Printer';
  end;
end;

procedure TFlistaRemision.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.Canvas.Brush.Color:= clgreen;

end;

procedure TFlistaRemision.Devolucion1Click(Sender: TObject);
var
  descuento,decimales,suma:real;
  cantidad:string;
begin
  {if modulo.QryListaremision.RecordCount>0 then
  begin
    modulo.qryinventarioaux.Close;
    modulo.qryinventarioaux.Open('select * from inventario');

    fdevoluciones.Lfolio.Caption:=modulo.QryListaremision['folio'];
    fdevoluciones.Lcliente.Caption:=modulo.QryListaremision['cliente'];
    fdevoluciones.Ldomicilio.Caption:=modulo.QryListaremision['domicilio'];
    fdevoluciones.Efecha.Date:=date;
    fdevoluciones.Lcondicion.Caption:=modulo.QryListaremision['condicion'];

    modulo.qryborraremiaux.ExecSQL;

    qryaux.Close;
    qryaux.Open('select * from remisiones where folio = '+quotedstr(modulo.QryListaremision['folio']));


    qryaux.First;
    while not qryaux.Eof do
    begin
      descuento:=modulo.QryListaremision['descuento'];
      descuento:=strtofloat(qryaux['total'])-(strtofloat(qryaux['total'])*descuento/100);
      cantidad:=Format('%0:2f',[descuento]);
      decimales:=strtoint(cantidad[Length(cantidad)-1]+cantidad[Length(cantidad)]);
      if decimales > 0 then
      begin
        if decimales > 50 then
          decimales:=(100-decimales)/100
        else
          decimales:=(50-decimales)/100
      end;

      modulo.qryremiaux2.Append;
      modulo.qryremiaux2['clave']:=qryaux['folio'];
      modulo.qryremiaux2['cantidad']:=qryaux['cantidad'];

      modulo.qryremiaux2['clave']:=qryaux['clave'];
      modulo.qryremiaux2['clave_empaque']:=qryaux['clave_empaque'];


      modulo.qryremiaux2['empaque']:=qryaux['empaque'];
      modulo.qryremiaux2['producto']:=qryaux['producto'];
      modulo.qryremiaux2['producto2']:=qryaux['empaque']+' '+qryaux['producto'];
      modulo.qryremiaux2['total']:=Format('%0:2f',[descuento+decimales]);
      suma:=(descuento+decimales)/qryaux['cantidad'];
      modulo.qryremiaux2['precio']:=Format('%0:2f',[suma]);
      modulo.qryremiaux2['iva']:='0';
      modulo.qryremiaux2['tipo']:='.';
      modulo.qryremiaux2.Post;
      qryaux.Next;
    end;

    fdevoluciones.ShowModal;

  end;
  }


  fverificausu.ShowModal;
  if fverificausu.verificar('devoagregar')then
  begin
      frecepciones.Efolio.Text:=modulo.QryListaremision['folio'];
      frecepciones.Eproveedor.Text:=modulo.QryListaremision['cliente'];
      frecepciones.Efecha.Date:=date;
      frecepciones.Label1.Caption:='CLIENTE:';
      FRecepciones.Caption:='Devolucion de mercancia' ;
      FRecepciones.nota.Caption:='0.00' ;

      frecepciones.Efolio.Enabled:=false;
      frecepciones.Eproveedor.Enabled:=false;

      frecepciones.ShowModal;
  end;
end;

procedure TFlistaRemision.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if key = vk_return then
  begin
    Eregistros.Text:='1';
    paginar;
  end;

end;

procedure TFlistaRemision.ejecutarSQL(sentencia: string);
begin
  qryaux.SQL.Clear;
  qryaux.SQL.Add(sentencia);
  qryaux.ExecSQL;
end;

procedure TFlistaRemision.FormActivate(Sender: TObject);
begin
  modulo.QryExtras.Open('select * from extras');
  //SI ACTIVO LA 2DA CAJA, NO SE DEBE HACER DEVOLUCIONES NI REIMPRESIONES EN LOS NODOS
  //POP.Items[0].Enabled:= NOT(modulo.QryExtras['segundacaja']='1'); //true
  //IMPRIMIR.Enabled:= NOT(modulo.QryExtras['segundacaja']='1'); //true
  IMPRIMIR.Enabled:=true;
end;

procedure TFlistaRemision.imprimircarta;
var
  fechacredito: TDateTime;
  pre:real;
  paginas,aux:integer;
begin
  if MODULO.QryListaremision['CONDICION']='COTIZACION' then
  BEGIN
    freportenotascarta.razon.Visible:=FALSE;
    freportenotascarta.titulo1.Visible:=FALSE;
    freportenotascarta.titulo2.Visible:=FALSE;
    freportenotascarta.rfc.Visible:=FALSE;
    freportenotascarta.direc.Visible:=FALSE;
    freportenotascarta.telefono.Visible:=FALSE;
    freportenotascarta.whatsapp.Visible:=FALSE;
    freportenotascarta.IMAGEN.Visible:=FALSE;
    //freportenotascarta.COTIZACION.Visible:=TRUE;

    freportenotascarta.razon1.Visible:=FALSE;
    freportenotascarta.titulo3.Visible:=FALSE;
    freportenotascarta.titulo4.Visible:=FALSE;
    freportenotascarta.rfc2.Visible:=FALSE;
    freportenotascarta.direcc2.Visible:=FALSE;
    freportenotascarta.telefono2.Visible:=FALSE;
    freportenotascarta.whatsapp2.Visible:=FALSE;
    freportenotascarta.IMAGEN2.Visible:=FALSE;
    freportenotascarta.COTIZACION2.Visible:=TRUE;
  END;


  if modulo.QryListaremision['impresion']='SERIE' then
  begin
    if modulo.QryListaremision['condicion']='CREDITO' then
      BEGIN
        //22 registros entran completos en una hoja
        //despues de 34 registros agrega otra hoja
        paginas:=1;aux:=23;
        if modulo.qryRemisiones.RecordCount<aux then
          Freportenotascarta.paginas2.Caption:='1 PAGINA'
        ELSE
        while aux <= modulo.qryRemisiones.RecordCount do
        begin
          inc(paginas);
          Freportenotascarta.paginas2.Caption:=inttostr(paginas)+' PAGINAS';
          aux:=aux+34;
        end;

        Freportenotascarta.razon1.Caption:=modulo.QryExtras['razon'];
        Freportenotascarta.razon2.Caption:=modulo.QryExtras['nombre1'];
        Freportenotascarta.titulo4.Caption:=modulo.QryExtras['nombre2'];
        Freportenotascarta.rfc2.Caption:='RFC: '+modulo.QryExtras['rfc'];
        Freportenotascarta.direcc2.Caption:=modulo.QryExtras['direccion'];
        Freportenotascarta.telefono2.Caption:=modulo.QryExtras['telefono'];
        Freportenotascarta.whatsapp2.Caption:=modulo.QryExtras['whatsapp'];

        fechacredito:=modulo.QryListaremision['FECHA'];

        Freportenotascarta.FECHAPAGO.Caption:=datetostr(fechacredito+15);
        Freportenotascarta.folio2.Caption:=modulo.QryListaremision['folio'];
        Freportenotascarta.cliente2.Caption:=modulo.QryListaremision['cliente'];
        Freportenotascarta.direccion2.Caption:=modulo.QryListaremision['DOMICILIO'];
        Freportenotascarta.fecha2.Caption:=modulo.QryListaremision['FECHA'];
        Freportenotascarta.hora2.Caption:='';
        Freportenotascarta.stotal2.Caption:=Format('%0:2f',[strtofloat(modulo.QryListaremision['total'])]);
        Freportenotascarta.usuario2.Caption:=modulo.QryListaremision['VENDEDOR'];
        Freportenotascarta.CONDICION2.Caption:=modulo.QryListaremision['CONDICION'];
        Freportenotascarta.Reportecredito.Print;
      END
      ELSE
      BEGIN
        //27 registros entran completos en una hoja
        //despues de 34 registros agrega otra hoja
        paginas:=1;aux:=28;
        if modulo.qryRemisiones.RecordCount<aux then
          Freportenotascarta.paginas.Caption:='1 PAGINA'
        ELSE
        while aux <= modulo.qryRemisiones.RecordCount do
        begin
          inc(paginas);
          Freportenotascarta.paginas.Caption:=inttostr(paginas)+' PAGINAS';
          aux:=aux+34;
        end;

        Freportenotascarta.razon.Caption:=modulo.QryExtras['razon'];
        Freportenotascarta.titulo1.Caption:=modulo.QryExtras['nombre1'];
        Freportenotascarta.titulo2.Caption:=modulo.QryExtras['nombre2'];
        Freportenotascarta.rfc.Caption:='RFC: '+modulo.QryExtras['rfc'];
        Freportenotascarta.direc.Caption:=modulo.QryExtras['direccion'];
        Freportenotascarta.telefono.Caption:=modulo.QryExtras['telefono'];
        Freportenotascarta.whatsapp.Caption:=modulo.QryExtras['whatsapp'];
        //Freportenotascarta.COTIZACION.Visible:=FALSE;

        Freportenotascarta.efolio.Caption:=modulo.QryListaremision['FOLIO'];
        Freportenotascarta.ecliente.Caption:=modulo.QryListaremision['cliente'];
        Freportenotascarta.edireccion.Caption:=modulo.QryListaremision['DOMICILIO'];
        Freportenotascarta.efecha.Caption:=modulo.QryListaremision['FECHA'];
        Freportenotascarta.ehora.Caption:='';
        Freportenotascarta.stotal.Caption:=Format('%0:2f',[strtofloat(modulo.QryListaremision['total'])]);
        Freportenotascarta.eusuario.Caption:=modulo.QryListaremision['VENDEDOR'];
        Freportenotascarta.eCONDICION.Caption:=modulo.QryListaremision['CONDICION'];
        Freportenotascarta.Reportenotas.Print;
      END;
  end;



  if MODULO.QryListaremision['CONDICION']='COTIZACION' then
  BEGIN
    freportenotascarta.razon.Visible:=TRUE;
    freportenotascarta.titulo1.Visible:=TRUE;
    freportenotascarta.titulo2.Visible:=TRUE;
    freportenotascarta.rfc.Visible:=TRUE;
    freportenotascarta.direc.Visible:=TRUE;
    freportenotascarta.telefono.Visible:=TRUE;
    freportenotascarta.whatsapp.Visible:=TRUE;
    freportenotascarta.IMAGEN.Visible:=TRUE;
    //freportenotascarta.COTIZACION.Visible:=FALSE;

    freportenotascarta.razon1.Visible:=TRUE;
    freportenotascarta.titulo3.Visible:=TRUE;
    freportenotascarta.titulo4.Visible:=TRUE;
    freportenotascarta.rfc2.Visible:=TRUE;
    freportenotascarta.direcc2.Visible:=TRUE;
    freportenotascarta.telefono2.Visible:=TRUE;
    freportenotascarta.whatsapp2.Visible:=TRUE;
    freportenotascarta.IMAGEN2.Visible:=TRUE;
    freportenotascarta.COTIZACION2.Visible:=FALSE;
  END;

end;

procedure TFlistaRemision.imprimirClick(Sender: TObject);
var
  fechacredito: TDateTime;
  pre:real;
  paginas,aux:integer;
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remimodificar')then
  begin
     if modulo.QryListaremision.RecordCount>0 then
     begin
          llenarRemiaux2;
          modulo.QryExtras.Open('select * from extras');

          freportenotas.Reportenotas.ShowPrintDialog:= modulo.QryRemisiones.RecordCount>8;
          freportenotas.Reportecredito.ShowPrintDialog:= modulo.QryRemisiones.RecordCount>5;
          //8 registros entran completos en una hoja
          //despues de 11 registros agrega otra hoja
          paginas:=1;aux:=9;
          if modulo.qryremiaux2.RecordCount<9 then
            freportenotas.paginas.Caption:='1 PAGINA'
          ELSE
          while aux <= modulo.qryremiaux2.RecordCount do
          begin
            inc(paginas);
            freportenotas.paginas.Caption:=inttostr(paginas)+' PAGINAS';
            aux:=aux+11;
          end;

          FREMISIONES.total('SI');FREMISIONES.letra;

          configuracionImpresoras;

          if modulo.QryListaremision['condicion']='TRASPASO' then
            imprimirtiquet80Traspaso
          else
          begin
            if modulo.QryListaremision['impresion']='TICKET' then
            begin
              if modulo.QryExtras['tiquet']='0' then
                imprimirtiquet80;
              if modulo.QryExtras['tiquet']='1' then
                imprimirtiquet58;
              if modulo.QryExtras['tiquet']='2' then
                imprimirtiquetMatriz;
            end
            else
            begin
              if modulo.QryExtras['notas']='0' then
                imprimirmatriz
              else
                imprimircarta;
            end;

          end;

          modulo.qryborraremiaux.ExecSQL;
          modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
     end;

  end;
end;

procedure TFlistaRemision.imprimirmatriz;
var
  fechacredito: TDateTime;
  pre:real;
  paginas,aux:integer;
begin
  if MODULO.QryListaremision['CONDICION']='COTIZACION' then
  BEGIN
    freportenotas.razon.Visible:=FALSE;
    freportenotas.titulo1.Visible:=FALSE;
    freportenotas.titulo2.Visible:=FALSE;
    freportenotas.rfc.Visible:=FALSE;
    freportenotas.direc.Visible:=FALSE;
    freportenotas.telefono.Visible:=FALSE;
    freportenotas.whatsapp.Visible:=FALSE;
    freportenotas.IMAGEN.Visible:=FALSE;
    freportenotas.COTIZACION.Visible:=TRUE;

    freportenotas.razon1.Visible:=FALSE;
    freportenotas.titulo3.Visible:=FALSE;
    freportenotas.titulo4.Visible:=FALSE;
    freportenotas.rfc2.Visible:=FALSE;
    freportenotas.direcc2.Visible:=FALSE;
    freportenotas.telefono2.Visible:=FALSE;
    freportenotas.whatsapp2.Visible:=FALSE;
    freportenotas.IMAGEN2.Visible:=FALSE;
    freportenotas.COTIZACION2.Visible:=TRUE;
  END;



  if modulo.QryListaremision['impresion']='SERIE' then
  begin
    if modulo.QryListaremision['condicion']='CREDITO' then
      BEGIN
        //21 registros entran completos en una hoja
        //despues de 34 registros agrega otra hoja
        paginas:=1;aux:=22;
        if modulo.qryRemisiones.RecordCount<aux then
          Freportenotascarta.paginas2.Caption:='1 PAGINA'
        ELSE
        while aux <= modulo.qryRemisiones.RecordCount do
        begin
          inc(paginas);
          Freportenotascarta.paginas2.Caption:=inttostr(paginas)+' PAGINAS';
          aux:=aux+34;
        end;

        Freportenotascarta.razon1.Caption:=modulo.QryExtras['razon'];
        Freportenotascarta.razon2.Caption:=modulo.QryExtras['nombre1'];
        Freportenotascarta.titulo4.Caption:=modulo.QryExtras['nombre2'];
        Freportenotascarta.rfc2.Caption:='RFC: '+modulo.QryExtras['rfc'];
        Freportenotascarta.direcc2.Caption:=modulo.QryExtras['direccion'];
        Freportenotascarta.telefono2.Caption:=modulo.QryExtras['telefono'];
        Freportenotascarta.whatsapp2.Caption:=modulo.QryExtras['whatsapp'];

        fechacredito:=modulo.QryListaremision['FECHA'];

        Freportenotascarta.FECHAPAGO.Caption:=datetostr(fechacredito+15);
        Freportenotascarta.folio2.Caption:=modulo.QryListaremision['folio'];
        Freportenotascarta.cliente2.Caption:=modulo.QryListaremision['cliente'];
        Freportenotascarta.direccion2.Caption:=modulo.QryListaremision['DOMICILIO'];
        Freportenotascarta.fecha2.Caption:=modulo.QryListaremision['FECHA'];
        Freportenotascarta.hora2.Caption:='';
        Freportenotascarta.stotal2.Caption:=Format('%0:2f',[strtofloat(modulo.QryListaremision['total'])]);
        Freportenotascarta.usuario2.Caption:=modulo.QryListaremision['VENDEDOR'];
        Freportenotascarta.CONDICION2.Caption:=modulo.QryListaremision['CONDICION'];
        Freportenotascarta.Reportecredito.Print;
      END
      ELSE
      BEGIN
        //27 registros entran completos en una hoja
        //despues de 34 registros agrega otra hoja
        paginas:=1;aux:=28;
        if modulo.qryRemisiones.RecordCount<aux then
          Freportenotascarta.paginas2.Caption:='1 PAGINA'
        ELSE
        while aux <= modulo.qryRemisiones.RecordCount do
        begin
          inc(paginas);
          Freportenotascarta.paginas2.Caption:=inttostr(paginas)+' PAGINAS';
          aux:=aux+34;
        end;
        Freportenotascarta.razon1.Caption:=modulo.QryExtras['razon'];
        Freportenotascarta.razon2.Caption:=modulo.QryExtras['nombre1'];
        Freportenotascarta.titulo4.Caption:=modulo.QryExtras['nombre2'];
        Freportenotascarta.rfc2.Caption:='RFC: '+modulo.QryExtras['rfc'];
        Freportenotascarta.direcc2.Caption:=modulo.QryExtras['direccion'];
        Freportenotascarta.telefono2.Caption:=modulo.QryExtras['telefono'];
        Freportenotascarta.whatsapp2.Caption:=modulo.QryExtras['whatsapp'];
        Freportenotascarta.COTIZACION2.Visible:=FALSE;

        Freportenotascarta.folio2.Caption:=modulo.QryListaremision['FOLIO'];
        Freportenotascarta.cliente2.Caption:=modulo.QryListaremision['cliente'];
        Freportenotascarta.direccion2.Caption:=modulo.QryListaremision['DOMICILIO'];
        Freportenotascarta.fecha2.Caption:=modulo.QryListaremision['FECHA'];
        Freportenotascarta.hora2.Caption:='';
        Freportenotascarta.stotal2.Caption:=Format('%0:2f',[strtofloat(modulo.QryListaremision['total'])]);
        Freportenotascarta.usuario2.Caption:=modulo.QryListaremision['VENDEDOR'];
        Freportenotascarta.CONDICION2.Caption:=modulo.QryListaremision['CONDICION'];
        Freportenotascarta.Reportenotas.Print;
      END;
  end;



  if MODULO.QryListaremision['CONDICION']='COTIZACION' then
  BEGIN
    freportenotas.razon.Visible:=TRUE;
    freportenotas.titulo1.Visible:=TRUE;
    freportenotas.titulo2.Visible:=TRUE;
    freportenotas.rfc.Visible:=TRUE;
    freportenotas.direc.Visible:=TRUE;
    freportenotas.telefono.Visible:=TRUE;
    freportenotas.whatsapp.Visible:=TRUE;
    freportenotas.IMAGEN.Visible:=TRUE;
    freportenotas.COTIZACION.Visible:=FALSE;

    freportenotas.razon1.Visible:=TRUE;
    freportenotas.titulo3.Visible:=TRUE;
    freportenotas.titulo4.Visible:=TRUE;
    freportenotas.rfc2.Visible:=TRUE;
    freportenotas.direcc2.Visible:=TRUE;
    freportenotas.telefono2.Visible:=TRUE;
    freportenotas.whatsapp2.Visible:=TRUE;
    freportenotas.IMAGEN2.Visible:=TRUE;
    freportenotas.COTIZACION2.Visible:=FALSE;
  END;

end;

procedure TFlistaRemision.imprimirtiquet58;
begin
  if modulo.QryListaremision['impresion']='TICKET' then
  begin
    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet58.razon.Visible:=FALSE;
      freportetiquet58.nombre.Visible:=FALSE;
      freportetiquet58.rfc.Visible:=FALSE;
      freportetiquet58.direccion.Visible:=FALSE;
      freportetiquet58.telefono.Visible:=FALSE;
      freportetiquet58.ppImage1.Visible:=false;
      freportetiquet58.ppLabel7.Visible:=false;
      freportetiquet58.COTIZACION1.Visible:=TRUE;
    END;

    freportetiquet58.razon.Caption:=modulo.QryExtras['razon'];
    freportetiquet58.rfc.Caption:=modulo.QryExtras['rfc'];
    freportetiquet58.direccion.Caption:=modulo.QryExtras['direccion'];
    freportetiquet58.telefono.Caption:=modulo.QryExtras['telefono'];
    freportetiquet58.Eusuario.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet58.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
    freportetiquet58.ecliente1.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet58.Efecha.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet58.Efolio.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet58.ETOTAL.Caption:=FREMISIONES.nota.Caption;
    freportetiquet58.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
    freportetiquet58.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
    freportetiquet58.CONDICION.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet58.Eusuario2.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet58.ecliente2.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet58.Efecha2.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet58.Efolio2.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet58.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
    //freportetiquet58.CONDICION2.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet58.Eusuario3.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet58.ecliente3.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet58.Efecha3.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet58.Efolio3.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet58.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
    freportetiquet58.CONDICION3.Caption:=modulo.QryListaremision['condicion'];

    try
      freportetiquet58.report1.Print;
    except
      showmessage('Hay error con la impresora');
    end;

    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet58.razon.Visible:=true;
      freportetiquet58.nombre.Visible:=true;
      freportetiquet58.rfc.Visible:=true;
      freportetiquet58.direccion.Visible:=true;
      freportetiquet58.telefono.Visible:=true;
      freportetiquet58.ppImage1.Visible:=true;
      freportetiquet58.ppLabel7.Visible:=true;
      freportetiquet58.COTIZACION1.Visible:=FALSE;
    END;

  end

end;

procedure TFlistaRemision.imprimirtiquet80;
begin
  if modulo.QryListaremision['impresion']='TICKET' then
  begin
    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet.razon.Visible:=FALSE;
      freportetiquet.nombre.Visible:=FALSE;
      freportetiquet.rfc.Visible:=FALSE;
      freportetiquet.direccion.Visible:=FALSE;
      freportetiquet.telefono.Visible:=FALSE;
      freportetiquet.COTIZACION.Visible:=TRUE;
    END;

    freportetiquet.razon.Caption:=modulo.QryExtras['razon'];
    freportetiquet.rfc.Caption:=modulo.QryExtras['rfc'];
    freportetiquet.direccion.Caption:=modulo.QryExtras['direccion'];
    freportetiquet.telefono.Caption:=modulo.QryExtras['telefono'];
    freportetiquet.Eusuario.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
    freportetiquet.ecliente1.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.EDOMICILIO1.Caption:=modulo.QryListaremision['domicilio'];
    freportetiquet.Efecha.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.Efolio.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTAL.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
    freportetiquet.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
    freportetiquet.CONDICION.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet.Eusuario2.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.ecliente2.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.Efecha2.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.Efolio2.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.CONDICION2.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet.Eusuario3.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.ecliente3.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.Efecha3.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.Efolio3.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.CONDICION3.Caption:=modulo.QryListaremision['condicion'];

    try
      freportetiquet.report1.Print;
      freportetiquet.Report1_copia.Print;
    except
      showmessage('Hay error con la impresora');
    end;

    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet.razon.Visible:=true;
      freportetiquet.nombre.Visible:=true;
      freportetiquet.rfc.Visible:=true;
      freportetiquet.direccion.Visible:=true;
      freportetiquet.telefono.Visible:=true;
      freportetiquet.COTIZACION.Visible:=false;
    END;

  end;
end;

procedure TFlistaRemision.imprimirtiquet80Traspaso;
begin
  FREMISIONES.total('SI');
  freportetiquet.Trazon.Caption:=modulo.QryExtras['razon'];
  freportetiquet.Tusuario.Caption:=modulo.QryListaremision['vendedor'];
  freportetiquet.Tcliente.Caption:=modulo.QryListaremision['cliente'];
  freportetiquet.Tfecha.Caption:=modulo.QryListaremision['fecha'];
  freportetiquet.Tfolio.Caption:=modulo.QryListaremision['folio'];
  freportetiquet.ttotal.Caption:=modulo.QryListaremision['total'];

  try
    freportetiquet.reporteTraspaso.Print;
  except
    showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
  end;
end;

procedure TFlistaRemision.imprimirtiquetMatriz;
begin
   if modulo.QryListaremision['impresion']='TICKET' then
  begin
    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet.razonM.Visible:=FALSE;
      freportetiquet.nombreM.Visible:=FALSE;
      freportetiquet.rfcM.Visible:=FALSE;
      freportetiquet.direccionM.Visible:=FALSE;
      freportetiquet.telefonoM.Visible:=FALSE;
      freportetiquet.COTIZACIONM.Visible:=TRUE;
    END;

    freportetiquet.razonM.Caption:=modulo.QryExtras['razon'];
    freportetiquet.rfcM.Caption:=modulo.QryExtras['rfc'];
    freportetiquet.direccionM.Caption:=modulo.QryExtras['direccion'];
    freportetiquet.telefonoM.Caption:=modulo.QryExtras['telefono'];
    freportetiquet.EusuarioM.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.nombreM.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
    freportetiquet.eclienteM.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.EDOMICILIOM.Caption:=modulo.QryListaremision['domicilio'];
    freportetiquet.EfechaM.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.EfolioM.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTALM.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
    freportetiquet.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
    freportetiquet.CONDICIONM.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet.Eusuario2.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.ecliente2.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.Efecha2.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.Efolio2.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.CONDICION2.Caption:=modulo.QryListaremision['condicion'];

    freportetiquet.Eusuario3.Caption:=modulo.QryListaremision['vendedor'];
    freportetiquet.ecliente3.Caption:=modulo.QryListaremision['cliente'];
    freportetiquet.Efecha3.Caption:=modulo.QryListaremision['fecha'];
    freportetiquet.Efolio3.Caption:=modulo.QryListaremision['Folio'];
    freportetiquet.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
    freportetiquet.CONDICION3.Caption:=modulo.QryListaremision['condicion'];

    try
      freportetiquet.report_matriz_punto.Print;
    except
      showmessage('Hay error con la impresora');
    end;

    if MODULO.QryListaremision['CONDICION']='COTIZACION' then
    BEGIN
      freportetiquet.razonM.Visible:=true;
      freportetiquet.nombreM.Visible:=true;
      freportetiquet.rfcM.Visible:=true;
      freportetiquet.direccionM.Visible:=true;
      freportetiquet.telefonoM.Visible:=true;
      freportetiquet.COTIZACIONM.Visible:=false;
    END;

  end;

end;

procedure TFlistaRemision.Intercambiodemercancia1Click(Sender: TObject);
begin
  fintercambio.Lfolio.Caption:=MODULO.QryListaremision['FOLIO'];
  fintercambio.Lnombre.Caption:=MODULO.QryListaremision['CLIENTE'];
  fintercambio.LTOTAL.Caption:=MODULO.QryListaremision['TOTAL'];
  fintercambio.ECANTIDAD.Clear;
  fintercambio.Qrysimilar.Close;
  fintercambio.Qrynota.Open('SELECT * FROM REMISIONES WHERE FOLIO = '+QUOTEDSTR(MODULO.QryListaremision['FOLIO']));
  fintercambio.ShowModal;
end;

procedure TFlistaRemision.llenarRemiaux2;
var
  pre:real;
begin
  ejecutarSQL('delete from lista_remision_reimpresion');
  ejecutarSQL('delete from remisiones_reimpresion');
  ejecutarSQL('INSERT INTO REMISIONES_REIMPRESION SELECT * FROM REMISIONES WHERE TIPO = '+QUOTEDSTR(modulo.QryListaremision['impresion'])+' and FOLIO = '+inttostr(modulo.QryListaremision['folio']));


  modulo.QryRemisiones.Open('select * from REMISIONES_REIMPRESION');
  modulo.qryinventarioaux.Open('select * from inventario');
  modulo.qryinventarioaux.Last;
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

  fremisiones.Edescuento.Text:=modulo.QryListaremision['descuento'];

  fremisiones.Edescuento.Text:=modulo.QryListaremision['descuento'];
  modulo.Qryremisiones.Last;modulo.Qryremisiones.First;
  while not (modulo.Qryremisiones.Eof) do  //agrega la remision que se quiere aditar a la ventana de remisiones
  begin
    modulo.qryremiaux2.Append;
    modulo.qryremiaux2['empaque']:=modulo.Qryremisiones['empaque'];
    modulo.qryremiaux2['producto']:=modulo.Qryremisiones['producto'];

    //agregar doble espacio si es producto surtido
    if strtofloat(modulo.QryRemisiones['total'])>0then
      modulo.qryremiaux2['producto2']:=modulo.Qryremisiones['empaque']+' '+modulo.Qryremisiones['producto']
    else
      modulo.qryremiaux2['producto2']:='      '+modulo.Qryremisiones['empaque']+' '+modulo.Qryremisiones['producto'];

      if modulo.qryinventarioaux.Locate('producto',trim(modulo.Qryremisiones['producto']),[loPartialKey])then
      begin
        modulo.Qryremiaux2['IVA']:=0;
        if modulo.qryinventarioaux['iva']>0 then
          modulo.Qryremiaux2['IVA']:=16;
        if modulo.qryinventarioaux['ieps']>0 then
          modulo.Qryremiaux2['IVA']:=8;
      end
      else   //encontrar impuesto si el producto es lista surtida
      begin
        Ebuscar.Text := trim(modulo.Qryremisiones['producto']);
        modulo.QrySimilar.Open('select * from similar');
        modulo.QryListaSimilar.Open('select * from lista_similar where descripcion = '+quotedstr(modulo.QryRemisiones['producto']));

        if modulo.QryListaSimilar['clave']<>null then
          if modulo.QrySimilar.Locate('clave',modulo.QryListaSimilar['clave'],[]) then
            if modulo.qryinventarioaux.Locate('clave',modulo.QrySimilar['producto']) then
            begin
              //SHOWMESSAGE(modulo.qryinventarioaux['IVA']);
              modulo.qryremiaux2['IVA']:=0;
              if modulo.qryinventarioaux['iva']>0 then
                modulo.qryremiaux2['IVA']:=16;
              if modulo.qryinventarioaux['ieps']>0 then
                modulo.qryremiaux2['IVA']:=8;
            end;

      end;

      modulo.Qryremiaux2['cantidad']:=modulo.Qryremisiones['cantidad'];
      modulo.Qryremiaux2['clave']:=modulo.Qryremisiones['producto'];
      modulo.Qryremiaux2['total']:=modulo.Qryremisiones['total'];
      modulo.Qryremiaux2['descuento']:=modulo.Qryremisiones['descuento'];
      modulo.Qryremiaux2['tipo']:=modulo.QryListaremision['impresion'];
      pre:=modulo.Qryremisiones['total']/modulo.Qryremisiones['cantidad'];
      modulo.Qryremiaux2['precio']:=trim(Format('%0:2f',[pre]));
      modulo.Qryremiaux2.Post;
      modulo.QryRemisiones.Next;
  end;
end;

procedure TFlistaRemision.RFOLIOSClick(Sender: TObject);
var
  paginacion,registros,total:integer;
begin
  paginacion:=2;
  modulo.Qrylista_folios.Open('select count(folio) as registros from lista_folios');
  registros:=modulo.Qrylista_folios['registros'];
  total:= registros div paginacion;
  if (registros mod paginacion)>0  then
    total:=total+1;
  Tregistros.Caption:=inttostr(total);
  Eregistros.Text:='1';
   modulo.Qrylista_folios.Close;modulo.Qrylista_folios.Open('select * from lista_folios order by FOLIO desc rows 50');
   DBGRID1.DataSource:=MODULO.Dslista_folios;
end;

procedure TFlistaRemision.RSERIEClick(Sender: TObject);
var
  paginacion,registros,total:integer;
begin
  paginacion:=2;
  modulo.QryListaremision.Open('select count(folio) as registros from lista_remision');
  registros:=modulo.QryListaremision['registros'];
  total:= registros div paginacion;
  if (registros mod paginacion)>0  then
    total:=total+1;
  Tregistros.Caption:=inttostr(total);
  Eregistros.Text:='1';
  modulo.QryListaremision.Close;modulo.QryListaremision.Open('select * from lista_REMISION order by FOLIO desc rows 1 to '+inttostr(paginacion));
  DBGRID1.DataSource:=MODULO.DsListaremision;

end;

procedure TFlistaRemision.SpeedButton1Click(Sender: TObject);
var
  numero:integer;
begin
  numero := strtoint(eregistros.text);
  dec(numero);
  if numero > 0 then
  begin
    eregistros.text:=inttostr(numero);
    paginar;
  end;

end;

procedure TFlistaRemision.SpeedButton2Click(Sender: TObject);
var
  numero:integer;
begin
  numero := strtoint(eregistros.text);
  inc(numero);
  if numero <= strtoint(tregistros.Caption) then
  begin
    eregistros.text:=inttostr(numero);
    paginar;
  end;

end;

procedure TFlistaRemision.SpeedButton3Click(Sender: TObject);
begin
  qryaux.SQL.Clear;
  qryaux.SQL.Add('update lista_REMISION set estado = '+quotedstr('PAGADO')+ 'where CONDICION='+quotedstr('CREDITO'));
  QRYAUX.ExecSQL;
end;

procedure TFlistaRemision.SpeedButton4Click(Sender: TObject);
begin
  MODULO.QryListaremision.Edit;
  MODULO.QryListaremision['ESTADO']:='PAGADO';
  MODULO.QryListaremision.Post;

end;

procedure TFlistaRemision.SpeedButton5Click(Sender: TObject);
begin
  MODULO.QryListaremision.Edit;
  MODULO.QryListaremision['ESTADO']:='PENDIENTE';
  MODULO.QryListaremision.Post;
end;

procedure TFlistaRemision.RclienteClick(Sender: TObject);
begin
  EBUSCAR.SetFocus;
end;

procedure TFlistaRemision.ReutilizarClick(Sender: TObject);
var
  pre:real;
  id:byte;
begin
  if modulo.QryExtras['verificar_fecha']=1 then
    if not fprincipal.checar_fecha_actualizacion then  // avisa si falta actualizar el inventario
      exit;


  if modulo.QryListaremision.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('remiagregar')then
    begin
        fremisiones.Ltraspasos.Caption:='NO'; //bandera que indica si se realiza traspaso entre tiendas
        id:=0;//variable para identificar los articulos que pertenecen a una lista surtida

        ejecutarSQL('delete from lista_remision_reimpresion');
        ejecutarSQL('delete from remisiones_reimpresion');
        ejecutarSQL('INSERT INTO REMISIONES_REIMPRESION SELECT * FROM REMISIONES WHERE TIPO <> '+QUOTEDSTR('FOLIO')+' and FOLIO = '+inttostr(modulo.QryListaremision['folio']));

        modulo.qryborraremiaux.ExecSQL;

        modulo.QryEmpaque.Open('select * from inventario_empaque');

        modulo.qryinventarioaux.Filtered:=false;
        modulo.qryinventarioaux.Open('select * from inventario');

        modulo.QryRemisiones.Open('select * from REMISIONES_REIMPRESION');
        {modulo.QryRemisiones.Filtered:=false;

        if rserie.Checked then
          modulo.QryRemisiones.Filter:=  ' folio ='+quotedstr(modulo.QryListaremision['folio'])+' and tipo = '+quotedstr(modulo.QryListaremision['impresion'])
        else
          modulo.QryRemisiones.Filter:=  ' folio ='+quotedstr(modulo.Qrylista_folios['folio'])+' and tipo = '+quotedstr(modulo.Qrylista_folios['impresion']);

        modulo.QryRemisiones.Filtered:=true;}

        modulo.QryRemisiones.First;
        while not (modulo.QryRemisiones.Eof) do  //agrega la remision que se quiere aditar a la ventana de remisiones
        begin

            modulo.qryremiaux2.Append;
            if modulo.QryRemisiones['empaque'] <> null then
              modulo.qryremiaux2['empaque']:=modulo.QryRemisiones['empaque'];
            modulo.qryremiaux2['producto']:=modulo.QryRemisiones['producto'];

            //agregar doble espacio si es producto surtido
            if strtofloat(modulo.QryRemisiones['total'])>0then
              modulo.qryremiaux2['producto2']:=modulo.Qryremisiones['empaque']+' '+modulo.Qryremisiones['producto']
            else
              modulo.qryremiaux2['producto2']:='      '+modulo.Qryremisiones['empaque']+' '+modulo.Qryremisiones['producto'];

            modulo.qryremiaux2['IVA']:=0;
            if modulo.qryinventarioaux.Locate('producto',modulo.QryRemisiones['producto'],[])then
            begin
              if modulo.qryinventarioaux['iva']>0 then
                modulo.qryremiaux2['IVA']:=16;
              if modulo.qryinventarioaux['ieps']>0 then
                modulo.qryremiaux2['IVA']:=8;
            end
            else  //encontrar impuesto si el producto es lista surtida
            begin
              modulo.QrySimilar.Open('select * from similar');
              modulo.QryListaSimilar.Open('select * from lista_similar where descripcion = '+quotedstr(modulo.QryRemisiones['producto']));

              if modulo.QryListaSimilar['clave']<>null then
                if modulo.QrySimilar.Locate('clave',modulo.QryListaSimilar['clave'],[]) then
                  if modulo.qryinventarioaux.Locate('clave',modulo.QrySimilar['producto']) then
                  begin
                    //SHOWMESSAGE(modulo.qryinventarioaux['IVA']);
                    modulo.qryremiaux2['IVA']:=0;
                    if modulo.qryinventarioaux['iva']>0 then
                      modulo.qryremiaux2['IVA']:=16;
                    if modulo.qryinventarioaux['ieps']>0 then
                      modulo.qryremiaux2['IVA']:=8;
                  end;

            end;

            modulo.qryremiaux2['cantidad']:=modulo.QryRemisiones['cantidad'];
            IF modulo.QryRemisiones['clave']= '' THEN
              modulo.qryremiaux2['clave']:='.'
            else
              modulo.qryremiaux2['clave']:=modulo.QryRemisiones['clave'];

            if modulo.QryRemisiones['clave_empaque']= '' then
              modulo.qryremiaux2['clave_empaque']:='.'
            else
              modulo.qryremiaux2['clave_empaque']:=modulo.QryRemisiones['clave_empaque'];
            modulo.qryremiaux2['total']:=modulo.QryRemisiones['total'];
            //if modulo.QryRemisiones['descuento']<>null then
              //modulo.qryremiaux2['descuento']:=modulo.QryRemisiones['descuento'];
            modulo.qryremiaux2['tipo']:=modulo.QryListaremision['impresion'];
            pre:=modulo.QryRemisiones['total']/modulo.QryRemisiones['cantidad'];
            modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);


            if not modulo.QryEmpaque.Locate('empaque',modulo.QryRemisiones['empaque'],[])then
            begin
              inc(id);
              modulo.qryremiaux2['surtir']:=inttostr(id);
            end;

            if strtofloat(modulo.QryRemisiones['total'])=0 then
              modulo.qryremiaux2['surtir']:=inttostr(id);



            modulo.qryremiaux2.Post;

          modulo.QryRemisiones.Next;
        end;


        FREMISIONES.Ecliente.Text:= modulo.QryListaremision['cliente'];
        FREMISIONES.Edomicilio.Caption:= modulo.QryListaremision['domicilio'];
        fremisiones.Ldescuento.Caption:=modulo.QryListaremision['descuento'];

        fremisiones.econdicion.ItemIndex:=0;
        fremisiones.Efecha.Date:= date;
        fremisiones.Edescuento.Text:='0';fremisiones.Rnota.Checked:=false;fremisiones.Rproducto.Checked:=false;
        FREMISIONES.total('NO');

        modulo.QryRemisiones.Filtered:=false;

        ebuscar.Clear;

        fremisiones.panel2.Visible:=false;

        fremisiones.Lborrar.Caption:='NO';
        fremisiones.showmodal;
    end;
  end;

end;

end.

