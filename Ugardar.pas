unit Ugardar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  THiloguardar = class(TThread)
    procedure Execute; override;
  end;

  TFguardar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    total: TLabel;
    Bnotas: TBitBtn;
    Btiquet: TBitBtn;
    Bnocomprobante: TBitBtn;
    Bok: TBitBtn;
    procedure BtiquetClick(Sender: TObject);
    procedure BnotasClick(Sender: TObject);
    procedure BnocomprobanteClick(Sender: TObject);
    procedure imprimirmatriz(Sender: TObject);
    procedure imprimircarta(Sender: TObject);
    procedure imprimirtiquet80(Sender: TObject);
    procedure imprimirtiquet58(Sender: TObject);
    procedure imprimirtiquetMatriz;
    procedure imprimirtiquetSinComprobante80(Sender: TObject);
    procedure imprimirtiquetSinComprobante_matriz(Sender: TObject);
    procedure BokClick(Sender: TObject);
    procedure llenarTiquet80;
    procedure llenarTiquet80Traspado;
    procedure desactivar_botones;
    procedure activar_botones;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fguardar: TFguardar;
  tipoimpresion, botonimprimir:string;
  guardar: THiloguardar;
  parametro: TObject;



implementation

{$R *.dfm}

uses Umodulo, Utiponota, Uremisiones, Ureportetiquet, UVerificarUsuario,
  Ureportenotas, ureportenotascarta, Ureportetiquet58;

procedure THiloguardar.Execute;
begin
  FreeOnTerminate := True;
  inherited Create(False);
  fremisiones.Guardado(tipoimpresion,'SI', parametro);

end;

procedure TFguardar.imprimirmatriz(Sender: TObject);
var
  paginas,aux, folio:integer;
