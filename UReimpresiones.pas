unit UReimpresiones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFReimpresiones = class(TForm)
    Efolioini: TEdit;
    Efoliofin: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Combo: TComboBox;
    Label3: TLabel;
    imprimir: TSpeedButton;
    QryAux: TFDQuery;
    Qryremisiones: TFDQuery;
    Qrylista_remision: TFDQuery;
    procedure imprimirClick(Sender: TObject);
    procedure ejecutarSQL(sentencia: string);
    procedure llenar_remisionaux;
    procedure imprimir_tiquet;
    procedure FormActivate(Sender: TObject);
    procedure QryAuxAfterExecute(DataSet: TFDDataSet);
    procedure verificarNotas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReimpresiones: TFReimpresiones;
  bandera:boolean;

implementation

{$R *.dfm}

uses Umodulo, Ureportetiquet;

procedure TFReimpresiones.ejecutarSQL(sentencia: string);
begin
  qryaux.SQL.Clear;
  qryaux.SQL.Add(sentencia);
  qryaux.ExecSQL;
end;

procedure TFReimpresiones.FormActivate(Sender: TObject);
begin
  efolioini.SetFocus;
end;

procedure TFReimpresiones.imprimirClick(Sender: TObject);
var
  inicio, fin:integer;
begin
  inicio:=strtoint(trim(efolioini.Text));fin:=strtoint(trim(efoliofin.Text));

  if (fin-inicio) > 20 then
  begin
    showmessage('No puedes reimprimir mas de 20 notas');
    exit;
  end;

  if fin<inicio then
  begin
    showmessage('folios incorrectos');
    exit;
  end
  else
  begin

    ejecutarSQL('delete from lista_remision_reimpresion');
    ejecutarSQL('delete from remisiones_reimpresion');
    ejecutarSQL('INSERT INTO LISTA_REMISION_REIMPRESION SELECT * FROM LISTA_REMISION WHERE FOLIO >= '+inttostr(inicio)+ ' AND FOLIO <='+inttostr(fin));
    ejecutarSQL('INSERT INTO REMISIONES_REIMPRESION SELECT * FROM REMISIONES WHERE TIPO <> '+QUOTEDSTR('FOLIO')+' and FOLIO >= '+inttostr(inicio)+ ' AND FOLIO <='+inttostr(fin));

    modulo.QryExtras.Open('select * from extras');
    modulo.Qryimpresora.Open('select * from impresora');

    verificarNotas;

    freportetiquet.reimpresion.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];
    freportetiquet.reimpresion_copia.PrinterSetup.PrinterName:=modulo.Qryimpresora['ticket'];

    if modulo.QryExtras['imprimir_en_pantalla']='1' then  //'1' si, '0' no
    begin
      freportetiquet.reimpresion.DeviceType:='Screen';
      freportetiquet.reimpresion_copia.DeviceType:='Screen';
    end
    else
    begin
      freportetiquet.reimpresion.DeviceType:='Printer';
      freportetiquet.reimpresion_copia.DeviceType:='Printer';
    end;

    if bandera then
      llenar_remisionaux;

  end;


end;

procedure TFReimpresiones.imprimir_tiquet;
begin
    freportetiquet.rerazon.Caption:=modulo.QryExtras['razon'];
    freportetiquet.rerfc.Caption:=modulo.QryExtras['rfc'];
    freportetiquet.redireccion.Caption:=modulo.QryExtras['direccion'];
    freportetiquet.retelefono.Caption:=modulo.QryExtras['telefono'];
    freportetiquet.reusuario.Caption:=QryLista_remision['vendedor'];
    freportetiquet.renombre.Caption:=modulo.QryExtras['nombre1']+' '+modulo.QryExtras['nombre2'];;
    freportetiquet.recliente.Caption:=QryLista_remision['cliente'];
    freportetiquet.refecha.Caption:=QryLista_remision['fecha'];
    freportetiquet.refolio.Caption:=QryLista_remision['Folio'];
    freportetiquet.reTOTAL.Caption:=QryLista_remision['total'];
    freportetiquet.REDOMICILIO.Caption:=QryLista_remision['domicilio'];
    freportetiquet.reCONDICION.Caption:=QryLista_remision['condicion'];

    //LLENADO DE COPIA
    freportetiquet.rerazon2.Caption:=modulo.QryExtras['razon'];
    freportetiquet.refecha2.Caption:=QryLista_remision['fecha'];
    freportetiquet.refolio2.Caption:=QryLista_remision['Folio'];
    freportetiquet.recliente2.Caption:=QryLista_remision['cliente'];
    freportetiquet.reTOTAL2.Caption:=QryLista_remision['total'];
    freportetiquet.REDOMICILIO2.Caption:=QryLista_remision['domicilio'];
    freportetiquet.reCONDICION2.Caption:=QryLista_remision['condicion'];
    freportetiquet.reusuario2.Caption:=QryLista_remision['vendedor'];




    try
      freportetiquet.reimpresion.Print;
      freportetiquet.reimpresion_copia.Print;
    except
      showmessage('Hay error con la impresora');
    end;



