unit UlistaCortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup,ExcelXP,ComObj;

type
  TFlistacortes = class(TForm)
    DBGrid1: TDBGrid;
    PanelBotones: TPanel;
    imprimir: TSpeedButton;
    QryAux: TFDQuery;
    guardar: TSaveDialog;
    PopupActionBar1: TPopupActionBar;
    ImportaraExcel1: TMenuItem;
    procedure imprimirClick(Sender: TObject);
    procedure filtro(tabla:string;condicion:string);
    procedure ImportaraExcel1Click(Sender: TObject);
    procedure exportarexcel(direccion:string);
    procedure ObtenerInformacionParaExportarAExcel;
    procedure filtroExcel(tabla: string; condicion: string);
    procedure imprimirtiquet80;
    procedure imprimirtiquetMatriz;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistacortes: TFlistacortes;
  hora1,hora2:string;

implementation

{$R *.dfm}

uses Umodulo, Ureportecortecaja, UCortes;

procedure TFlistacortes.filtro(tabla: string; condicion: string);
var
  complemento:string;
begin
  complemento:=' where fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin);

  qryaux.Close;
  qryaux.SQL.Clear;
  qryaux.SQL.Add('select * from '+tabla+complemento+condicion);
  qryaux.Open;

end;

procedure TFlistacortes.filtroExcel(tabla: string; condicion: string);
var
  complemento, usuario:string;
begin
  complemento:=' where fecha >'+quotedstr(hora1)+' and fecha <='+quotedstr(hora2);
  usuario:= ' and usuario = '+quotedstr(modulo.Qrylista_cortes['usuario']);
  if tabla='lista_remision'  then
  begin
    complemento:=' where fecha_cobro >'+quotedstr(hora1)+' and fecha_cobro <='+quotedstr(hora2);
    usuario:= ' and cajero = '+quotedstr(modulo.Qrylista_cortes['usuario']);
  end;

  qryaux.Open('select * from '+tabla+complemento+usuario+condicion);
end;

procedure TFlistacortes.ImportaraExcel1Click(Sender: TObject);
begin
  guardar.InitialDir:='C:\';
  if guardar.Execute() then
    exportarexcel(guardar.FileName);
end;

procedure TFlistacortes.imprimirClick(Sender: TObject);
VAR
  suma,sumaYastas:real;
begin
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    suma:=0;sumaYastas:=0;
    horaini:= formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_ini']);
    horafin:= formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_fin']);

    filtro('salidas','');
    if qryaux.RecordCount>0 then
    begin
      qryaux.First;
      while not qryaux.Eof do
      begin
        if qryaux['descripcion']='SERVICIOS YASTAS' then
          sumaYastas:=sumaYastas+qryaux['cantidad'];

        if ((qryaux['descripcion']='SERVICIOS YASTAS') AND (modulo.qryremiaux2.Locate('PRODUCTO','SERVICIOS YASTAS',[]))) then
        BEGIN
          modulo.qryremiaux2.Edit;
          modulo.qryremiaux2['precio']:=sumaYastas;
        END
        ELSE
        BEGIN
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['precio']:=qryaux['cantidad'];
          modulo.qryremiaux2['producto']:=qryaux['descripcion'];
        END;


        modulo.qryremiaux2.Post;

        suma:=qryaux['cantidad']+suma;
        qryaux.Next;
      end;
    end
    else // si no hay salidas, el reporte lo imprime totalmente vacio
    begin
        modulo.qryremiaux2.Append;
        modulo.qryremiaux2['precio']:='.';
        modulo.qryremiaux2['producto']:='.';
        modulo.qryremiaux2.Post;
    end;

  modulo.Qryimpresora.Open('select * from impresora');
  freportecortecaja.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportecortecaja.report_matriz_ounto.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
  begin
    freportecortecaja.report1.DeviceType:='Screen';
    freportecortecaja.report_matriz_ounto.DeviceType:='Screen';
  end
  else
  begin
    freportecortecaja.report1.DeviceType:='Printer';
    freportecortecaja.report_matriz_ounto.DeviceType:='Printer';
  end;

  if modulo.QryExtras['tiquet']='0' then
    imprimirtiquet80
  else
    imprimirtiquetMatriz;
end;