begin

  freportenotas.efolio.Caption:=fremisiones.Efolio.Text;
  freportenotas.folio2.Caption:=fremisiones.Efolio.Text;


  try
        if FREMISIONES.Econdicion.Text='COTIZACION' then
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


        if fremisiones.Econdicion.Text = 'CREDITO' then
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

          if fremisiones.baplicar.Hint='ADAN' then  //ENCABEZADO A NOMBRE DE ADAN
          BEGIN
            freportenotas.razon1.Caption:='ADAN LOPEZ GOMEZ';
            freportenotas.titulo3.Caption:='';
            freportenotas.titulo4.Caption:='';
            freportenotas.rfc2.Caption:='';
            freportenotas.direcc2.Caption:='';
            freportenotas.telefono2.Caption:='';
            freportenotas.whatsapp2.Caption:='';
            freportenotas.IMAGEN2.Visible:=FALSE;
            //freportenotas.CREDITO2.Text:='DEBO Y PAGARE INCONDICIONALMENTE A LA ORDEN DE  ADAN LOPEZ GOMEZ ';
          END
          ELSE
          BEGIN
            freportenotas.razon1.Caption:=modulo.QryExtras['razon'];
            freportenotas.titulo3.Caption:=modulo.QryExtras['nombre1'];
            freportenotas.titulo4.Caption:=modulo.QryExtras['nombre2'];
            freportenotas.rfc2.Caption:=modulo.QryExtras['rfc'];
            freportenotas.direcc2.Caption:=modulo.QryExtras['direccion'];
            freportenotas.telefono2.Caption:=modulo.QryExtras['telefono'];
            freportenotas.whatsapp2.Caption:=modulo.QryExtras['whatsapp'];
            //freportenotas.CREDITO2.Text:='DEBO Y PAGARE INCONDICIONALMENTE A LA ORDEN DE  PROFR. ZARAGOZA ARGUELLO ARGUELLO ';
          END;


          freportenotas.FECHAPAGO.Caption:=datetostr(date+15);
          freportenotas.folio2.Caption:=fremisiones.Efolio.Text;
          freportenotas.cliente2.Caption:=fremisiones.ecliente.Text;
          Freportenotas.direccion2.Caption:=fremisiones.Edomicilio.Caption;
          freportenotas.fecha2.Caption:=datetostr(fremisiones.efecha.date);
          freportenotas.hora2.Caption:=timetostr(time);
          freportenotas.stotal2.Caption:=fremisiones.nota.Caption;
          freportenotas.usuario2.Caption:=fverificausu.Lusuario.Caption;
          freportenotas.CONDICION2.Caption:=fremisiones.Econdicion.Text;



           try
              freportenotas.Reportecredito.Print;

            except
              on E : Exception do
                ShowMessage(E.ClassName+'  '+E.Message);
            end;
        END
        else
        begin
          if fremisiones.baplicar.Hint='ADAN' then  //ENCABEZADO A NOMBRE DE ADAN
          BEGIN
            freportenotas.razon.Caption:='ADAN LOPEZ GOMEZ';
            freportenotas.titulo1.Caption:='';
            freportenotas.titulo2.Caption:='';
            freportenotas.rfc.Caption:='';
            freportenotas.direc.Caption:='';
            freportenotas.telefono.Caption:='';
            freportenotas.whatsapp.Caption:='';
            freportenotas.IMAGEN.Visible:=FALSE;
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

          END;

          freportenotas.Efolio.Caption:=fremisiones.Efolio.Text;
          freportenotas.ecliente.Caption:=fremisiones.ecliente.Text;
          Freportenotas.Edireccion.Caption:=fremisiones.Edomicilio.Caption;
          freportenotas.efecha.Caption:=datetostr(fremisiones.efecha.date);
          freportenotas.ehora.Caption:=timetostr(time);
          freportenotas.stotal.Caption:=fremisiones.nota.Caption;
          freportenotas.Eusuario.Caption:=fverificausu.Lusuario.Caption;
          freportenotas.ECONDICION.Caption:=fremisiones.Econdicion.Text;

          try
            freportenotas.Reportenotas.Print;
          except
            on E : Exception do
              ShowMessage(E.ClassName+'  '+E.Message);
          end;
        end;

        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

        freportenotas.IMAGEN.Visible:=TRUE;
        freportenotas.IMAGEN2.Visible:=TRUE;

        //no debe quedar nada invisible despues de imprimir una cotizacion
        if FREMISIONES.Econdicion.Text='COTIZACION' then
        BEGIN
          freportenotas.razon.Visible:=TRUE;
          freportenotas.titulo1.Visible:=TRUE;
          freportenotas.titulo2.Visible:=TRUE;
          freportenotas.rfc.Visible:=TRUE;
          freportenotas.direc.Visible:=TRUE;
          freportenotas.telefono.Visible:=TRUE;
          freportenotas.whatsapp.Visible:=TRUE;
          freportenotas.COTIZACION.Visible:=FALSE;

          freportenotas.razon1.Visible:=TRUE;
          freportenotas.titulo3.Visible:=TRUE;
          freportenotas.titulo4.Visible:=TRUE;
          freportenotas.rfc2.Visible:=TRUE;
          freportenotas.direcc2.Visible:=TRUE;
          freportenotas.telefono2.Visible:=TRUE;
          freportenotas.whatsapp2.Visible:=TRUE;
          freportenotas.COTIZACION2.Visible:=FALSE;
        END;

        //fremisiones.lborrar.Caption:='SI';
        //fremisiones.formactivate(sender);

        FREMISIONES.Close;
        CLOSE;
    except
        showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
        fremisiones.Close;
        close;
    end;

end;