end;

procedure TFReimpresiones.llenar_remisionaux;
VAR
  pre:real;
begin
  modulo.qryinventarioaux.Open('select * from inventario');
  modulo.qryborraremiaux.ExecSQL;
  modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;

  Qrylista_remision.Open('select * from lista_remision_reimpresion order by folio');
  Qrylista_remision.Last;Qrylista_remision.First;

  while not Qrylista_remision.Eof do
  begin
      Qryremisiones.Open('select * from remisiones_reimpresion where folio = '+inttostr(Qrylista_remision['folio']));
      Qryremisiones.First;

      while not Qryremisiones.Eof do
      begin
          modulo.qryremiaux2.Append;
          modulo.qryremiaux2['empaque']:=Qryremisiones['empaque'];
          modulo.qryremiaux2['producto']:=Qryremisiones['producto'];

            //agregar doble espacio si es producto surtido
          if strtofloat(QryRemisiones['total'])>0then
            modulo.qryremiaux2['producto2']:=Qryremisiones['empaque']+' '+Qryremisiones['producto']
          else
            modulo.qryremiaux2['producto2']:='      '+Qryremisiones['empaque']+' '+Qryremisiones['producto'];

            if modulo.qryinventarioaux.Locate('producto',Qryremisiones['producto'],[])then
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
              modulo.QryListaSimilar.Open('select * from lista_similar where descripcion = '+quotedstr(QryRemisiones['producto']));

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

            modulo.Qryremiaux2['cantidad']:=Qryremisiones['cantidad'];
            modulo.Qryremiaux2['clave']:=Qryremisiones['producto'];
            modulo.Qryremiaux2['total']:=Qryremisiones['total'];
            modulo.Qryremiaux2['descuento']:=Qryremisiones['descuento'];
            modulo.Qryremiaux2['tipo']:=qryremisiones['tipo'];
            pre:=Qryremisiones['total']/Qryremisiones['cantidad'];
            modulo.Qryremiaux2['precio']:=Format('%0:2f',[pre]);
            modulo.Qryremiaux2.Post;
            QryRemisiones.Next;

      end;

      if combo.ItemIndex = 0 then //tiquets
      begin
        imprimir_tiquet;;
      end;

      Qrylista_remision.Next;

      modulo.qryborraremiaux.ExecSQL;
      modulo.qryremiaux2.Close;modulo.qryremiaux2.Open;
  end;




end;

procedure TFReimpresiones.QryAuxAfterExecute(DataSet: TFDDataSet);
begin
  modulo.Conector.Commit;
end;

procedure TFReimpresiones.verificarNotas;
var
  suma: real;
begin
  bandera:=true;
  Qrylista_remision.Open('select * from lista_remision_reimpresion order by folio');
  Qrylista_remision.Last;Qrylista_remision.First;

  while not Qrylista_remision.Eof do
  begin
      suma:=0;
      Qryremisiones.Open('select * from remisiones_reimpresion where folio = '+inttostr(Qrylista_remision['folio']));
      Qryremisiones.First;

      while not Qryremisiones.Eof do
      begin
        suma:=suma+ Qryremisiones['total'];
        Qryremisiones.Next
      end;

      if (strtofloat(Qrylista_remision['total'])<>suma) then
      begin
        bandera:=false; // no va a permitir imprimir el tiquet
        showmessage('Hay error en la nota '+quotedstr(Qrylista_remision['folio'])+' de: '+Qrylista_remision['cliente']+#13#10 +
                    'suma remision: '+floattostr(suma)+'  total de la nota '+floattostr(Qrylista_remision['total']));
      end;
      Qrylista_remision.Next;

  end;


end;

end.
