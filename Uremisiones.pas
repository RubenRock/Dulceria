unit Uremisiones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.AppEvnts, Vcl.Menus;

type
  TFremisiones = class(TForm)
    Panel1: TPanel;
    Eliminar: TSpeedButton;
    Btipo: TSpeedButton;
    Modificar: TSpeedButton;
    PAgregar: TPanel;
    Agregar: TSpeedButton;
    PGuardar: TPanel;
    Guardar: TSpeedButton;
    Panel: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edomicilio: TLabel;
    Bclientes: TSpeedButton;
    Ecliente: TEdit;
    GroupBox1: TGroupBox;
    Efolio: TEdit;
    Efecha: TDateTimePicker;
    Econdicion: TComboBox;
    grid: TDBGrid;
    Ebarras: TEdit;
    Panel5: TPanel;
    Label11: TLabel;
    Label4: TLabel;
    Ltotal: TLabel;
    Label9: TLabel;
    Ldescuento: TLabel;
    Lsuma: TLabel;
    Panel4: TPanel;
    Label12: TLabel;
    linea: TLabel;
    label10: TLabel;
    nota: TLabel;
    sqlred: TFDQuery;
    Lborrar: TLabel;
    Label1: TLabel;
    Bpresidencia: TSpeedButton;
    grupo_presidencia: TGroupBox;
    Baplicar: TSpeedButton;
    Eaumento: TEdit;
    qryborrarsurtidos: TFDQuery;
    Timer1: TTimer;
    QryAux: TFDQuery;
    Lid: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Edescuento: TEdit;
    Label8: TLabel;
    PopupMenu1: TPopupMenu;
    Descuentoporproducto1: TMenuItem;
    Rnota: TRadioButton;
    Rproducto: TRadioButton;
    bdescuento: TSpeedButton;
    Label2: TLabel;
    lporcentaje: TLabel;
    Ldescuento_linea: TLabel;
    qrytotal: TFDQuery;
    Ltraspasos: TLabel;
    CTienda: TComboBox;
    LCondicion: TLabel;
    procedure letra;
    procedure AgregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Total(reimpresion:string);
    procedure Reiniciar_tiempo;
    procedure EdescuentoChange(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdescuentoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Guardado(tipimpre: string;imprimir: string;Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure BtipoClick(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure EbarrasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EclienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BclientesClick(Sender: TObject);
    procedure Label3DblClick(Sender: TObject);
    procedure BpresidenciaClick(Sender: TObject);
    procedure BaplicarClick(Sender: TObject);
    procedure EaumentoChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1ActionExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure ActualizarInventario;
    procedure QryAuxAfterExecute(DataSet: TFDDataSet);
    procedure RnotaClick(Sender: TObject);
    procedure RproductoClick(Sender: TObject);
    procedure bdescuentoClick(Sender: TObject);
    procedure Descuentoporproducto1Click(Sender: TObject);
    procedure precioporpieza;
    function preciomayoreo(cantidad:integer):real;
    function verificar_productos:boolean;
    procedure llenarTazasNotas(vtastasa15,iva,vtastasa8,ieps:real);
    procedure VerificarSiEsTraspaso;
    function obtenerFolio:integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fremisiones: TFremisiones;
  tiempo : Longint;

implementation

{$R *.dfm}

uses Udatos2, Umodulo, Udatos, Ugardar, Utiponota, UClientes, UVerificarUsuario,
  Ureportenotas, Uinventario, ureportenotascarta, Urespaldo;

procedure TFremisiones.ActualizarInventario;
begin
  if  modulo.QryExtras['manejar_inventario']=1 then
  begin
      Qryaux.SQL.Clear;
      Qryaux.SQL.Add('delete from inventario_aux');
      Qryaux.ExecSQL;

      //FILTRAR PRODUCTOS Y OBTENER EL TOTAL DE ENTRADAS Y SALIDAS DE CADA UNO
      Qryaux.SQL.Clear;
       Qryaux.SQL.Add(  'insert into INVENTARIO_AUX (folio, cantidad, producto, clave, piezas) '+
                       ' SELECT '+QUOTEDSTR('0')+',SUM(TOTAL)AS TOTAL,'+QUOTEDSTR('PRODCUTO')+', CLAVE, '+QUOTEDSTR('0')+'  FROM '+
                       ' (select sum(cantidad*piezas*-1)AS TOTAL, REMISIONES.clave from REMISIONES, INVENTARIO_EMPAQUE, inventario '+
                       '        where REMISIONES.clave_empaque = INVENTARIO_EMPAQUE.id '+
                       '        and inventario.clave = inventario_empaque.clave '+
                       '        and REMISIONES.clave = inventario.clave '+
                       '        group by REMISIONES.clave '+

                        'UNION '+

                        'select sum(cantidad*piezas)AS TOTAL, recepciones.clave from RECEPCIONES, INVENTARIO_EMPAQUE, inventario '+
                        '       where RECEPCIONES.clave_empaque = INVENTARIO_EMPAQUE.id '+
                        '       and inventario.clave = inventario_empaque.clave '+
                        '       and recepciones.clave = inventario.clave '+
                        '       group by  recepciones.clave '+

                        'UNION '+

                        'select sum(cantidad*piezas)AS TOTAL, DEVOLUCIONES.clave from DEVOLUCIONES, INVENTARIO_EMPAQUE, inventario '+
                        '       where DEVOLUCIONES.clave_empaque = INVENTARIO_EMPAQUE.id '+
                        '       and inventario.clave = inventario_empaque.clave '+
                        '       and DEVOLUCIONES.clave = inventario.clave '+
                        '       group by DEVOLUCIONES.clave) '+

                        'GROUP BY CLAVE ');

      Qryaux.ExecSQL;

      //MODULO.qryinventarioaux.Open('SELECT * FROM INVENTARIO WHERE PRODUCTO IN (SELECT PRODUCTO FROM INVENTARIO_AUX WHERE CANTIDAD >0)');

      MODULO.qryinventarioaux.Open('SELECT * FROM INVENTARIO');
  end;

end;


procedure TFremisiones.letra;
function xIntToLletras(Numero:LongInt):String;

   function xxIntToLletras(Valor:LongInt):String;
   const
    aUnidad : array[1..15] of String =
      ('UN','DOS','TRES','CUATRO','CINCO','SEIS',
       'SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE',
       'TRECE','CATORCE','QUINCE');
    aCentena: array[1..9]  of String =
      ('CIENTO','DOSCIENTOS','TRESCIENTOS',
       'CUATROCIENTOS','QUINIENTOS','SEISCIENTOS',
       'SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');
    aDecena : array[1..9]  of String =
     ('DIECI','VEINTI','TREINTA','CUARENTA','CINCUENTA',
      'SESENTA','SETENTA','OCHENTA','NOVENTA');
   var
    Centena, Decena, Unidad, Doble: LongInt;
    Linea: String;
   begin
    if valor=100 then Linea:=' CIEN '
    else begin
      Linea:='';
      Centena := Valor div 100;
      Doble   := Valor - (Centena*100);
      Decena  := (Valor div 10) - (Centena*10);
      Unidad  := Valor - (Decena*10) - (Centena*100);

      if Centena>0 then Linea := Linea + Acentena[centena]+' ';

      if Doble>0 then begin
        if Doble=20 then Linea := Linea +' VEINTE '
          else begin
           if doble<16 then Linea := Linea + aUnidad[Doble]
             else begin
                  Linea := Linea +' '+ Adecena[Decena];
                  if (Decena>2) and (Unidad<>0) then Linea := Linea+' Y ';
                  if Unidad>0 then Linea := Linea + aUnidad[Unidad];
             end;
          end;
      end;
    end;
    Result := Linea;
   end;

 var
    Millones,Miles,Unidades: Longint;
    Linea : String;
 begin
   {Inicializamos el string que contendrá las letras según el valor
   numérico}
   if numero=0 then Linea := 'CERO'
   else if numero<0 then Linea := 'MENOS '
        else if numero=1 then
             begin
               Linea := 'UN';
               xIntToLletras := Linea;
               exit
             end
             else if numero>1 then Linea := '';

   {Determinamos el Nº de millones, miles y unidades de numero en
   positivo}
   Numero   := Abs(Numero);
   Millones := numero div 1000000;
   Miles     := (numero - (Millones*1000000)) div 1000;
   Unidades  := numero - ((Millones*1000000)+(Miles*1000));

   {Vamos poniendo en el string las cadenas de los números(llamando
   a subfuncion)}
   if Millones=1 then Linea:= Linea + ' UN MILLON '
   else if Millones>1 then Linea := Linea + xxIntToLletras(Millones)
                                    + ' MILLONES ';

   if Miles =1 then Linea:= Linea + ' MIL '
   else if Miles>1 then Linea := Linea + xxIntToLletras(Miles)+
                                 ' MIL ';

   if Unidades >0 then Linea := Linea + xxIntToLletras(Unidades);

   xIntToLletras := Linea;
 end;
 var
   xn:integer;
   xnum:string;
 begin
   xnum:='';
   for xn:=1 to length(nota.Caption) do
     if nota.Caption[xn]<>'.' then
       xnum:=xnum+nota.Caption[xn]
     else
       break;

   freportenotas.Eletra.Caption:=(xIntToLletras(StrToInt(xnum))+' PESOS '+nota.Caption[xn+1]+'0/100 M.N.');
   freportenotas.letra2.Caption:=(xIntToLletras(StrToInt(xnum))+' PESOS '+nota.Caption[xn+1]+'0/100 M.N.');
   freportenotascarta.letra2.Caption:=(xIntToLletras(StrToInt(xnum))+' PESOS '+nota.Caption[xn+1]+'0/100 M.N.');
   freportenotascarta.Eletra.Caption:=(xIntToLletras(StrToInt(xnum))+' PESOS '+nota.Caption[xn+1]+'0/100 M.N.');
end;

procedure TFremisiones.llenarTazasNotas(vtastasa15,iva,vtastasa8,ieps:real);
begin
  //matriz de punto
  freportenotas.vtatasa0.Caption:=Format('%0:2f',[STRTOFLOAT(nota.Caption)-iva-vtastasa15-ieps-vtastasa8]);
  freportenotas.vtatasa15.Caption:=Format('%0:2f',[vtastasa15]);
  freportenotas.iva.Caption:=Format('%0:2f',[iva]);

  freportenotas.vtatasa8.Caption:=Format('%0:2f',[vtastasa8]);
  freportenotas.ieps.Caption:=Format('%0:2f',[ieps]);
  freportenotas.subtotal16.Caption:=Format('%0:2f',[iva+vtastasa15]);
  freportenotas.subtotal18.Caption:=Format('%0:2f',[ieps+vtastasa8]);

  //credito
  freportenotas.vtatasa02.Caption:=Format('%0:2f',[STRTOFLOAT(nota.Caption)-iva-vtastasa15-ieps-vtastasa8]);
  freportenotas.vtatasa152.Caption:=Format('%0:2f',[vtastasa15]);
  freportenotas.iva2.Caption:=Format('%0:2f',[iva]);

  freportenotas.vtatasa82.Caption:=Format('%0:2f',[vtastasa8]);
  freportenotas.ieps2.Caption:=Format('%0:2f',[ieps]);
  freportenotas.subtotal162.Caption:=Format('%0:2f',[iva+vtastasa15]);
  freportenotas.subtotal182.Caption:=Format('%0:2f',[ieps+vtastasa8]);

  //carta

  freportenotascarta.vtatasa15.Caption:=Format('%0:2f',[vtastasa15]);
  freportenotascarta.iva.Caption:=Format('%0:2f',[iva]);
  freportenotascarta.vtatasa8.Caption:=Format('%0:2f',[vtastasa8]);
  freportenotascarta.ieps.Caption:=Format('%0:2f',[ieps]);
  freportenotascarta.subtotal16.Caption:=Format('%0:2f',[iva+vtastasa15]);
  freportenotascarta.subtotal18.Caption:=Format('%0:2f',[ieps+vtastasa8]);                                                                                                                         //descuento sin decimales
  freportenotascarta.vtatasa0.Caption:=Format('%0:2f',[STRTOFLOAT(nota.Caption)-strtofloat(freportenotascarta.subtotal16.Caption)-strtofloat(freportenotascarta.subtotal18.Caption)+(STRTOFLOAT(ltotal.Caption)-STRTOFLOAT(nota.Caption))]);
  freportenotascarta.descuento.Caption:=Format('%0:2f',[strtofloat(ltotal.Caption)-strtofloat(nota.Caption)]);
  freportenotascarta.stotal.Caption:=fremisiones.nota.Caption;


  freportenotascarta.vtatasa152.Caption:=Format('%0:2f',[vtastasa15]);
  freportenotascarta.iva2.Caption:=Format('%0:2f',[iva]);
  freportenotascarta.vtatasa82.Caption:=Format('%0:2f',[vtastasa8]);
  freportenotascarta.ieps2.Caption:=Format('%0:2f',[ieps]);
  freportenotascarta.subtotal162.Caption:=Format('%0:2f',[iva+vtastasa15]);
  freportenotascarta.subtotal182.Caption:=Format('%0:2f',[ieps+vtastasa8]);                                                                                                                         //descuento sin decimales
  freportenotascarta.vtatasa02.Caption:=Format('%0:2f',[STRTOFLOAT(nota.Caption)-strtofloat(freportenotascarta.subtotal162.Caption)-strtofloat(freportenotascarta.subtotal182.Caption)+(STRTOFLOAT(ltotal.Caption)-STRTOFLOAT(nota.Caption))]);
  //freportenotascarta.subtotal.Caption:= Format('%0:2f',[(strtofloat(freportenotascarta.vtatasa02.Caption)+strtofloat(freportenotascarta.subtotal162.Caption)+strtofloat(freportenotascarta.subtotal182.Caption))]);
  freportenotascarta.descuento.Caption:=Format('%0:2f',[strtofloat(ltotal.Caption)-strtofloat(nota.Caption)]);
  freportenotascarta.stotal2.Caption:=fremisiones.nota.Caption;



end;

function TFremisiones.verificar_productos:boolean;
var
  numpiezas: integer;
  noempaque,noprecio,empaque, clave:string;
begin
  clave:='';empaque:='';
  verificar_productos:=true;
  noempaque:='';noprecio:='';
  qrytotal.First;
  while not qrytotal.Eof do
  begin

    sqlred.Open('select * from inventario where clave ='+quotedstr(qrytotal['clave']));
    if sqlred['clave']<>null then
    clave:=sqlred['clave']
    else
    begin
      //productos surtidos
      sqlred.Open('select * from inventario, lista_similar, similar where inventario.clave = similar.producto '+
                      ' and similar.CLAVE = LISTA_SIMILAR.CLAVE '+
                      ' and lista_similar.DESCRIPCION ='+quotedstr(qrytotal['producto']));


      if sqlred['clave']<>null then
        clave:=sqlred['clave']
      else
      begin
        showmessage('Error en el nombre del producto: '+quotedstr(qrytotal['producto']));
        verificar_productos:=false;
        exit;
      end;
    end;

        //descartamos los que tienen precio 0 por ser surtidos
        if qrytotal['total'] <> '0' then
        begin
          if sqlred['precio_uni']<> qrytotal['precio'] then
          begin
            if qrytotal['cantidad']=6 then
            begin
              if sqlred['precio_seis']<> qrytotal['total'] then
                noprecio:= noprecio+qrytotal['producto']+chr(10);
            end
            else
            begin
              if (qrytotal['cantidad']mod 12 = 0) then
              begin
                if ( qrytotal['total'] / (qrytotal['cantidad']/ 12))<> sqlred['precio_doce'] then
                  noprecio:= noprecio+qrytotal['producto']+chr(10);
              end
              else
                noprecio:= noprecio+qrytotal['producto']+chr(10);
            end;

          end;

        end;


    qrytotal.Next;
  end;

  if noprecio<>'' then
  begin
    showmessage('Error en los precios:'+chr(10)+noprecio);
    verificar_productos:=false;
  end;


end;

function TFremisiones.preciomayoreo(cantidad:integer):real;
var
  epiezas:string;
begin
    sqlred.Open('select * from inventario where producto ='+quotedstr(modulo.qryremiaux2['producto']));
    if sqlred['clave']<>null then
    begin
      preciomayoreo:= sqlred['precio_uni'];

      if cantidad = 6 then
        if sqlred['precio_seis'] > 0then
          preciomayoreo := sqlred['precio_seis']/6;

      if cantidad mod 12 = 0 then
        if sqlred['precio_doce'] > 0then
          preciomayoreo := sqlred['precio_doce']/cantidad;
    end;
end;

procedure TFremisiones.precioporpieza;
var
  resul:real;
begin
  if modulo.qryremiaux2.RecordCount>0 then
  begin
    resul:=0;
    modulo.qryinventarioaux.Open('select * from inventario where producto ='+quotedstr(modulo.qryremiaux2['producto']));
    if modulo.qryinventarioaux['clave']<>null then
      resul:=modulo.qryremiaux2['total']/modulo.qryremiaux2['cantidad']
    else
    begin
      linea.Caption:=Format('%0:2f',[resul]);
      modulo.qryinventarioaux.Open('select * from inventario order by producto');modulo.qryinventarioaux.First;
      exit;
    end;

    modulo.qryinventarioaux.Open('select * from inventario order by producto');modulo.qryinventarioaux.First;
    linea.Caption:=Format('%0:2f',[resul]);

    label2.Visible:=false;
    ldescuento_linea.Visible:=false;
    lporcentaje.Visible:=false;
    if rproducto.Checked then
      if (modulo.qryremiaux2['descuento']<>null) and (strtofloat(modulo.qryremiaux2['descuento'])>0) then
      begin
        ldescuento_linea.Caption:=floattostr(strtofloat(MODULO.qryremiaux2['TOTAL'])*strtofloat(MODULO.qryremiaux2['descuento'])/100);
        lporcentaje.Caption:=MODULO.qryremiaux2['descuento']+'%';

        label2.Visible:=true;
        ldescuento_linea.Visible:=true;
        lporcentaje.Visible:=true;
      end;
  end;

end;

procedure TFremisiones.Reiniciar_tiempo;
begin
  tiempo:=0;
  //ebarras.Text:=timetostr(time)
end;


procedure TFremisiones.RnotaClick(Sender: TObject);
begin
  bdescuento.Visible:=FALSE;
  edescuento.OnChange(sender);
  total('NO');
end;

procedure TFremisiones.RproductoClick(Sender: TObject);
begin
  bdescuento.Visible:=TRUE;
  total('NO');
end;

procedure TFremisiones.Guardado(tipimpre: string; imprimir: string; Sender: TObject);
var
  fol,cont:integer;
  sfecha, nfecha,hora, estado, descuento, sqlRemisiones, sqlCajaRemisiones, clave_empaque: string;
  segunda_caja:boolean;
begin
  modulo.QryExtras.Open('select * from extras');//para checar si esta activa la segunda caja
  segunda_caja:= ((modulo.QryExtras['segundacaja']='1')and (Econdicion.Text = 'CONTADO')); //true

  modulo.qryremiaux2.First;cont:=0;sfecha:=datetimetostr(efecha.DateTime);
  DateTimeToString(hora, 'HH:nn:ss', time);  //pone en 24rs el formato del reloj
  delete(hora,9,5);//borra los caracteres despues de la fecha como a.m.
  nfecha:= sfecha[4]+sfecha[5]+'/'+sfecha[1]+sfecha[2]+'/'+sfecha[9]+sfecha[10]+' '+hora;

  //try

  if modulo.qryremiaux2.RecordCount > 0 then
  begin

    if tipimpre <> 'FOLIO' then
    BEGIN
      EFOLIO.Text:=inttostr(obtenerFolio);

      estado:='PAGADO';
      if econdicion.TexT<>'CONTADO' then
        estado:='PENDIENTE';

      //si es traspaspaso le pongo los datos correctos
      SQLRED.SQL.Clear;
      if fremisiones.Ltraspasos.Caption='SI' then
        Sqlred.SQL.Add('insert into LISTA_REMISION (FOLIO,CONDICION,ESTADO,CLIENTE,TOTAL,FECHA,VENDEDOR,DOMICILIO,IMPRESION,DESCUENTO)values ('+efolio.Text+','+quotedstr('TRASPASO')+','+quotedstr('PENDIENTE')+','+quotedstr(ctienda.Text)+','+NOTA.Caption+','+CHR(39)+nfecha+CHR(39)+','+CHR(39)+fverificausu.Lusuario.Caption+chr(39)+','+quotedstr('CONOCIDO')+','+CHR(39)+tipimpre+CHR(39)+','+CHR(39)+Ldescuento.Caption+CHR(39)+')')
      else
      begin
        Sqlred.SQL.Add('insert into LISTA_REMISION (FOLIO,CONDICION,ESTADO,CLIENTE,TOTAL,FECHA,VENDEDOR,DOMICILIO,IMPRESION,DESCUENTO)values ('+efolio.Text+','+CHR(39)+econdicion.Text+CHR(39)+','+CHR(39)+estado+CHR(39)+','+CHR(39)+ecliente.Text+CHR(39)+','+NOTA.Caption+','+CHR(39)+nfecha+CHR(39)+','+CHR(39)+fverificausu.Lusuario.Caption+chr(39)+','+CHR(39)+edomicilio.Caption+CHR(39)+','+CHR(39)+tipimpre+CHR(39)+','+CHR(39)+Ldescuento.Caption+CHR(39)+')');
        //frespaldo.sqlParaRespaldo('insert into LISTA_REMISION (FOLIO,CONDICION,ESTADO,CLIENTE,TOTAL,FECHA,VENDEDOR,DOMICILIO,IMPRESION,DESCUENTO)values ('+efolio.Text+','+CHR(39)+econdicion.Text+CHR(39)+','+CHR(39)+estado+CHR(39)+','+CHR(39)+ecliente.Text+CHR(39)+','+NOTA.Caption+','+CHR(39)+nfecha+CHR(39)+','+CHR(39)+fverificausu.Lusuario.Caption+chr(39)+','+CHR(39)+edomicilio.Caption+CHR(39)+','+CHR(39)+tipimpre+CHR(39)+','+CHR(39)+Ldescuento.Caption+CHR(39)+')');
      end;
      Sqlred.ExecSQL;

      //INGRESAMOS LA NOTA EN EL PROGRAMA DE LA CAJA
      if (segunda_caja and (ltraspasos.Caption<>'SI')) then
        if econdicion.Text='CONTADO' then
        BEGIN
          SQLRED.SQL.Clear;
          Sqlred.SQL.Add('insert into CAJA_LISTA_REMISION(FOLIO,CONDICION,CLIENTE,TOTAL,FECHA,VENDEDOR,DOMICILIO,IMPRESION,DESCUENTO)values ('+efolio.Text+','+QuotedStr(econdicion.Text)+','+QuotedStr(ecliente.Text)+','+NOTA.Caption+','+QuotedStr(nfecha)+','+QuotedStr(fverificausu.Lusuario.Caption)+','+QuotedStr(edomicilio.Caption)+','+CHR(39)+tipimpre+CHR(39)+','+CHR(39)+Ldescuento.Caption+CHR(39)+')');
          Sqlred.ExecSQL;
        END;

    END;

    modulo.QryRemisiones.Open('select * from remisiones');
    modulo.qryremiaux2.First;

    //sqlCajaRemisiones:='insert INTO caja_remisiones ';
    sqlRemisiones := 'insert INTO remisiones ';
    while not modulo.qryremiaux2.Eof do
    begin
      descuento:='';
      if modulo.qryremiaux2['DESCUENTO'] <> null then
        descuento:=modulo.qryremiaux2['DESCUENTO'];

      if modulo.qryremiaux2['clave_empaque']=null then //para productos surtidos que no marque error
        clave_empaque:='..'
      else
        clave_empaque:=modulo.qryremiaux2['clave_empaque'];

      if ECONDICION.Text <> 'COTIZACION' then//SI ES COTIZACION NO DEBE AFECTAR AL INVENTARIO
      begin
                                                          //folio,                                  cantidad,                                         producto,                                     total,         tipo,                                     empaque,         descuento,                                        clave,                       clave_empaque                                        iva
        sqlRemisiones := sqlRemisiones +'select '+efolio.Text+','+QuotedStr(modulo.qryremiaux2['cantidad'])+','+QuotedStr(modulo.qryremiaux2['producto'])+','+quotedstr(modulo.qryremiaux2['total'])+','+QUOTEDSTR(tipimpre)+','+QuotedStr('empaque')+','+QuotedStr(descuento)+','+QuotedStr(modulo.qryremiaux2['clave'])+','+quotedstr(clave_empaque)+' from RDB$DATABASE '#13#10;


        if modulo.QryExtras['manejar_inventario']=1 then
            Finventario.reducirInventario(modulo.qryremiaux2['clave'],modulo.qryremiaux2['clave_empaque'],modulo.qryremiaux2['cantidad']);

      end
      else
        //no agrego las claves para que no afecte en el inventario
        sqlRemisiones := sqlRemisiones +'select '+efolio.Text+','+QuotedStr(modulo.qryremiaux2['cantidad'])+','+QuotedStr(modulo.qryremiaux2['producto'])+','+quotedstr(modulo.qryremiaux2['total'])+','+QUOTEDSTR(tipimpre)+','+QuotedStr(modulo.qryremiaux2['empaque'])+','+QuotedStr(descuento)+','+QuotedStr(' ')+','+quotedstr(' ')+' from RDB$DATABASE '#13#10;

      if (tipimpre <> 'FOLIO') and (econdicion.Text='CONTADO') and (modulo.QryExtras['segundacaja'] = '1') then      //INGRESAMOS LA NOTA EN EL PROGRAMA DE LA CAJA
      begin
          //sqlCajaRemisiones:= sqlCajaRemisiones+'select '+efolio.Text+','+QuotedStr(modulo.qryremiaux2['cantidad'])+','+QuotedStr(modulo.qryremiaux2['empaque']+' '+modulo.qryremiaux2['producto'])+','+QUOTEDSTR(modulo.qryremiaux2['TOTAL'])+','+QuotedStr(modulo.qryremiaux2['PRECIO'])+','+QuotedStr(tipimpre)+','+QuotedStr(descuento)+','+quotedstr(modulo.qryremiaux2['clave'])+','+quotedstr(modulo.qryremiaux2['PRODUCTO'])+','+quotedstr(modulo.qryremiaux2['iva'])+' from RDB$DATABASE '#13#10;
          sqlred.SQL.clear;
          sqlred.Open('select * from caja_remisiones');
          sqlred.Append;
          sqlred['folio']:=efolio.Text;
          sqlred['cantidad']:=modulo.qryremiaux2['cantidad'];
          sqlred['producto2']:=modulo.qryremiaux2['empaque']+' '+modulo.qryremiaux2['producto'];
          sqlred['total']:=modulo.qryremiaux2['TOTAL'];
          sqlred['precio']:= modulo.qryremiaux2['PRECIO'];
          sqlred['tipo']:=tipimpre;
          sqlred['descuento']:= descuento;
          sqlred['producto']:=modulo.qryremiaux2['clave'];
          sqlred['clave']:=modulo.qryremiaux2['PRODUCTO'];
          sqlred['iva']:=modulo.qryremiaux2['iva'];
          sqlred.Post;
      end;

      modulo.qryremiaux2.Next;
      if modulo.qryremiaux2.Eof then//final de la sentencia sql
      begin
        sqlCajaRemisiones:= sqlCajaRemisiones+';';
        sqlRemisiones := sqlRemisiones +';';
      end
      else
      begin
        sqlCajaRemisiones:= sqlCajaRemisiones+'  UNION ALL ';
        sqlRemisiones:= sqlRemisiones+'  UNION ALL ';
      end;

    end;

    SQLRED.SQL.Clear;
    Sqlred.ExecSQL(sqlRemisiones);
    {if (segunda_caja and (ltraspasos.Caption<>'SI') and (econdicion.Text='CONTADO')) then
    begin
      SQLRED.SQL.Clear;
      Sqlred.ExecSQL(sqlCajaRemisiones);
    end;}

    //para no hacer commit en cada ingreso de articulos
    MODULO.Conector.Commit;

    modulo.QryRemisiones.Close;

  end;
  //except on E: Exception do

  //  showmessage('ocurrio un error: '+e.Message);
  //end;

end;

procedure TFremisiones.Timer1Timer(Sender: TObject);
begin
  inc(tiempo);
  if tiempo > 90 then
  begin
    if modulo.qryremiaux2.RecordCount<1 then
        close;
  end;
end;

procedure TFremisiones.Total(reimpresion:string);
var
  resul,vtastasa0,vtastasa15,iva,vtastasa8,ieps,descuento,resta:real;
begin
  //limpiar filtros del inventario
  modulo.qryinventarioaux.Filtered:=false;
  modulo.qryinventarioaux.Open('select * from inventario');

  qrytotal.Open('select * from remision_aux');
  qrytotal.Last;

  resul:=0;vtastasa0:=0;vtastasa15:=0;iva:=0;ieps:=0;vtastasa8:=0;descuento:=0;
  if qrytotal.RecordCount=0 then
  begin
    nota.Caption:=' ';linea.Caption:=' ';
  end
  else
  begin
    qrytotal.First;
    while not qrytotal.Eof do
    begin
        if qrytotal['iva']='16' then
          vtastasa15:=vtastasa15+qrytotal['total']
        else
          if qrytotal['iva']='8' then
            ieps:=ieps+qrytotal['total']
          else
            vtastasa0:=vtastasa0+qrytotal['total'];

      if rproducto.Checked then
        if qrytotal['descuento']<>null then
        begin
          descuento:=descuento+strtofloat(qrytotal['TOTAL'])*strtofloat(qrytotal['descuento'])/100;

        end;


      resul:=resul+qrytotal['Total'];
      qrytotal.Next;
    end;
    if vtastasa15>0 then
    begin
      vtastasa15:=vtastasa15/1.16;
      iva:=vtastasa15*16/100;
    end;

    if ieps>0 then
    begin
      vtastasa8:=ieps/1.08;
      ieps:=ieps-vtastasa8;
    end;

    ltotal.Caption:=Format('%0:2f',[resul]);
    if RNOTA.Checked then
    BEGIN
         descuento:=resul*strtofloat(edescuento.Text)/100;
    END;

    ldescuento.Caption:=Format('%0:2f',[descuento]);
    lsuma.Caption:=Format('%0:2f',[resul-descuento]);

    resta:=strtoint(lsuma.caption[Length(lsuma.caption)-1]+lsuma.caption[Length(lsuma.caption)]);
    if resta > 0 then
    begin
      if resta > 50 then
        resta:=(100-resta)/100
      else
        resta:=(50-resta)/100;
    end;
    nota.Caption:=Format('%0:2f',[(strtofloat(lsuma.Caption)+resta)]);

    if reimpresion='SI' then  //si es reimpresion se hace un calculo diferente por los descuentos
    begin
      if modulo.QryListaremision['descuento']<>'0' then
      begin
        Ldescuento.Caption:=Format('%0:2f',[(strtofloat(nota.Caption)-strtofloat(modulo.QryListaremision['total']))]);
        nota.Caption:=Format('%0:2f',[(strtofloat(modulo.QryListaremision['total']))]);
      end;
    end;

    llenarTazasNotas(vtastasa15,iva,vtastasa8,ieps);



  end;
end;

procedure TFremisiones.VerificarSiEsTraspaso;
begin
  if Ltraspasos.Caption= 'SI' then
  begin
    Ctienda.Visible:=true;
    lcondicion.Visible:=true;
    econdicion.Visible:=false;
    ecliente.Visible:=false;
  end
  else
  begin
    Ctienda.Visible:=false;
    lcondicion.Visible:=false;
    econdicion.Visible:=true;
    ecliente.Visible:=true;
  end;

end;

procedure TFremisiones.AgregarClick(Sender: TObject);
begin
  modulo.QryEmpaque.Open('select * from inventario_empaque');
  Lborrar.Caption:='NO';  // ventana de datos no borre encabezado
  fdatos.precio.ReadOnly:=TRUE;
  fdatos.Cantidad.Text:='1';
  fdatos.precio.Text:='';
  fdatos.eprodu.Clear;
  fdatos.Hint:='ALTA'; //BANDERA PARA MODIFICAR O AGREGAR PRODUCTOS A LA REMISION
  modulo.qryinventarioaux.Open('select * from inventario order by producto');modulo.qryinventarioaux.First;

  fdatos.CSurtir.Checked:=false;
  fdatos.Show;
  fdatos.cantidad.SetFocus;

end;

procedure TFremisiones.BclientesClick(Sender: TObject);
begin
  reiniciar_tiempo;
  modulo.QryClientes.Open('select (CLIENTES.NOMBRE|| '+QUOTEDSTR(' ')+ ' ||CLIENTES.APELLIDOS)AS NOM_COM, NOMBRE, APELLIDOS,DIRECCION , TELEFONO, EMAIL, CREDITO, MULTICREDITO, ID from CLIENTES');
  fclientes.showmodal;
end;

procedure TFremisiones.bdescuentoClick(Sender: TObject);
VAR
  descuento:real;
begin
   if trim(edescuento.Text)<> '' then
      try
        strtofloat(edescuento.Text);
        descuento:=strtofloat(MODULO.qryremiaux2['TOTAL'])*strtofloat(edescuento.Text)/100;
        modulo.qryremiaux2.Edit;
        modulo.qryremiaux2['descuento']:=trim(edescuento.Text);
        modulo.qryremiaux2.Post;
        total('NO');
      except
        edescuento.Text:='0';
        edescuento.SetFocus;
        showmessage('Valor incorrecto');
      end;
end;

procedure TFremisiones.BpresidenciaClick(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remiaumentar') then
    if verificar_productos then
      grupo_presidencia.Visible:=true;
end;

procedure TFremisiones.BtipoClick(Sender: TObject);
begin
  ftiponota.fecha.Date:=date;
  Ftiponota.ShowModal;
end;

procedure TFremisiones.Descuentoporproducto1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remicambiar') then
    if verificar_productos then
      panel2.Visible:=true;
end;

procedure TFremisiones.EbarrasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  pre,tot:real;
begin

  if key=vk_return then
  BEGIN
    modulo.QryEmpaque.Open('select * from inventario_empaque');
    if modulo.QryEmpaque.Locate('barras',trim(ebarras.Text),[]) and (trim(ebarras.Text)<>'0') and (trim(ebarras.Text)<>'') then
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
          modulo.qryremiaux2['clave_empaque']:=modulo.QryEmpaque['ID'];

          pre:=modulo.QryEmpaque['PRECIO'];
          tot:=modulo.qryremiaux2['cantidad']*pre;
          if modulo.qryremiaux2['cantidad'] = 6 then
          begin
            modulo.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.QryEmpaque['clave']));
            IF modulo.QryEmpaque.Locate('EMPAQUE','6',[])then
            begin
              tot:=modulo.QryEmpaque['PRECIO'];
              pre:= modulo.QryEmpaque['PRECIO']/6;
            end;
          end
          else
          if (modulo.qryremiaux2['cantidad'] mod 12) = 0 then
          begin
            modulo.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.QryEmpaque['clave']));
            IF modulo.QryEmpaque.Locate('EMPAQUE','12',[])then
            begin
              tot:=modulo.QryEmpaque['PRECIO'];
              pre:= modulo.QryEmpaque['PRECIO']/12;
            end;
          end;

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
          modulo.qryremiaux2['clave_empaque']:=modulo.QryEmpaque['ID'];
          modulo.qryremiaux2.Post;

        end;
        TOTAL('NO');
    end
    else
      if trim(ebarras.Text)<>'' then
        showmessage('El producto no existe en el sistema');


    EBARRAS.Clear;
  END;

  if key = vk_f2 then
    agregar.Click;
  if key = vk_f3 then
    guardar.Click;