procedure TFguardar.imprimirtiquet58(Sender: TObject);
begin
  try
      if FREMISIONES.Econdicion.Text='COTIZACION' then
      BEGIN
        freportetiquet58.razon.Visible:=FALSE;
        freportetiquet58.nombre.Visible:=FALSE;
        freportetiquet58.rfc.Visible:=FALSE;
        freportetiquet58.direccion.Visible:=FALSE;
        freportetiquet58.telefono.Visible:=FALSE;
        freportetiquet58.COTIZACION.Visible:=TRUE;
      END;


      FREMISIONES.total('NO');
      freportetiquet58.razon.Caption:=modulo.QryExtras['razon'];
      freportetiquet58.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
      freportetiquet58.rfc.Caption:=modulo.QryExtras['rfc'];
      freportetiquet58.direccion.Caption:=modulo.QryExtras['direccion'];
      freportetiquet58.telefono.Caption:=modulo.QryExtras['telefono'];
      freportetiquet58.CONDICION.Caption:=fremisiones.Econdicion.Text;

      freportetiquet58.Eusuario.Caption:=fverificausu.Lusuario.Caption;
      freportetiquet58.ecliente1.Caption:=fremisiones.Ecliente.Text;
      freportetiquet58.Efecha.Caption:=datetostr(date)+' '+timetostr(time);
      freportetiquet58.Efolio.Caption:=fremisiones.Efolio.Text;
      freportetiquet58.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
      freportetiquet58.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
      freportetiquet58.ETOTAL.Caption:=FREMISIONES.nota.Caption;

      freportetiquet58.Eusuario2.Caption:=fverificausu.Lusuario.Caption;
      freportetiquet58.ecliente2.Caption:=fremisiones.Ecliente.Text;
      freportetiquet58.Efecha2.Caption:=datetimetostr(date)+' '+timetostr(time);
      freportetiquet58.Efolio2.Caption:=fremisiones.Efolio.Text;;
      freportetiquet58.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
      //freportetiquet58.CONDICION2.Caption:=fremisiones.Econdicion.Text;

      freportetiquet58.Eusuario3.Caption:=fverificausu.Lusuario.Caption;
      freportetiquet58.ecliente3.Caption:=fremisiones.Ecliente.Text;
      freportetiquet58.Efecha3.Caption:=datetimetostr(date)+' '+timetostr(time);
      freportetiquet58.Efolio3.Caption:=fremisiones.Efolio.Text;;
      freportetiquet58.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
      freportetiquet58.CONDICION3.Caption:=fremisiones.Econdicion.Text;

      freportetiquet58.Efolio.Caption:=fremisiones.Efolio.Text;
      freportetiquet58.Efolio2.Caption:=fremisiones.Efolio.Text;
      freportetiquet58.Efolio3.Caption:=fremisiones.Efolio.Text;

      try
        freportetiquet58.report1.Print;
      except
        on E : Exception do
          ShowMessage(E.ClassName+'  '+E.Message);
      end;

      modulo.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

      if FREMISIONES.Econdicion.Text='COTIZACION' then
      BEGIN
        freportetiquet58.razon.Visible:=TRUE;
        freportetiquet58.nombre.Visible:=TRUE;
        freportetiquet58.rfc.Visible:=TRUE;
        freportetiquet58.direccion.Visible:=TRUE;
        freportetiquet58.telefono.Visible:=TRUE;
        freportetiquet58.COTIZACION.Visible:=FALSE;
      END;

      //fremisiones.lborrar.Caption:='SI';
      //fremisiones.formactivate(sender);

      FREMISIONES.Close;
      CLOSE;
  except
      showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
      modulo.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
      fremisiones.Close;
      close;
  end;


end;

procedure TFguardar.imprimirtiquet80(Sender: TObject);
begin
  if Fremisiones.Econdicion.Text='CREDITO' then
  BEGIN
    freportetiquet.razoncre.Caption:=modulo.QryExtras['razon'];
    freportetiquet.FECHAPAGO.Caption:=datetostr(Date+15);
    freportetiquet.foliocre.Caption:= Fremisiones.Efolio.Text;
    freportetiquet.clientecre.Caption:= Fremisiones.Ecliente.Text;
    freportetiquet.fechacre.Caption:= datetostr(date)+ ' '+timetostr(time);
    freportetiquet.totalcre.Caption:= Format('%0:2f',[strtofloat(Fremisiones.nota.Caption)]);
    freportetiquet.usuariocre.Caption:= fverificausu.Lusuario.Caption;
    freportetiquet.condicioncre.Caption:= fremisiones.Econdicion.Text;

    FREMISIONES.Close;
    close;

    try
      freportetiquet.Reportecredito.Print;
      CLOSE;

    except
      on E : Exception do
      begin
        ShowMessage(E.ClassName+'  '+E.Message);
        showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
        fremisiones.Close;
        close;
      end;
    end;
  END
  else
    llenarTiquet80;