procedure TFlistacortes.imprimirtiquet80;
begin
  freportecortecaja.razon.Caption:=modulo.QryExtras['razon'];
  freportecortecaja.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];

  freportecortecaja.fecha.Caption:=datetostr(date)+' '+timetostr(time) ;
  freportecortecaja.fechaini.Caption:=MODULO.Qrylista_cortes['FOLIO_INICIO'];
  freportecortecaja.fechafin.Caption:=MODULO.Qrylista_cortes['FOLIO_FIN'];
  freportecortecaja.CONTADO.Caption:=MODULO.Qrylista_cortes['CONTADO'];

  freportecortecaja.ABONOS.Caption:=MODULO.Qrylista_cortes['ABONOS'];
  freportecortecaja.Devoluciones.Caption:=MODULO.Qrylista_cortes['DEVOLUCIONES'];
  freportecortecaja.DESCUENTOS.Caption:=MODULO.Qrylista_cortes['DESCUENTOS'];
  freportecortecaja.VENTATOTAL.Caption:=floattostr(strtofloat(MODULO.Qrylista_cortes['CONTADO'])+strtofloat(MODULO.Qrylista_cortes['ABONOS']));
  freportecortecaja.CLIENTES.Caption:=inttostr(MODULO.Qrylista_cortes['FOLIO_FIN']-MODULO.Qrylista_cortes['FOLIO_INICIO']+1);

  freportecortecaja.SALIDAS.Caption:=MODULO.Qrylista_cortes['SALIDAS'];
  freportecortecaja.TOTAL.Caption:=MODULO.Qrylista_cortes['TOTAL'];
  freportecortecaja.USUARIO.Caption:=MODULO.Qrylista_cortes['USUARIO'];
  freportecortecaja.Report1.Print;
end;

procedure TFlistacortes.imprimirtiquetMatriz;
begin
  freportecortecaja.razonM.Caption:=modulo.QryExtras['razon'];
  freportecortecaja.nombreM.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];

  freportecortecaja.fechaM.Caption:=datetostr(date)+' '+timetostr(time) ;
  freportecortecaja.fechainiM.Caption:=MODULO.Qrylista_cortes['FOLIO_INICIO'];
  freportecortecaja.fechafinM.Caption:=MODULO.Qrylista_cortes['FOLIO_FIN'];
  freportecortecaja.CONTADOM.Caption:=MODULO.Qrylista_cortes['CONTADO'];

  freportecortecaja.ABONOSM.Caption:=MODULO.Qrylista_cortes['ABONOS'];
  freportecortecaja.DevolucionesM.Caption:=MODULO.Qrylista_cortes['DEVOLUCIONES'];
  freportecortecaja.VENTATOTALM.Caption:=floattostr(strtofloat(MODULO.Qrylista_cortes['CONTADO'])+strtofloat(MODULO.Qrylista_cortes['ABONOS']));
  freportecortecaja.CLIENTESM.Caption:=inttostr(MODULO.Qrylista_cortes['FOLIO_FIN']-MODULO.Qrylista_cortes['FOLIO_INICIO']+1);

  freportecortecaja.SALIDASM.Caption:=MODULO.Qrylista_cortes['SALIDAS'];
  freportecortecaja.TOTALM.Caption:=MODULO.Qrylista_cortes['TOTAL'];
  freportecortecaja.USUARIOM.Caption:=MODULO.Qrylista_cortes['USUARIO'];
  freportecortecaja.report_matriz_ounto.Print;
end;

procedure TFlistacortes.ObtenerInformacionParaExportarAExcel;
var
  row:integer;
  suma, sumaYastas:real;