end;

procedure TFremisiones.EclienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  reiniciar_tiempo;
  if key = vk_f3 then
    guardar.Click;
  if key = vk_f2 then
  begin
    bclientes.Click;
  end;
end;

procedure TFremisiones.EdescuentoChange(Sender: TObject);
begin
  if rnota.Checked then
    if trim(edescuento.Text)<> '' then
      try
        strtofloat(edescuento.Text);
        total('NO');
      except
        edescuento.Text:='0';
        edescuento.SetFocus;
        showmessage('Valor incorrecto');
      end;
end;

procedure TFremisiones.EdescuentoExit(Sender: TObject);
begin
  if trim(edescuento.Text)='' then
    edescuento.Text:='0';
end;

procedure TFremisiones.EaumentoChange(Sender: TObject);
var
  operacion:string;
  descuento,redondeo,total,porcentaje:extended;
begin
    if trim(eaumento.Text)='' then
      porcentaje:=0
    else
      porcentaje:=strtofloat(eaumento.text);

    modulo.qryremiaux2.First;
    while (not modulo.qryremiaux2.Eof) do
    begin
      guardar.Enabled:=false;  //uso una bandera de seguridad para que los precios unitarios se actualicen con el descuento
      total:=modulo.qryremiaux2['cantidad']*modulo.qryremiaux2['precio'];
      descuento:=total*porcentaje/100;
      descuento:=total+descuento;
      operacion:=Format('%0:2f',[descuento]);
      //resta:=strtoint(nota.caption[1]);
      redondeo:=strtoint(operacion[Length(operacion)-1]+operacion[Length(operacion)]);
      if redondeo > 0 then
      begin
        if redondeo > 50 then
          redondeo:=(100-redondeo)/100
        else
          redondeo:=(50-redondeo)/100;
      end;
      operacion:=Format('%0:2f',[strtofloat(operacion)+redondeo]);
      modulo.qryremiaux2.Edit;
      modulo.qryremiaux2['total']:=operacion;
      modulo.qryremiaux2.Post;
      modulo.qryremiaux2.Next;
    end;
   self.total('NO');