end;

procedure TFguardar.imprimirtiquetMatriz;
begin
 if FREMISIONES.Econdicion.Text='COTIZACION' then
  BEGIN
    freportetiquet.razonM.Visible:=FALSE;
    freportetiquet.nombreM.Visible:=FALSE;
    freportetiquet.rfcM.Visible:=FALSE;
    freportetiquet.direccionM.Visible:=FALSE;
    freportetiquet.telefonoM.Visible:=FALSE;
    freportetiquet.COTIZACIONM.Visible:=TRUE;
  END;

  FREMISIONES.total('NO');
  freportetiquet.razonM.Caption:=modulo.QryExtras['razon'];
  freportetiquet.nombreM.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
  freportetiquet.rfcM.Caption:=modulo.QryExtras['rfc'];
  freportetiquet.direccionM.Caption:=modulo.QryExtras['direccion'];
  freportetiquet.telefonoM.Caption:=modulo.QryExtras['telefono'];
  freportetiquet.CONDICIONM.Caption:=fremisiones.Econdicion.Text;

  freportetiquet.EusuarioM.Caption:=fverificausu.Lusuario.Caption;
  freportetiquet.eclienteM.Caption:=fremisiones.Ecliente.Text;
  freportetiquet.EDOMICILIOM.Caption:=fremisiones.Edomicilio.Caption;
  freportetiquet.EfechaM.Caption:=datetostr(date)+' '+timetostr(time);
  freportetiquet.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
  freportetiquet.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
  freportetiquet.ETOTALM.Caption:=FREMISIONES.nota.Caption;
  freportetiquet.EfolioM.Caption:=fremisiones.Efolio.Text;


  try
    freportetiquet.report_matriz_punto.Print;
  except
    //on E : Exception do
      //ShowMessage(E.ClassName+'  '+E.Message);
    showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    fremisiones.Close;
    close;
  end;

  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

  if FREMISIONES.Econdicion.Text='COTIZACION' then
  BEGIN
    freportetiquet.razon.Visible:=TRUE;
    freportetiquet.nombre.Visible:=TRUE;
    freportetiquet.rfc.Visible:=TRUE;
    freportetiquet.direccion.Visible:=TRUE;
    freportetiquet.telefono.Visible:=TRUE;
    freportetiquet.COTIZACION.Visible:=FALSE;
  END;

  FREMISIONES.Close;
  CLOSE;

end;

procedure TFguardar.imprimirtiquetSinComprobante80(Sender: TObject);
begin
   try
        FREMISIONES.total('NO');
        freportetiquet.ERAZONR2.Caption:=modulo.QryExtras['razon'];
        freportetiquet.EFECHAR2.Caption:=datetostr(date)+' '+timetostr(time);
        freportetiquet.ETOTALR2.Caption:=FREMISIONES.nota.Caption;
        freportetiquet.ECONDICIONR2.Caption:=fremisiones.Econdicion.Text;
        freportetiquet.EUSUARIOR2.Caption:=fverificausu.Lusuario.Caption;
        freportetiquet.EFOLIOR2.Caption:=fremisiones.Efolio.Text;


        try
          freportetiquet.report2.Print;
        except
          on E : Exception do
            ShowMessage(E.ClassName+'  '+E.Message);
        end;

        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

        fremisiones.lborrar.Caption:='SI';
        fremisiones.formactivate(sender);

        FREMISIONES.Close;
        CLOSE;
    except
        showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
        fremisiones.Close;
        close;
    end;
