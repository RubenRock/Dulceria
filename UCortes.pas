unit UCortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, IdBaseComponent, IdDateTimeStamp,
  Vcl.WinXPickers;

type
  TFCortes = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Efolioini: TEdit;
    Efoliofin: TEdit;
    QryAux: TFDQuery;
    DsAuxSalidas: TDataSource;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label5: TLabel;
    Lcontado: TLabel;
    Label6: TLabel;
    Labonos: TLabel;
    Label8: TLabel;
    Ltotal: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Lsalidas: TLabel;
    Imprimir: TSpeedButton;
    Label7: TLabel;
    LDevoluciones: TLabel;
    Lcreditos: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    descuentos: TLabel;
    Bcorte: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Ehoraini: TEdit;
    Efechaini: TDateTimePicker;
    Efechafin: TDateTimePicker;
    Ehorafin: TEdit;
    Bhistorial: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure filtro(tabla:string;condicion:string);
    procedure ImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LlenarFolios();
    procedure BcorteClick(Sender: TObject);
    procedure EfechainiChange(Sender: TObject);
    procedure BhistorialClick(Sender: TObject);
    procedure imprimirtiquet80;
    procedure imprimirtiquet58;
    procedure datosInicio;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCortes: TFCortes;
  sfecha,nfecha,horaini,horafin:string;

implementation

{$R *.dfm}

uses Umodulo, Ureportecortecaja, UVerificarUsuario, UlistaCortes,
  Ureportecortecaja58;

procedure TFCortes.LlenarFolios();
begin
  qryaux.Open('select * from lista_cortes where usuario = '+quotedstr(Fverificausu.Lusuario.Caption)+' order by fecha_fin ');
  qryaux.Last;

  if qryaux['fecha_fin']<>null then
  begin
    Efechaini.DateTime:=strtodatetime(qryaux['fecha_fin']);

    DateTimeToString(horaini, 'HH:nn:ss', Efechaini.Time);//poner en 24hrs la hora
    ehoraini.Text:=horaini;

    DateTimeToString(horafin, 'HH:nn:ss', now);//poner en 24hrs la hora
    efechafin.Date:= now;
    ehorafin.Text:=horafin;
    bcorte.Click;
  end
  else
  begin
    datosInicio;
  end;


end;

procedure TFCortes.BhistorialClick(Sender: TObject);
begin
   fverificausu.ShowModal;
  if fverificausu.verificar('cortes')then
  BEGIN
    modulo.Qrylista_cortes.Open('select * from lista_cortes');
    flistacortes.ShowModal;
  END;
end;

procedure TFCortes.datosInicio;
begin
  showmessage('No hay registros en el sistema, ingrese los datos para su primer corte');
  efechaini.Enabled:=true;
  ehoraini.Enabled:=true;
  efechafin.Enabled:=true;
  ehorafin.Enabled:=true;
  efechaini.SetFocus;
  bcorte.Enabled := true;
  bcorte.Visible:= true;
end;

procedure TFCortes.EfechainiChange(Sender: TObject);
begin
  imprimir.Enabled:=false;
end;

procedure TFCortes.filtro(tabla: string; condicion: string);
var
  complemento, usuario:string;
begin
  complemento:=' where fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin);
  usuario:= 'and usuario = '+quotedstr(Fverificausu.Lusuario.Caption);
  if tabla= 'lista_remision' then
    usuario:= 'and vendedor = '+quotedstr(Fverificausu.Lusuario.Caption);


  qryaux.Close;
  qryaux.SQL.Clear;
  qryaux.SQL.Add('select * from '+tabla+complemento+condicion+usuario);
  qryaux.Open;
end;

procedure TFCortes.BcorteClick(Sender: TObject);
var
  suma, sumaYastas:real;
  hora1,hora2:string;