begin

    suma:=0;sumaYastas:=0;
    //hora1:=formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_ini']);
    //hora2:=formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_fin']);
    if strtodatetime(hora1)>=strtodatetime(hora2) then
    begin
      imprimir.Enabled:=false;
      showmessage('Fechas incorrectas');
      exit;
    end;


    //determinamos las horas para hacer mas exacto los cortes
    modulo.QryListaremision.Open('select * from lista_remision where fecha >'+quotedstr(hora1)+' and fecha <='+quotedstr(hora2)+' and cajero = '+quotedstr(modulo.Qrylista_cortes['usuario'])+' order by folio');
    modulo.QryListaremision.Filtered:=false;

    if  modulo.QryListaremision.RecordCount>0 then
      modulo.QryListaremision.Last;

    suma:=0;
    filtroExcel('lista_remision',' and condicion = '+quotedstr('CONTADO') );
    qryaux.First;
    while not qryaux.Eof do
    begin
      suma:=qryaux['total']+suma;
      qryaux.Next;
    end;


    suma:=0;
    filtroExcel('Abonos','');
    qryaux.First;
    while not qryaux.Eof do
    begin
      suma:=qryaux['total']+suma;
      qryaux.Next;
    end;

    suma:=0;
    filtroExcel('devoluciones','');
    qryaux.First;
    while not qryaux.Eof do
    begin
      //SUMA LAS DEVOLUCIONES DE NOTAS PAGADAS Y LAS DE REPARTO
      modulo.QryListaremision.Open('select * from lista_remision where folio = '+inttostr(qryaux['folio']));
      if (modulo.QryListaremision['estado']='PAGADO') or (qryaux['CONDICION']='REPARTO')  then
        suma:=qryaux['total']+suma;
      qryaux.Next;
    end;

    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    suma:=0;

    filtroExcel('salidas','');
    if qryaux.RecordCount>0 then
    begin
      qryaux.First;
      while not qryaux.Eof do
      begin
        if qryaux['descripcion']='SERVICIOS YASTAS' then
          sumaYastas:=sumaYastas+qryaux['cantidad'];

        if ((qryaux['descripcion']='SERVICIOS YASTAS') AND (modulo.qryremiaux2.Locate('PRODUCTO','SERVICIOS YASTAS',[]))) then
        BEGIN
          modulo.qryremiaux2.Edit;
          modulo.qryremiaux2['precio']:=sumaYastas;
        END
        ELSE
        BEGIN
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['precio']:=qryaux['cantidad'];
          modulo.qryremiaux2['producto']:=qryaux['descripcion'];
        END;


        modulo.qryremiaux2.Post;

        suma:=qryaux['cantidad']+suma;
        qryaux.Next;
      end;
    end
    else // si no hay salidas, el reporte lo imprime totalmente vacio
    begin
        modulo.qryremiaux2.Append;
        modulo.qryremiaux2['precio']:='.';
        modulo.qryremiaux2['producto']:='.';
        modulo.qryremiaux2.Post;
    end;

    qryaux.Close;qryaux.Open;
end;

procedure TFlistacortes.exportarexcel(direccion:string);
var
  ExcelApplication : variant;
  ventas,libro : variant;
  row: integer;
  texto, cajero, dato:string;