end;

procedure TFguardar.imprimirtiquetSinComprobante_matriz(Sender: TObject);
begin
   try
        FREMISIONES.total('NO');
        freportetiquet.ERAZONR2M.Caption:=modulo.QryExtras['razon'];
        freportetiquet.EFECHAR2M.Caption:=datetostr(date)+' '+timetostr(time);
        freportetiquet.ETOTALR2M.Caption:=FREMISIONES.nota.Caption;
        freportetiquet.ECONDICIONR2M.Caption:=fremisiones.Econdicion.Text;
        freportetiquet.EUSUARIOR2M.Caption:=fverificausu.Lusuario.Caption;
        freportetiquet.EFOLIOR2M.Caption:=fremisiones.Efolio.Text;


        try
          freportetiquet.reporte_sin_compranbante_matriz.Print;
        except
          on E : Exception do
            ShowMessage(E.ClassName+'  '+E.Message);
        end;

        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

        fremisiones.lborrar.Caption:='SI';
        fremisiones.formactivate(sender);

        FREMISIONES.Close;
        CLOSE;
    except
        showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
        modulo.qryborraremiaux.ExecSQL;
        modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
        fremisiones.Close;
        close;
    end;

end;

procedure TFguardar.llenarTiquet80;
begin
  if FREMISIONES.Econdicion.Text='COTIZACION' then
  BEGIN
    freportetiquet.razon.Visible:=FALSE;
    freportetiquet.nombre.Visible:=FALSE;
    freportetiquet.rfc.Visible:=FALSE;
    freportetiquet.direccion.Visible:=FALSE;
    freportetiquet.telefono.Visible:=FALSE;
    freportetiquet.COTIZACION.Visible:=TRUE;
  END;

  FREMISIONES.total('NO');
  freportetiquet.razon.Caption:=modulo.QryExtras['razon'];
  freportetiquet.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
  freportetiquet.rfc.Caption:=modulo.QryExtras['rfc'];
  freportetiquet.direccion.Caption:=modulo.QryExtras['direccion'];
  freportetiquet.telefono.Caption:=modulo.QryExtras['telefono'];
  freportetiquet.CONDICION.Caption:=fremisiones.Econdicion.Text;

  freportetiquet.Eusuario.Caption:=fverificausu.Lusuario.Caption;
  freportetiquet.ecliente1.Caption:=fremisiones.Ecliente.Text;
  freportetiquet.EDOMICILIO1.Caption:=fremisiones.Edomicilio.Caption;
  freportetiquet.Efecha.Caption:=datetostr(date)+' '+timetostr(time);
  freportetiquet.subtotal.Caption:=FREMISIONES.Ltotal.Caption;
  freportetiquet.descuento.Caption:=FREMISIONES.Ldescuento.Caption;
  freportetiquet.ETOTAL.Caption:=FREMISIONES.nota.Caption;

  freportetiquet.Eusuario2.Caption:=fverificausu.Lusuario.Caption;
  freportetiquet.ecliente2.Caption:=fremisiones.Ecliente.Text;
  freportetiquet.Efecha2.Caption:=datetimetostr(date)+' '+timetostr(time);
  freportetiquet.ETOTAL2.Caption:=FREMISIONES.nota.Caption;
  freportetiquet.CONDICION2.Caption:=fremisiones.Econdicion.Text;

  freportetiquet.Eusuario3.Caption:=fverificausu.Lusuario.Caption;
  freportetiquet.ecliente3.Caption:=fremisiones.Ecliente.Text;
  freportetiquet.Efecha3.Caption:=datetimetostr(date)+' '+timetostr(time);
  freportetiquet.ETOTAL3.Caption:=FREMISIONES.nota.Caption;
  freportetiquet.CONDICION3.Caption:=fremisiones.Econdicion.Text;

  freportetiquet.Efolio.Caption:=fremisiones.Efolio.Text;
  freportetiquet.Efolio2.Caption:=fremisiones.Efolio.Text;
  freportetiquet.Efolio3.Caption:=fremisiones.Efolio.Text;


  try
    freportetiquet.report1.Print;
    //freportetiquet.Report1_copia.Print;
  except
    //on E : Exception do
      //ShowMessage(E.ClassName+'  '+E.Message);
    showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    fremisiones.Close;
    close;
  end;

  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

  if FREMISIONES.Econdicion.Text='COTIZACION' then
  BEGIN
    freportetiquet.razon.Visible:=TRUE;
    freportetiquet.nombre.Visible:=TRUE;
    freportetiquet.rfc.Visible:=TRUE;
    freportetiquet.direccion.Visible:=TRUE;
    freportetiquet.telefono.Visible:=TRUE;
    freportetiquet.COTIZACION.Visible:=FALSE;
  END;

  //fremisiones.lborrar.Caption:='SI';
  //fremisiones.formactivate(sender);

  FREMISIONES.Close;
  CLOSE;