begin

    suma:=0;sumaYastas:=0;
    hora1:=datetostr(efechaini.Date)+' '+ehoraini.Text;
    hora2:=datetostr(efechafin.Date)+' '+ehorafin.Text;
    if strtodatetime(hora1)>=strtodatetime(hora2) then
    begin
      imprimir.Enabled:=false;
      showmessage('Fechas incorrectas');
      exit;
    end;

    if modulo.Qrylista_cortes.Locate('fecha_ini',hora1,[]) then
    begin
      showmessage('La fecha de inicio ya fue usada, aumenta un segundo por favor');
      ehoraini.Enabled:=true;
      ehoraini.SetFocus;
      EXIT;
    end;


    // acomodamos el orden de la fecha para que firebird lo reconozca
    horaini:= formatdatetime('mm/dd/yyyy',efechaini.date)+' '+trim(ehoraini.Text);
    horafin:= formatdatetime('mm/dd/yyyy',efechafin.date)+' '+trim(ehorafin.Text);


    //determinamos las horas para hacer mas exacto los cortes
    modulo.QryListaremision.Open('select * from lista_remision where fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+' and vendedor = '+quotedstr(Fverificausu.Lusuario.Caption)+' order by folio');
    modulo.QryListaremision.Filtered:=false;

    if  modulo.QryListaremision.RecordCount>0 then
    begin
      modulo.QryListaremision.First;
      efolioini.Text:= modulo.QryListaremision['folio'] ;
      modulo.QryListaremision.Last;
      efoliofin.Text:= modulo.QryListaremision['folio'] ;
    end
    else
    begin
        efolioini.Text:= '';
        efoliofin.Text:= '' ;
        IMPRIMIR.Enabled:=FALSE;
        EXIT
    end;


    filtro('lista_remision',' and condicion = '+quotedstr('CREDITO') );
    qryaux.First;
    while not qryaux.Eof do
    begin
      suma:=qryaux['total']+suma;
      qryaux.Next;
    end;
    LCREDITOS.Caption:=Format('%0:2f',[suma]);

    suma:=0;
    filtro('lista_remision',' and condicion = '+quotedstr('CONTADO') );
    qryaux.First;
    while not qryaux.Eof do
    begin
      suma:=qryaux['total']+suma;
      qryaux.Next;
    end;
    lcontado.Caption:=Format('%0:2f',[suma]);


    suma:=0;
    filtro('Abonos','');
    qryaux.First;
    while not qryaux.Eof do
    begin
      suma:=qryaux['total']+suma;
      qryaux.Next;
    end;
    labonos.Caption:=Format('%0:2f',[suma]);

    suma:=0;
    filtro('devoluciones','');
    qryaux.First;
    while not qryaux.Eof do
    begin
      //SUMA LAS DEVOLUCIONES DE NOTAS PAGADAS Y LAS DE REPARTO
      modulo.QryListaremision.Open('select * from lista_remision where folio = '+inttostr(qryaux['folio']));
      if (modulo.QryListaremision['estado']='PAGADO') or (qryaux['CONDICION']='REPARTO')  then
        suma:=qryaux['total']+suma;
      qryaux.Next;
    end;
    ldevoluciones.Caption:=Format('%0:2f',[suma]);

    modulo.qryborraremiaux.ExecSQL;
    modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
    suma:=0;
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
    lsalidas.Caption:=Format('%0:2f',[suma]);


    qryaux.Close;qryaux.Open;

    suma:=strtofloat(lcontado.Caption)+strtofloat(labonos.Caption)-strtofloat(lsalidas.Caption)-strtofloat(ldevoluciones.Caption);
    ltotal.Caption:= Format('%0:2f',[suma]);

    qryaux.Open('select count(total) as tot from lista_remision where descuento > 0 and fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin));
    descuentos.Caption:=qryaux['tot'];

    imprimir.Enabled:=true;
end;


procedure TFCortes.FormActivate(Sender: TObject);
begin
  bcorte.Visible := false;
  efolioini.Clear;efoliofin.Clear;
  LCONTADO.Caption:='0.00';
  LABONOS.Caption:='0.00';
  LDEVOLUCIONES.Caption:='0.00';
  LSALIDAS.Caption:='0.00';
  LTOTAL.Caption:='0.00';
  LCREDITOS.Caption:='0.00';
  descuentos.Caption:='0';
  efechaini.Date:= date-1;
  efechafin.Date:= date;
  ehoraini.Text:='00:00:00';
  DateTimeToString(horafin, 'HH:nn:ss', now);
  ehorafin.Text:=horafin;
  imprimir.Enabled:=false;
  efechaini.Enabled:=false;
  ehoraini.Enabled:=false;
  efechafin.Enabled:=false;
  ehorafin.Enabled:=false;
  MODULO.Qrylista_cortes.Open;

  LlenarFolios();

end;

procedure TFCortes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
end;

procedure TFCortes.ImprimirClick(Sender: TObject);
begin


    modulo.Qryimpresora.Open('select * from impresora');
    freportecortecaja.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
    freportecortecaja58.report1.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

    if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
    begin
      freportecortecaja.report1.DeviceType:='Screen';
      freportecortecaja58.report1.DeviceType:='Screen';
    end
    else
    begin
      freportecortecaja.report1.DeviceType:='Printer';
      freportecortecaja58.report1.DeviceType:='Printer';
    end;

    //guardamos los datos en el historial

    MODULO.Qrylista_cortes.Append;
    MODULO.Qrylista_cortes['FOLIO_INICIO']:=TRIM(EFOLIOINI.Text);
    MODULO.Qrylista_cortes['FOLIO_FIN']:=TRIM(EFOLIOFIN.Text);
    MODULO.Qrylista_cortes['FECHA_INI']:=DATETOSTR(EFECHAINI.Date)+' '+TRIM(EHORAINI.Text);
    MODULO.Qrylista_cortes['FECHA_FIN']:=DATETOSTR(EFECHAFIN.Date)+' '+TRIM(EHORAFIN.Text);
    MODULO.Qrylista_cortes['DESCUENTOS']:=descuentos.Caption;
    MODULO.Qrylista_cortes['TOTAL']:=LTOTAL.Caption;
    MODULO.Qrylista_cortes['CONTADO']:=LCONTADO.Caption;
    MODULO.Qrylista_cortes['ABONOS']:=LABONOS.Caption;
    MODULO.Qrylista_cortes['DEVOLUCIONES']:=LDEVOLUCIONES.Caption;
    MODULO.Qrylista_cortes['SALIDAS']:=LSALIDAS.Caption;
    MODULO.Qrylista_cortes['USUARIO']:=FVERIFICAUSU.Lusuario.Caption;
    MODULO.Qrylista_cortes.Post;

    if modulo.QryExtras['tiquet']='0' then
        imprimirtiquet80
    else
      imprimirtiquet58;

    CLOSE;
end;

procedure TFCortes.imprimirtiquet58;
begin
  freportecortecaja58.razon.Caption:=modulo.QryExtras['razon'];
  freportecortecaja58.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;

  freportecortecaja58.fecha.Caption:=datetostr(date)+' '+timetostr(time) ;
  freportecortecaja58.fechaini.Caption:=efolioini.Text;
  freportecortecaja58.fechafin.Caption:=efoliofin.Text;
  freportecortecaja58.CONTADO.Caption:=lcontado.Caption;
  freportecortecaja58.ABONOS.Caption:=labonos.Caption;
  freportecortecaja58.Devoluciones.Caption:=Ldevoluciones.Caption;
  freportecortecaja58.DESCUENTOS.Caption:=descuentos.Caption;
  freportecortecaja58.VENTATOTAL.Caption:=floattostr(strtofloat(lcontado.Caption)+strtofloat(labonos.Caption));
  freportecortecaja58.CLIENTES.Caption:=inttostr(STRTOINT(EFOLIOFIN.Text)-STRTOINT(EFOLIOINI.Text)+1);

  freportecortecaja58.SALIDAS.Caption:=lsalidas.Caption;
  freportecortecaja58.TOTAL.Caption:=ltotal.Caption;
  freportecortecaja58.USUARIO.Caption:=fverificausu.Lusuario.Caption;

  freportecortecaja58.Report1.Print;

end;

procedure TFCortes.imprimirtiquet80;
begin

  freportecortecaja.razon.Caption:=modulo.QryExtras['razon'];
  freportecortecaja.nombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;


  freportecortecaja.fecha.Caption:=datetostr(date)+' '+timetostr(time) ;
  freportecortecaja.fechaini.Caption:=efolioini.Text;
  freportecortecaja.fechafin.Caption:=efoliofin.Text;
  freportecortecaja.CONTADO.Caption:=lcontado.Caption;
  freportecortecaja.ABONOS.Caption:=labonos.Caption;
  freportecortecaja.Devoluciones.Caption:=Ldevoluciones.Caption;
  freportecortecaja.DESCUENTOS.Caption:=descuentos.Caption;
  freportecortecaja.VENTATOTAL.Caption:=floattostr(strtofloat(lcontado.Caption)+strtofloat(labonos.Caption));
  freportecortecaja.CLIENTES.Caption:=inttostr(STRTOINT(EFOLIOFIN.Text)-STRTOINT(EFOLIOINI.Text)+1);

  freportecortecaja.SALIDAS.Caption:=lsalidas.Caption;
  freportecortecaja.TOTAL.Caption:=ltotal.Caption;
  freportecortecaja.USUARIO.Caption:=fverificausu.Lusuario.Caption;

  freportecortecaja.Report1.Print;

end;

end.