end;

procedure TFremisiones.EliminarClick(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
  if modulo.qryremiaux2.RecordCount >0 then
  begin
    //eliminar todos los productos surtidos en la lista
    if modulo.qryremiaux2['surtir']<>null then
    begin
      qryborrarsurtidos.SQL.Clear;
      qryborrarsurtidos.SQL.Add('delete from remision_aux where surtir ='+quotedstr(modulo.qryremiaux2['surtir']));
      qryborrarsurtidos.ExecSQL;
      modulo.qryremiaux2.Close; modulo.qryremiaux2.Open;
    end
    else
      modulo.qryremiaux2.Delete;

    total('NO');

  end;
end;

procedure TFremisiones.FormActivate(Sender: TObject);
var
  folio:integer;
begin
  tiempo:=0;
  timer1.Enabled:=true;

  VerificarSiEsTraspaso;

  modulo.QrySimilar.Open('select * from similar'); //actualizamos la tabla de similares
  modulo.QryListaSimilar.Open('select * from lista_similar');
  if lborrar.Caption = 'SI' then
  BEGIN
    econdicion.ItemIndex:=0;
    eDescuento.Text:='0';
    Edomicilio.Caption:='';
    Ecliente.Text:='';
    Efecha.Date:=date;
    EBARRAS.Clear;
    fremisiones.baplicar.Hint:='';//BANDERA PARA IMPRIMIR CON EL ENCABEZADO DE ADAN

    linea.Caption:='0.00';
    nota.Caption:='0.00';
    ltotal.Caption:='0.00';
    ldescuento.Caption:='0.00';
    rnota.Checked:=true;
    panel2.Visible:=false;
    lsuma.Caption:='0.00';
    eaumento.Text:='';
    grupo_presidencia.Visible:=false;
    guardar.Enabled:=true;

    if ecliente.Visible then
      ecliente.SetFocus
    else
      ctienda.SetFocus;


    //ActualizarInventario;
  END;

  if ftiponota.rdserie.Checked then
  begin
    modulo.QrynumFolio.Close;
    modulo.QrynumFolio.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_REMISION');

    folio:=1;
    if modulo.QrynumFolio['numfolio']<>null then
      folio:= modulo.QrynumFolio['numfolio']
    else
    begin
      modulo.Qrylistaremisionresp.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_REMISION_RESP');
      if modulo.Qrylistaremisionresp['numfolio']<>null then
      begin
        folio:= modulo.Qrylistaremisionresp['numfolio'];
      end;
    end;
      EFOLIO.Text:=inttostr(folio);

  end
  else
  begin
    modulo.QrynumFolio.Close;
    modulo.QrynumFolio.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_folios');

    folio:=1;
    if modulo.QrynumFolio['numfolio']<>null then
      folio:= modulo.QrynumFolio['numfolio']
    else
    begin
      modulo.Qrylistafoliosresp.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_FOLIOS_RESP');
      if modulo.Qrylistafoliosresp['numfolio']<>null then
      begin
        folio:= modulo.Qrylistafoliosresp['numfolio'];
      end;
    end;
      EFOLIO.Text:=inttostr(folio);

  end;
end;

procedure TFremisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  timer1.Enabled:=false;
  eaumento.Text:='';
  grupo_presidencia.Visible:=false;
  guardar.Enabled:=true;
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
  fdatos.Close;
  fdatos.precio.ReadOnly:=true;
  modulo.QryListaremision.Open('select * from lista_remision order by folio desc rows 50');
end;

procedure TFremisiones.FormShow(Sender: TObject);
begin
  //abrir la tabla
  modulo.qryinventarioaux.Open('select * from inventario');
end;

procedure TFremisiones.gridCellClick(Column: TColumn);
begin
  //mostrar cuanto cuenta cada pieza
  precioporpieza
end;

procedure TFremisiones.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  premayoreo,totmayoreo:real;
begin
  if key = vk_f2 then
  BEGIN
    Lborrar.Caption:='NO';  // ventana de datos no borre encabezado
    fdatos.precio.ReadOnly:=TRUE;
    fdatos.Cantidad.Text:='1';
    fdatos.precio.Text:='';
    fdatos.eprodu.Clear;
    fdatos.Hint:='ALTA'; //BANDERA PARA MODIFICAR O AGREGAR PRODUCTOS A LA REMISION
    modulo.qryinventarioaux.Filtered:=FALSE;
    modulo.qryinventarioaux.Open('select * from inventario order by producto');modulo.qryinventarioaux.First;
    fdatos.CSurtir.Checked:=false;
    fdatos.Show;
    fdatos.cantidad.SetFocus;
    EXIT;
  END;


  if key = vk_f3 then
    guardar.Click;

  if key=vk_Delete then
    eliminar.Click;

  if key=vk_Add then //presionar "+"
  begin
    if modulo.qryremiaux2['surtir']<>null then //productos surtidos no se esta funcion
      exit;

    modulo.qryremiaux2.Edit;
    modulo.qryremiaux2['cantidad']:= inttostr(modulo.qryremiaux2['cantidad']+1);

    premayoreo:=preciomayoreo(modulo.qryremiaux2['cantidad']);
    totmayoreo:= premayoreo*modulo.qryremiaux2['cantidad'];
    modulo.qryremiaux2['precio']:=Format('%0:2f',[premayoreo]);
    modulo.qryremiaux2['total']:= Format('%0:2f',[totmayoreo]);

    modulo.qryremiaux2.Post;
  end;

  if key=vk_Subtract then //presionar "-"
  begin
    if modulo.qryremiaux2['surtir']<>null then //productos surtidos no se esta funcion
      exit;
    modulo.qryremiaux2.Edit;
    if modulo.qryremiaux2['cantidad']>1 then
      modulo.qryremiaux2['cantidad']:= inttostr(modulo.qryremiaux2['cantidad']-1);

    premayoreo:=preciomayoreo(modulo.qryremiaux2['cantidad']);
    totmayoreo:= premayoreo*modulo.qryremiaux2['cantidad'];
    modulo.qryremiaux2['precio']:=Format('%0:2f',[premayoreo]);
    modulo.qryremiaux2['total']:= Format('%0:2f',[totmayoreo]);

    modulo.qryremiaux2.Post;
  end;

  total('NO');


  //mostrar cuanto cuenta cada pieza
  precioporpieza;



end;

procedure TFremisiones.GuardarClick(Sender: TObject);
begin
    //activa todos los botones para imprimir, porque se desactivan despues de presionarlos para evitar duplicar folios
    fguardar.activar_botones;
    if freportenotas.Bandera.Caption='no' then //lo dejo invisible para las papelerias
    begin
      //fguardar.bnotas.visible:=false;
      //fguardar.Bnocomprobante.Visible:=false;
      //boton nota no aparece para las papelerias solo para ventas a credito
      //if Econdicion.Text = 'CREDITO' then
        //fguardar.bnotas.visible:=true;

      //las papelerias no hacen cotizaciones
      if Econdicion.Text = 'COTIZACION' then
      begin
        showmessage('No puedes realizar cotizaciones');
        exit;
      end;

    end;

    if Econdicion.Text = 'CREDITO' then
    BEGIN
      modulo.QryClientes.open('select * from clientes') ;
      if modulo.QryClientes.Locate('ID',LID.Caption,[]) then
      BEGIN
        if modulo.QryClientes['CREDITO'] <> 'ACTIVADO' then
        BEGIN
          showmessage('Este cliente no tiene permitido ventas a credito');
          exit;
        END;
      END
      ELSE
      BEGIN
        showmessage('Este cliente no tiene permitido ventas a credito');
        exit;
      END;

      if modulo.QryClientes['multicredito']='NO' then
      BEGIN
        modulo.QryListaremision.Open('select * from LISTA_REMISION where cliente ='+QUOTEDSTR(TRIM(ECLIENTE.Text))+' and condicion = '+ quotedstr('CREDITO')+' and estado = '+quotedstr('ACTIVO'));
        if modulo.QryListaremision.RecordCount>0 then
        begin
          showmessage('El cliente tiene credito pendiente, no se le puede dar uno nuevo');
          exit;

        end;
      END;


    END;



    //antes de mostrar cambio de precio a la presidencia ejecuto verificar_productos
    if not grupo_presidencia.Visible then
      if not verificar_productos then   //verifico que no hayan errores en los empaques
        exit;                           //ni en los precios de menudeo, mayoreo y productos surtidos


    edescuento.OnExit(sender);
    if modulo.qryremiaux2.RecordCount>0 then
    begin
      if TRIM(ECLIENTE.Text) ='' then
      begin
        ecliente.Text:='MOSTRADOR';EDOMICILIO.Caption:='.';
      end;
      fguardar.total.Caption:='$'+nota.Caption;
      fguardar.show;
    end;

end;

procedure TFremisiones.Label3DblClick(Sender: TObject);
begin
  edescuento.Enabled:=true;
end;

procedure TFremisiones.ModificarClick(Sender: TObject);
begin
  if modulo.qryremiaux2.RecordCount> 0 then
  begin
    Lborrar.Caption:='NO';  // ventana de datos no borre encabezado
    Fdatos.Cantidad.Text:=modulo.qryremiaux2['cantidad'];
    Fdatos.eprodu.Text:=modulo.qryremiaux2['producto'];
    Fdatos.precio.Text:=modulo.qryremiaux2['total']/modulo.qryremiaux2['cantidad'];
    fdatos.Hint:='MODIFICAR'; //BANDERA PARA MODIFICAR O AGREGAR PRODUCTOS A LA REMISION
    Fdatos.Show;
    Fdatos.cantidad.SetFocus;
  end;
end;

function TFremisiones.obtenerFolio: integer;
begin
  modulo.QrynumFolio.Close;
  modulo.QrynumFolio.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_REMISION');
  obtenerFolio:=1;
  if modulo.QrynumFolio['numfolio']<>null then
    obtenerFolio:= STRTOINT(modulo.QrynumFolio['numfolio'])
  else
  begin
    modulo.Qrylistaremisionresp.Open('select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_REMISION_RESP');
    if modulo.Qrylistaremisionresp['numfolio']<>null then
    begin
      obtenerFolio:= modulo.Qrylistaremisionresp['numfolio'];
    end;
  end;
end;

procedure TFremisiones.QryAuxAfterExecute(DataSet: TFDDataSet);
begin
  MODULO.Conector.Commit;
end;

procedure TFremisiones.ApplicationEvents1ActionExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  Reiniciar_tiempo;
end;

procedure TFremisiones.BaplicarClick(Sender: TObject);
var
  operacion:real;
begin
  modulo.qryremiaux2.First;
  if trim(edescuento.Text)='' then
    showmessage('No has escrito el aumento')
  else
   begin
    baplicar.Hint:='ADAN';//BANDERA PARA IMPRIMIR CON EL ENCABEZADO DE ADAN
    while (not modulo.qryremiaux2.Eof)  do
    begin
      modulo.qryremiaux2.Edit;
      operacion:=modulo.qryremiaux2['total']/modulo.qryremiaux2['cantidad'];
      modulo.qryremiaux2['precio']:=Format('%0:2f',[operacion]);
      modulo.qryremiaux2.Post;
      modulo.qryremiaux2.Next;

    end;
    guardar.Enabled:=true;
   end;
end;

end.