end;

procedure TFguardar.llenarTiquet80Traspado;
begin

  FREMISIONES.total('NO');
  freportetiquet.Trazon.Caption:=modulo.QryExtras['razon'];
  freportetiquet.Tusuario.Caption:=fverificausu.Lusuario.Caption;
  freportetiquet.Tcliente.Caption:=fremisiones.CTienda.Text;
  freportetiquet.Tfecha.Caption:=datetostr(date)+' '+timetostr(time);
  freportetiquet.Tfolio.Caption:=fremisiones.Efolio.Text;
  freportetiquet.ttotal.Caption:=FREMISIONES.nota.Caption;

  try
    freportetiquet.reporteTraspaso.Print;
  except
    showmessage('Ocurrio un problema durante la impresion de la nota, intenta imprimirla de nuevo');
    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    fremisiones.Close;
    close;
  end;

  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

  FREMISIONES.Close;
  CLOSE;
end;

procedure TFguardar.imprimircarta(Sender: TObject);
var
  paginas,aux:integer;
begin
  if Fremisiones.Econdicion.Text='CREDITO' then
  BEGIN
    //22 registros entran completos en una hoja
    //despues de 34 registros agrega otra hoja
    paginas:=1;aux:=23;
    if modulo.qryremiaux2.RecordCount<aux then
      Freportenotascarta.paginas2.Caption:='1 PAGINA'
    ELSE
    while aux <= modulo.qryremiaux2.RecordCount do
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

    Freportenotascarta.FECHAPAGO.Caption:=datetostr(Date+15);
    Freportenotascarta.folio2.Caption:= Fremisiones.Efolio.Text;
    Freportenotascarta.cliente2.Caption:= Fremisiones.Ecliente.Text;
    Freportenotascarta.direccion2.Caption:= Fremisiones.Edomicilio.Caption;
    Freportenotascarta.fecha2.Caption:= datetostr(date);
    Freportenotascarta.hora2.Caption:= timetostr(time);
    Freportenotascarta.stotal2.Caption:= Format('%0:2f',[strtofloat(Fremisiones.nota.Caption)]);
    Freportenotascarta.usuario2.Caption:= fverificausu.Lusuario.Caption;
    Freportenotascarta.CONDICION2.Caption:= fremisiones.Econdicion.Text;

    FREMISIONES.Close;
    close;

    try
      Freportenotascarta.Reportecredito.Print;
      Freportenotascarta.Reportecredito.Print;
      CLOSE;

    except
      on E : Exception do
        ShowMessage(E.ClassName+'  '+E.Message);
    end;
  END
  ELSE
  BEGIN
    //27 registros entran completos en una hoja
    //despues de 34 registros agrega otra hoja
    paginas:=1;aux:=28;
    if modulo.qryremiaux2.RecordCount<aux then
      Freportenotascarta.paginas.Caption:='1 PAGINA'
    ELSE
    while aux <= modulo.qryremiaux2.RecordCount do
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

    Freportenotascarta.efolio.Caption:= Fremisiones.Efolio.Text;
    Freportenotascarta.ecliente.Caption:= Fremisiones.Ecliente.Text;
    Freportenotascarta.edireccion.Caption:= Fremisiones.Edomicilio.Caption;
    Freportenotascarta.efecha.Caption:= datetostr(date);
    Freportenotascarta.ehora.Caption:= timetostr(time);
    Freportenotascarta.stotal.Caption:= Format('%0:2f',[strtofloat(Fremisiones.nota.Caption)]);
    Freportenotascarta.eusuario.Caption:= fverificausu.Lusuario.Caption;
    Freportenotascarta.eCONDICION.Caption:= fremisiones.Econdicion.Text;

    FREMISIONES.Close;
    close;

    try
      Freportenotascarta.Reportenotas.Print;
      Freportenotascarta.Reportenotas.Print;
      CLOSE;

    except
      on E : Exception do
        ShowMessage(E.ClassName+'  '+E.Message);
    end;
  END;