begin

   try
    begin
     ExcelApplication := CreateOleObject('Excel.Application');
     //ExcelApplication.Visible := true;  //let's make visible
    end;
   except
    Showmessage('No se pudo crear el archivo de excel,'
    +'asegurate de tenerlo instalado en tu sistema');
    Application.Terminate;
   end;

     libro:=ExcelApplication.WorkBooks.Add();
     ventas:=libro.WorkSheets[1];
     ventas.Name:='ventas';

    ventas.Columns[1].ColumnWidth := 25;
    ventas.Columns[2].ColumnWidth := 28;
    ventas.Columns[3].ColumnWidth := 20;
    ventas.Columns[4].ColumnWidth := 25;
    ventas.Columns[5].ColumnWidth := 25;

                //captions/text of cells
    ventas.Cells[1,1] := 'total';
    ventas.Cells[1,2] := 'Descripcion';
    ventas.Cells[1,3] := 'folio';
    ventas.Cells[1,4] := 'cajero';
    ventas.Cells[1,5] := 'metodo';

    ventas.Columns[1].NumberFormat := '$ #,##0.00';
    ventas.Columns[2].NumberFormat := '@';

    hora1:=formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_ini']);
    hora2:=formatdatetime('mm/dd/yyyy HH:mm:ss',modulo.Qrylista_cortes['fecha_fin']);


    row:=1;

    cajero:=modulo.Qrylista_cortes['usuario'];

    modulo.QryListaremision.Open('select * from lista_remision where fecha_cobro >'+quotedstr(hora1)+' and fecha_cobro <='+quotedstr(hora2)+' and cajero = '+quotedstr(cajero)+' order by folio');
    modulo.QryListaremision.Filtered:=false;

    if  modulo.QryListaremision.RecordCount>0 then
      modulo.QryListaremision.Last;


    //CONTADO
    filtroExcel('lista_remision',' and condicion = '+quotedstr('CONTADO')+'and cliente <>'+quotedstr('PAGO DE SERVICIOS')+' order by metodo, folio' );
    qryaux.First;
    while not qryaux.Eof do
    begin
      ventas.Cells[row+1,1] :=qryaux['total'];
      ventas.Cells[row+1,2] :='contado';
      ventas.Cells[row+1,3] :=qryaux['folio'];
      ventas.Cells[row+1,4] :=cajero;
      dato:=qryaux['metodo'];
      ventas.Cells[row+1,5] :=dato;
      inc(row);
      qryaux.Next;
    end;

    inc(row);inc(row);

    //SERVICIOS
    filtroExcel('lista_remision',' and condicion = '+quotedstr('CONTADO')+'and cliente ='+quotedstr('PAGO DE SERVICIOS')+' order by metodo, folio' );
    qryaux.First;
    while not qryaux.Eof do
    begin
      ventas.Cells[row+1,1] :=qryaux['total'];
      ventas.Cells[row+1,2] :='PAGO DE SERVICIOS';
      ventas.Cells[row+1,3] :=qryaux['folio'];
      ventas.Cells[row+1,4] :=cajero;
      dato:=qryaux['metodo'];
      ventas.Cells[row+1,5] :=dato;
      inc(row);
      qryaux.Next;
    end;

    inc(row);inc(row);


    filtroExcel('Abonos',' order by metodo, folio');
    qryaux.First;
    while not qryaux.Eof do
    begin
      dato:=qryaux['total'];ventas.Cells[row+1,1] :=dato;
      ventas.Cells[row+1,2] :='Abonos';
      ventas.Cells[row+1,3] :=qryaux['folio'];
      ventas.Cells[row+1,4] :=cajero;
      if qryaux['metodo']<>null then
      begin
        dato:=qryaux['metodo'];
        ventas.Cells[row+1,5] :=dato;
      end;


      inc(row);
      qryaux.Next;
    end;

    inc(row);inc(row);

    ventas.Cells[row+1,2] :='DEVOLUCIONES';
    inc(row);
    filtroExcel('devoluciones',' order by condicion, folio');
    qryaux.First;
    while not qryaux.Eof do
    begin
      //SUMA LAS DEVOLUCIONES DE NOTAS PAGADAS Y LAS DE REPARTO
      //modulo.QryListaremision.Open('select * from lista_remision where folio = '+inttostr(qryaux['folio']));
      //if (modulo.QryListaremision['estado']='PAGADO') or (qryaux['CONDICION']='REPARTO')  then
      dato:=qryaux['total'];ventas.Cells[row+1,1] :=dato;
      dato:=qryaux['condicion'];ventas.Cells[row+1,2] :='devoluciones '+dato;
      ventas.Cells[row+1,3] :=qryaux['folio'];
      ventas.Cells[row+1,4] :=cajero;
      inc(row);
      qryaux.Next;
    end;

    inc(row);inc(row);

    ventas.Cells[row+1,2] :='SALIDAS';
    inc(row);
    filtroExcel('salidas',' order by folio');
    if qryaux.RecordCount>0 then
    begin
      qryaux.First;
      while not qryaux.Eof do
      begin
        ventas.Cells[row+1,1] :=qryaux['cantidad'];
        dato:=qryaux['descripcion'];ventas.Cells[row+1,2] :=dato;
        ventas.Cells[row+1,3] :=qryaux['folio'];
        ventas.Cells[row+1,4] :=cajero;
        inc(row);
        qryaux.Next;
      end;
    end;

    inc(row);inc(row);

    //PENDIENTES
    ventas.Cells[row+1,2] :='PENDIENTES';
    inc(row);
    qryaux.Open('select * from lista_remision where fecha >'+quotedstr(hora1)+' and fecha <='+quotedstr(hora2)+' AND ESTADO = '+QUOTEDSTR('PENDIENTE'));
    qryaux.First;
    while not qryaux.Eof do
    begin
      ventas.Cells[row+1,1] :=qryaux['total'];
      ventas.Cells[row+1,2] :='PENDIENTE';
      ventas.Cells[row+1,3] :=qryaux['folio'];
      dato:=qryaux['CONDICION'];
      ventas.Cells[row+1,4] :=DATO;
      inc(row);
      qryaux.Next;
    end;

     inc(row);inc(row);

    //CANCELADOS
    ventas.Cells[row+1,2] :='CANCELADAS';
    inc(row);
    filtroExcel('lista_remision',' and condicion = '+quotedstr('CANCELADO')+' order by  folio' );
    qryaux.First;
    while not qryaux.Eof do
    begin
      ventas.Cells[row+1,1] :=qryaux['total'];
      ventas.Cells[row+1,2] :='CANCELADO';
      ventas.Cells[row+1,3] :=qryaux['folio'];
      ventas.Cells[row+1,4] :=cajero;
      inc(row);
      qryaux.Next;
    end;

    inc(row);inc(row);

    ventas.Cells[row+1,2] :='FIN DEL ARCHIVO';

    libro.SaveAs(direccion);

    showmessage('archivo creado correctamente');
end;

end.
