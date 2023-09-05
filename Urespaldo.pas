unit Urespaldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrespaldo = class(TForm)
    PanelBotones: TPanel;
    Reutilizar: TSpeedButton;
    imprimir: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Ebuscar: TEdit;
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    RSERIE: TRadioButton;
    RFOLIOS: TRadioButton;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Devolucion1: TMenuItem;
    QryAux: TFDQuery;
    Guardar: TSpeedButton;
    QryResplado: TFDQuery;
    procedure RFOLIOSClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure RSERIEClick(Sender: TObject);
    procedure ReutilizarClick(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure ejecutarSql(sql:string);
    procedure sqlParaRespaldo(sql:string);
    procedure QryRespladoAfterExecute(DataSet: TFDDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frespaldo: TFrespaldo;

implementation

{$R *.dfm}

uses Umodulo, Uremisiones, UVerificarUsuario, Ureportenotas, Ureportetiquet;

procedure TFrespaldo.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    if Length(trim(ebuscar.Text))>0  then
    begin
      if rserie.Checked then
        begin
          modulo.Qrylistaremisionresp.Open('select * from lista_REMISION_resp where '+
                                        ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || CLIENTE || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%') +
                                        ' ORDER BY FOLIO DESC rows 50');
        end
        else
        begin
          modulo.Qrylistafoliosresp.Open('select * from lista_folios_resp where '+
                                      ' (FOLIO|| '+QUOTEDSTR(' ')+ ' || CLIENTE || '+QUOTEDSTR(' ')+ ' || TOTAL) like ' + quotedstr('%'+ ebuscar.Text +'%') +
                                      ' ORDER BY FOLIO DESC rows 50');

        end;
    end
    else
    begin
        if rserie.Checked then
        begin
          modulo.Qrylistaremisionresp.Open('select * from lista_REMISION_resp ORDER BY FOLIO DESC rows 50');
        end
        else
        begin
          modulo.Qrylistafoliosresp.Open('select * from lista_folios_resp ORDER BY FOLIO DESC rows 50');

        end;

    end;
end;

procedure TFrespaldo.ejecutarSql(sql: string);
begin
  Qryaux.SQL.Clear;
  Qryaux.SQL.Add(sql);
  Qryaux.ExecSQL;
end;

procedure TFrespaldo.FormActivate(Sender: TObject);
begin
  ebuscar.Clear;
  //sqlParaRespaldo('');
end;

procedure TFrespaldo.GuardarClick(Sender: TObject);
var
  fecha:string;
begin
  fecha:=FormatDateTime('mm/dd/yyyy', (date-5));

  ejecutarSql('insert into LISTA_REMISION_RESP select * from LISTA_REMISION WHERE CONDICION = '+quotedstr('CANCELADO')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('DELETE from LISTA_REMISION WHERE CONDICION = '+quotedstr('CANCELADO')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('insert into LISTA_REMISION_RESP select * from LISTA_REMISION WHERE CONDICION = '+quotedstr('COTIZACION')+' AND FECHA <  '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('insert into REMISIONES_RESP select * from REMISIONES WHERE FOLIO IN ' +
              '(select FOLIO from LISTA_REMISION WHERE CONDICION = '+quotedstr('COTIZACION')+' AND FECHA < '+quotedstr(fecha)+')');
  modulo.Conector.Commit;

  ejecutarSql('DELETE from REMISIONES WHERE FOLIO IN (select FOLIO from LISTA_REMISION WHERE CONDICION = '+quotedstr('COTIZACION')+' AND FECHA < '+quotedstr(fecha)+')');
  modulo.Conector.Commit;

  ejecutarSql('DELETE from LISTA_REMISION WHERE CONDICION = '+quotedstr('CANCELADO')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('DELETE from LISTA_REMISION WHERE CONDICION = '+quotedstr('COTIZACION')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('insert into LISTA_REMISION_RESP SELECT * FROM LISTA_REMISION WHERE ESTADO = '+quotedstr('PAGADO')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  ejecutarSql('insert into REMISIONES_RESP select * from REMISIONES WHERE FOLIO IN ' +
              '(SELECT FOLIO FROM LISTA_REMISION WHERE ESTADO = '+quotedstr('PAGADO')+' AND FECHA < '+quotedstr(fecha)+')');
  modulo.Conector.Commit;

  ejecutarSql('DELETE from REMISIONES WHERE FOLIO IN (SELECT FOLIO FROM LISTA_REMISION WHERE ESTADO = '+quotedstr('PAGADO')+' AND FECHA < '+quotedstr(fecha)+')');
  modulo.Conector.Commit;

  ejecutarSql('DELETE FROM LISTA_REMISION WHERE ESTADO = '+quotedstr('PAGADO')+' AND FECHA < '+quotedstr(fecha));
  modulo.Conector.Commit;

  SHOWMESSAGE('Proceso terminado');
  close;
end;

procedure TFrespaldo.imprimirClick(Sender: TObject);
var
  fechacredito: TDateTime;
  pre:real;
  paginas,aux:integer;
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remimodificar')then
  begin
     if modulo.Qrylistaremisionresp.RecordCount>0 then
     begin

          modulo.qryinventarioaux.Open('select * from inventario');
          modulo.qryborraremiaux.ExecSQL;
          modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

          if rserie.Checked then
            modulo.Qryremisionresp.Open('select * from remisiones_resp where folio='+quotedstr(modulo.Qrylistaremisionresp['folio'])+' and tipo = '+quotedstr(modulo.Qrylistaremisionresp['impresion']))
          else
            modulo.Qryremisionresp.Open('select * from remisiones_resp where folio='+quotedstr(modulo.Qrylistafoliosresp['folio'])+' and tipo = '+quotedstr(modulo.Qrylistafoliosresp['impresion']));

          fremisiones.Edescuento.Text:=modulo.Qrylistaremisionresp['descuento'];
          modulo.Qryremisionresp.First;
          while not (modulo.Qryremisionresp.Eof) do  //agrega la remision que se quiere aditar a la ventana de remisiones
          begin
              modulo.qryremiaux2.Append;
              modulo.qryremiaux2['empaque']:=modulo.Qryremisionresp['empaque'];
              modulo.qryremiaux2['producto']:=modulo.Qryremisionresp['producto'];

              //agregar doble espacio si es producto surtido
            if strtofloat(modulo.Qryremisionresp['total'])>0then
              modulo.qryremiaux2['producto2']:=modulo.Qryremisionresp['empaque']+' '+modulo.Qryremisionresp['producto']
            else
              modulo.qryremiaux2['producto2']:='      '+modulo.Qryremisionresp['empaque']+' '+modulo.Qryremisionresp['producto'];

              if modulo.qryinventarioaux.Locate('producto',modulo.Qryremisionresp['producto'],[])then
              begin
                modulo.Qryremiaux2['IVA']:=0;
                if modulo.qryinventarioaux['iva']>0 then
                  modulo.Qryremiaux2['IVA']:=16;
                if modulo.qryinventarioaux['ieps']>0 then
                  modulo.Qryremiaux2['IVA']:=8;
              end
              else   //encontrar impuesto si el producto es lista surtida
              begin
                modulo.QrySimilar.Open('select * from similar');
                modulo.QryListaSimilar.Open('select * from lista_similar where descripcion = '+quotedstr(modulo.Qryremisionresp['producto']));

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

              modulo.Qryremiaux2['cantidad']:=modulo.Qryremisionresp['cantidad'];
              modulo.Qryremiaux2['clave']:=modulo.Qryremisionresp['producto'];
              modulo.Qryremiaux2['total']:=modulo.Qryremisionresp['total'];
              modulo.Qryremiaux2['descuento']:=modulo.Qryremisionresp['descuento'];
              modulo.Qryremiaux2['tipo']:=modulo.QryListaremisionresp['impresion'];
              pre:=modulo.Qryremisionresp['total']/modulo.Qryremisionresp['cantidad'];
              modulo.Qryremiaux2['precio']:=Format('%0:2f',[pre]);
              modulo.Qryremiaux2.Post;
              modulo.Qryremisionresp.Next;
          end;


          freportenotas.Reportenotas.ShowPrintDialog:= modulo.Qryremisionresp.RecordCount>8;
          freportenotas.Reportecredito.ShowPrintDialog:= modulo.Qryremisionresp.RecordCount>5;


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

          FREMISIONES.total('SI');

          FREMISIONES.nota.Caption:=Format('%0:2f',[(strtofloat(modulo.QryListaremisionresp['total']))]);
          if modulo.QryListaremisionresp['descuento']<>'0' then
          begin
            FREMISIONES.nota.Caption:=Format('%0:2f',[(strtofloat(modulo.QryListaremisionresp['total']))]);
            FREMISIONES.Ldescuento.Caption:=Format('%0:2f',[(strtofloat(modulo.QryListaremisionresp['descuento']))]);
          end;


          FREMISIONES.letra;

          modulo.Qryimpresora.Open('select * from impresora');
          freportenotas.Reportenotas.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
          freportenotas.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];

          freportetiquet.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

          if MODULO.QryListaremisionresp['CONDICION']='COTIZACION' then
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

            freportetiquet.razon.Visible:=FALSE;
            freportetiquet.nombre.Visible:=FALSE;
            freportetiquet.rfc.Visible:=FALSE;
            freportetiquet.direccion.Visible:=FALSE;
            freportetiquet.telefono.Visible:=FALSE;
            freportetiquet.COTIZACION.Visible:=TRUE;

          END;

          if rserie.Checked then
          begin
              if modulo.QryListaremisionresp['impresion']='TICKET' then
              begin
                freportetiquet.razon.Caption:=modulo.QryExtras['razon'];
                freportetiquet.rfc.Caption:=modulo.QryExtras['rfc'];
                freportetiquet.direccion.Caption:=modulo.QryExtras['direccion'];
                freportetiquet.telefono.Caption:=modulo.QryExtras['telefono'];
                freportetiquet.Eusuario.Caption:=modulo.QryListaremisionresp['vendedor'];
                freportetiquet.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
                freportetiquet.ecliente1.Caption:=modulo.QryListaremisionresp['cliente'];
                freportetiquet.Efecha.Caption:=modulo.QryListaremisionresp['fecha'];
                freportetiquet.Efolio.Caption:=modulo.QryListaremisionresp['Folio'];
                freportetiquet.ETOTAL.Caption:=FREMISIONES.nota.Caption;
                freportetiquet.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
                freportetiquet.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
                freportetiquet.CONDICION.Caption:=modulo.QryListaremisionresp['condicion'];

                freportetiquet.Eusuario2.Caption:=modulo.QryListaremisionresp['vendedor'];
                freportetiquet.ecliente2.Caption:=modulo.QryListaremisionresp['cliente'];
                freportetiquet.Efecha2.Caption:=modulo.QryListaremisionresp['fecha'];
                freportetiquet.Efolio2.Caption:=modulo.QryListaremisionresp['Folio'];
                freportetiquet.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
                freportetiquet.CONDICION2.Caption:=modulo.QryListaremisionresp['condicion'];

                freportetiquet.Eusuario3.Caption:=modulo.QryListaremisionresp['vendedor'];
                freportetiquet.ecliente3.Caption:=modulo.QryListaremisionresp['cliente'];
                freportetiquet.Efecha3.Caption:=modulo.QryListaremisionresp['fecha'];
                freportetiquet.Efolio3.Caption:=modulo.QryListaremisionresp['Folio'];
                freportetiquet.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
                freportetiquet.CONDICION3.Caption:=modulo.QryListaremisionresp['condicion'];

                freportetiquet.report1.Print;
              end;

              if modulo.QryListaremisionresp['impresion']='SERIE' then
              begin
                if modulo.QryListaremisionresp['condicion']='CREDITO' then
                BEGIN
                  //5 registros entran completos en una hoja
                  //despues de 11 registros agrega otra hoja
                  paginas:=1;aux:=6;
                  if modulo.qryremiaux2.RecordCount<aux then
                    freportenotas.paginas2.Caption:='1 PAGINA'
                  ELSE
                  while aux <= modulo.qryremiaux2.RecordCount do
                  begin
                    inc(paginas);
                    freportenotas.paginas2.Caption:=inttostr(paginas)+' PAGINAS';
                    aux:=aux+11;
                  end;

                  freportenotas.razon1.Caption:=modulo.QryExtras['razon'];
                  freportenotas.titulo3.Caption:=modulo.QryExtras['nombre1'];
                  freportenotas.titulo4.Caption:=modulo.QryExtras['nombre2'];
                  freportenotas.rfc2.Caption:=modulo.QryExtras['rfc'];
                  freportenotas.direcc2.Caption:=modulo.QryExtras['direccion'];
                  freportenotas.telefono2.Caption:=modulo.QryExtras['telefono'];
                  freportenotas.whatsapp2.Caption:=modulo.QryExtras['whatsapp'];
                  //freportenotas.CREDITO2.Text:='DEBO Y PAGARE INCONDICIONALMENTE A LA ORDEN DE  PROFR. ZARAGOZA ARGUELLO ARGUELLO ';

                  fechacredito:=modulo.QryListaremisionresp['FECHA'];

                  freportenotas.FECHAPAGO.Caption:=datetostr(fechacredito+15);
                  freportenotas.folio2.Caption:=modulo.QryListaremisionresp['folio'];
                  freportenotas.cliente2.Caption:=modulo.QryListaremisionresp['cliente'];
                  Freportenotas.direccion2.Caption:=modulo.QryListaremisionresp['DOMICILIO'];
                  freportenotas.fecha2.Caption:=modulo.QryListaremisionresp['FECHA'];
                  freportenotas.hora2.Caption:='';
                  freportenotas.stotal2.Caption:=FREMISIONES.nota.Caption;;
                  freportenotas.usuario2.Caption:=modulo.QryListaremisionresp['VENDEDOR'];
                  freportenotas.CONDICION2.Caption:=modulo.QryListaremisionresp['CONDICION'];
                  freportenotas.Reportecredito.Print;
                END
                ELSE
                BEGIN
                  freportenotas.razon.Caption:=modulo.QryExtras['razon'];
                  freportenotas.titulo1.Caption:=modulo.QryExtras['nombre1'];
                  freportenotas.titulo2.Caption:=modulo.QryExtras['nombre2'];
                  freportenotas.rfc.Caption:=modulo.QryExtras['rfc'];
                  freportenotas.direc.Caption:=modulo.QryExtras['direccion'];
                  freportenotas.telefono.Caption:=modulo.QryExtras['telefono'];
                  freportenotas.whatsapp.Caption:=modulo.QryExtras['whatsapp'];

                  freportenotas.Efolio.Caption:=modulo.QryListaremisionresp['FOLIO'];
                  freportenotas.ecliente.Caption:=modulo.QryListaremisionresp['cliente'];
                  Freportenotas.Edireccion.Caption:=modulo.QryListaremisionresp['DOMICILIO'];
                  freportenotas.efecha.Caption:=modulo.QryListaremisionresp['FECHA'];
                  freportenotas.ehora.Caption:='';
                  freportenotas.stotal.Caption:=FREMISIONES.nota.Caption;;
                  freportenotas.Eusuario.Caption:=modulo.QryListaremisionresp['VENDEDOR'];
                  freportenotas.ECONDICION.Caption:=modulo.QryListaremisionresp['CONDICION'];
                  freportenotas.Reportenotas.Print;
                END;
              end;
          end
          else    // rfolio checked
          begin

                freportenotas.razon.Caption:=modulo.QryExtras['razon'];
                freportenotas.titulo1.Caption:=modulo.QryExtras['nombre1'];
                freportenotas.titulo2.Caption:=modulo.QryExtras['nombre2'];
                freportenotas.rfc.Caption:=modulo.QryExtras['rfc'];
                freportenotas.direc.Caption:=modulo.QryExtras['direccion'];
                freportenotas.telefono.Caption:=modulo.QryExtras['telefono'];
                freportenotas.whatsapp.Caption:=modulo.QryExtras['whatsapp'];

                freportenotas.Efolio.Caption:=modulo.Qrylistafoliosresp['FOLIO'];
                freportenotas.ecliente.Caption:=modulo.Qrylistafoliosresp['cliente'];
                Freportenotas.Edireccion.Caption:=modulo.Qrylistafoliosresp['DOMICILIO'];
                freportenotas.efecha.Caption:=modulo.Qrylistafoliosresp['FECHA'];
                freportenotas.ehora.Caption:='';
                freportenotas.stotal.Caption:=FREMISIONES.nota.Caption;
                freportenotas.Eusuario.Caption:=modulo.Qrylistafoliosresp['VENDEDOR'];
                freportenotas.ECONDICION.Caption:=modulo.Qrylistafoliosresp['CONDICION'];
                freportenotas.Reportenotas.Print;


          end;

          modulo.qryborraremiaux.ExecSQL;
          modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

          if MODULO.QryListaremisionresp['CONDICION']='COTIZACION' then
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

            freportetiquet.razon.Visible:=TRUE;
            freportetiquet.nombre.Visible:=TRUE;
            freportetiquet.rfc.Visible:=TRUE;
            freportetiquet.direccion.Visible:=TRUE;
            freportetiquet.telefono.Visible:=TRUE;
            freportetiquet.COTIZACION.Visible:=FALSE;
          END;
     end;

  end;
end;

procedure TFrespaldo.QryRespladoAfterExecute(DataSet: TFDDataSet);
begin
  modulo.respaldo.Commit;
end;

procedure TFrespaldo.ReutilizarClick(Sender: TObject);
var
  pre:real;
begin
   if modulo.Qrylistaremisionresp.RecordCount>0 then
  begin

    modulo.qryborraremiaux.ExecSQL;

    modulo.qryinventarioaux.Filtered:=false;
    modulo.qryinventarioaux.Open('select * from inventario');

    modulo.Qryremisionresp.Open('select * from remisiones_RESP');


    modulo.Qryremisionresp.Filtered:=false;

    if rserie.Checked then
      modulo.Qryremisionresp.Filter:=  ' folio ='+quotedstr(modulo.QryListaremisionresp['folio'])+' and tipo = '+quotedstr(modulo.QryListaremisionresp['impresion'])
    else
      modulo.Qryremisionresp.Filter:=  ' folio ='+quotedstr(modulo.Qrylistafoliosresp['folio'])+' and tipo = '+quotedstr(modulo.Qrylistafoliosresp['impresion']);

    modulo.Qryremisionresp.Filtered:=true;

    modulo.Qryremisionresp.First;
    while not (modulo.Qryremisionresp.Eof) do  //agrega la remision que se quiere aditar a la ventana de remisiones
    begin

        modulo.qryremiaux2.Append;
         if modulo.Qryremisionresp['empaque'] <> null then
              modulo.qryremiaux2['empaque']:=modulo.Qryremisionresp['empaque'];
        modulo.qryremiaux2['producto']:=modulo.Qryremisionresp['producto'];

        if strtofloat(modulo.Qryremisionresp['total'])>0then
          modulo.qryremiaux2['producto2']:=modulo.Qryremisionresp['empaque']+' '+modulo.Qryremisionresp['producto']
        else
          modulo.qryremiaux2['producto2']:='      '+modulo.Qryremisionresp['empaque']+' '+modulo.Qryremisionresp['producto'];

        if modulo.qryinventarioaux.Locate('producto',modulo.Qryremisionresp['producto'],[])then
        begin
          modulo.qryremiaux2['IVA']:=0;
          if modulo.qryinventario['iva']>0 then
            modulo.qryremiaux2['IVA']:=16;
          if modulo.qryinventario['ieps']>0 then
            modulo.qryremiaux2['IVA']:=8;
        end;

        modulo.qryremiaux2['cantidad']:=modulo.Qryremisionresp['cantidad'];
        modulo.qryremiaux2['clave']:=modulo.Qryremisionresp['producto'];
        modulo.qryremiaux2['total']:=modulo.Qryremisionresp['total'];
        modulo.qryremiaux2['tipo']:=modulo.QryListaremisionresp['impresion'];
        pre:=modulo.Qryremisionresp['total']/modulo.Qryremisionresp['cantidad'];
        modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);
        modulo.qryremiaux2.Post;

      modulo.Qryremisionresp.Next;
    end;

    if rserie.Checked then
    BEGIN
      FREMISIONES.Ecliente.Text:= modulo.QryListaremisionresp['cliente'];
      FREMISIONES.Edomicilio.Caption:= modulo.QryListaremisionresp['domicilio'];
      fremisiones.Edescuento.Text:=modulo.QryListaremisionresp['descuento'];
    END
    ELSE
    BEGIN
      FREMISIONES.Ecliente.Text:= modulo.Qrylistafoliosresp['cliente'];
      FREMISIONES.Edomicilio.Caption:= modulo.Qrylistafoliosresp['domicilio'];
      fremisiones.Edescuento.Text:=modulo.Qrylistafoliosresp['descuento'];
    END;

    fremisiones.Efecha.Date:= date;
    FREMISIONES.total('NO');

    modulo.Qryremisionresp.Filtered:=false;

    rfolios.Checked:=true; ebuscar.Clear;
    rserie.Checked:=true;rserie.OnClick(sender);
    fremisiones.Lborrar.Caption:='NO';
    fremisiones.showmodal;
  end;
end;

procedure TFrespaldo.RFOLIOSClick(Sender: TObject);
begin
  modulo.Qrylistafoliosresp.Open('select * from lista_folios_resp order by FOLIO desc rows 50');
  DBGRID1.DataSource:=MODULO.Dslistafoliosresp;
end;

procedure TFrespaldo.RSERIEClick(Sender: TObject);
begin
  modulo.Qrylistaremisionresp.Open('select * from lista_remision_resp order by FOLIO desc rows 50');
  DBGRID1.DataSource:=MODULO.Dslistaremisionresp;
end;

procedure TFrespaldo.sqlParaRespaldo(sql: string);
begin
  try
    QryResplado.ExecSQL(sql);
  except on E: Exception do
    showmessage(e.Message);
  end;
end;

end.