end;


procedure TFguardar.BnotasClick(Sender: TObject);
var
  paginas,aux:integer;
begin
  tipoimpresion:='SERIE';
  //desactivo todos los botones para evitar que se dupliquien folios al presionarlos mas de una vez
  desactivar_botones;

  if ftiponota.Rdfolio.Checked then
    tipoimpresion:='FOLIO';

  modulo.Qryimpresora.Open('select * from impresora');
  freportenotas.Reportenotas.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotas.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotascarta.Reportenotas.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];
  freportenotascarta.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['nota'];

  //freportenotas.Reportenotas.ShowPrintDialog:= modulo.QryRemisiones.RecordCount>22;
  //freportenotas.Reportecredito.ShowPrintDialog:= modulo.QryRemisiones.RecordCount>22;

  //fverificausu.ShowModal;
  //if fverificausu.Lusuario.Caption = '' then
    //showmessage('No puedes imprimir hasta que escribas tu clave')
  //else
  //begin

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

  fremisiones.Guardado(tipoimpresion,'SI',Sender);

  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
  begin
    Freportenotas.Reportenotas.DeviceType:='Screen';
    Freportenotas.Reportecredito.DeviceType:='Screen';
    Freportenotascarta.Reportenotas.DeviceType:='Screen';
    Freportenotascarta.Reportecredito.DeviceType:='Screen'
  end
  else
  begin
    Freportenotas.Reportenotas.DeviceType:='Printer';
    Freportenotas.Reportecredito.DeviceType:='Printer';
    Freportenotascarta.Reportenotas.DeviceType:='Printer';
    Freportenotascarta.Reportecredito.DeviceType:='Printer'
  end;

   FREMISIONES.letra;

  if modulo.QryExtras['notas']='0' then
    imprimirmatriz(sender)
  else
    imprimircarta(sender);
end;

procedure TFguardar.BokClick(Sender: TObject);
begin
  tipoimpresion:='TICKET';
  //desactivo todos los botones para evitar que se dupliquien folios al presionarlos mas de una vez
  desactivar_botones;

  fremisiones.Guardado(tipoimpresion,'SI',Sender);

  FREMISIONES.Close;
  CLOSE;

end;

procedure TFguardar.activar_botones;
begin
  Btiquet.Enabled:=true;
  Bok.Enabled:=false;
  Bok.visible:=false;
  Bnotas.Enabled:=false;
  Bnotas.visible:=false;
  Bnocomprobante.Enabled:=false;
  Bnocomprobante.visible:=false;
end;

procedure TFguardar.BnocomprobanteClick(Sender: TObject);
var
  folio:integer ;
begin
  tipoimpresion:='TICKET';
  //desactivo todos los botones para evitar que se dupliquien folios al presionarlos mas de una vez
  desactivar_botones;

  modulo.Qryimpresora.Open('select * from impresora');
  freportetiquet.report2.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.reporte_sin_compranbante_matriz.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet58.report2.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

  if fremisiones.Econdicion.Text = 'CREDITO' then
  BEGIN
    showmessage('Las notas a credito deben ser impresas en notas');
    exit;
  END;

  if fremisiones.Econdicion.Text = 'COTIZACION' then
  BEGIN
    showmessage('No puedes imprimir cotizaciones en tiquets');
    exit;
  END;

  if ftiponota.Rdfolio.Checked then
  begin
    showmessage('QUITAR FOLIADAS PARA IMPRIMIR TIQUETS');
    EXIT;
  end;


    fremisiones.Guardado(tipoimpresion,'SI',Sender);

    //guardar:= THiloguardar.Create;
    //guardar.Execute;




    if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
    begin
      Freportetiquet.report2.DeviceType:='Screen';
      Freportetiquet.reporte_sin_compranbante_matriz.DeviceType:='Screen'
    end
    else
    begin
      Freportetiquet.report2.DeviceType:='Printer';
      Freportetiquet.reporte_sin_compranbante_matriz.DeviceType:='Printer';
    end;

    if modulo.QryExtras['tiquet']='0' then
      imprimirtiquetSinComprobante80(Sender);
    if modulo.QryExtras['tiquet']='2' then
      imprimirtiquetSinComprobante_matriz(Sender);


  //end;


end;

procedure TFguardar.BtiquetClick(Sender: TObject);
begin
  tipoimpresion:='TICKET';
  //desactivo todos los botones para evitar que se dupliquien folios al presionarlos mas de una vez
  desactivar_botones;

  modulo.Qryimpresora.Open('select * from impresora');
  freportetiquet.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.Reportecredito.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.report_matriz_punto.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.Report1_copia.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet.reporteTraspaso.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
  freportetiquet58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

  if fremisiones.Econdicion.Text = 'COTIZACION' then
  BEGIN
    showmessage('No puedes imprimir cotizaciones en tiquets');
    exit;
  END;

  if ftiponota.Rdfolio.Checked then
  begin
    showmessage('QUITAR FOLIADAS PARA IMPRIMIR TIQUETS');
    EXIT;
  end;

  fremisiones.Guardado(tipoimpresion,'SI',Sender);

  if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
  begin
    Freportetiquet.report1.DeviceType:='Screen';
    Freportetiquet.Reportecredito.DeviceType:='Screen';
    Freportetiquet.Report1_copia.DeviceType:='Screen';
    Freportetiquet.report2.DeviceType:='Screen';
    Freportetiquet.reporteTraspaso.DeviceType:='Screen';
    Freportetiquet58.report1.DeviceType:='Screen';
    Freportetiquet58.report2.DeviceType:='Screen';
    Freportetiquet.report_matriz_punto.DeviceType:='Screen';
  end
  else
  begin
    Freportetiquet.report1.DeviceType:='Printer';
    Freportetiquet.Reportecredito.DeviceType:='Printer';
    Freportetiquet.Report1_copia.DeviceType:='Printer';
    Freportetiquet.report2.DeviceType:='Printer';
    Freportetiquet.reporteTraspaso.DeviceType:='Printer';
    Freportetiquet58.report1.DeviceType:='Printer';
    Freportetiquet58.report2.DeviceType:='Printer';
    Freportetiquet.report_matriz_punto.DeviceType:='Printer';
  end;

  if modulo.QryExtras['tiquet']='0' then
    imprimirtiquet80(sender);
  if modulo.QryExtras['tiquet']='1' then
    imprimirtiquet58(sender);
  if modulo.QryExtras['tiquet']='2' then
    imprimirtiquetMatriz;


end;

procedure TFguardar.desactivar_botones;
begin
  Btiquet.Enabled:=false;
  Bok.Enabled:=false;
  Bnotas.Enabled:=false;
  Bnocomprobante.Enabled:=false;
end;

end.
