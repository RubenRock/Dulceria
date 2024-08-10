unit Uproyecto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus, ppComm, ppDsgnDB, IdHTTP, Vcl.Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, json, idftp;

type
  TFPrincipal = class(TForm)
    Menu: TMainMenu;
    Remisiones1: TMenuItem;
    Nueva1: TMenuItem;
    Listaderemisiones1: TMenuItem;
    Pagos1: TMenuItem;
    Cortesdecaja1: TMenuItem;
    Inventario1: TMenuItem;
    Actualizarinventario1: TMenuItem;
    N1: TMenuItem;
    Recepciondemercancia1: TMenuItem;
    Usuarios1: TMenuItem;
    Agregar2: TMenuItem;
    Modificar2: TMenuItem;
    N2: TMenuItem;
    Asignaraccesos1: TMenuItem;
    Clientes1: TMenuItem;
    Actualizar2: TMenuItem;
    Proveedores1: TMenuItem;
    Actulizar1: TMenuItem;
    Devoluciones1: TMenuItem;
    Listadedevoluciones1: TMenuItem;
    Salidas1: TMenuItem;
    Acttualizar1: TMenuItem;
    Impresoras1: TMenuItem;
    Respaldar1: TMenuItem;
    Actualizar1: TMenuItem;
    Ajustes1: TMenuItem;
    logo: TImage;
    Panel: TPanel;
    Resumendeventas1: TMenuItem;
    Inventarioenlanube1: TMenuItem;
    Agentesdeventa1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Descargar1: TMenuItem;
    Subir1: TMenuItem;
    Pagaalrecibir1: TMenuItem;
    Creditos1: TMenuItem;
    Repartos1: TMenuItem;
    Agentesfirebase1: TMenuItem;
    IdTCPClient1: TIdTCPClient;
    SpeedButton1: TSpeedButton;
    N5: TMenuItem;
    Reimpresiones1: TMenuItem;
    raspadodemercancia1: TMenuItem;
    Retirodeefectivo1: TMenuItem;
    procedure Nueva1Click(Sender: TObject);
    procedure Actualizarinventario1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Recepciondemercancia1Click(Sender: TObject);
    procedure Listaderemisiones1Click(Sender: TObject);
    procedure Cortesdecaja1Click(Sender: TObject);
    procedure Listadedevoluciones1Click(Sender: TObject);
    procedure Agregar2Click(Sender: TObject);
    procedure Modificar2Click(Sender: TObject);
    procedure Asignaraccesos1Click(Sender: TObject);
    procedure Actualizar2Click(Sender: TObject);
    procedure Actulizar1Click(Sender: TObject);
    procedure Acttualizar1Click(Sender: TObject);
    procedure Ajustes1Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure Resumendeventas1Click(Sender: TObject);
    function checar_fecha_actualizacion:Boolean;
    procedure Agentesdeventa1Click(Sender: TObject);
    procedure Descargar1Click(Sender: TObject);
    procedure Subir1Click(Sender: TObject);
    procedure Pagaalrecibir1Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure Repartos1Click(Sender: TObject);
    procedure Agentesfirebase1Click(Sender: TObject);
    function internet:boolean;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Reimpresiones1Click(Sender: TObject);
    procedure Impresoras1Click(Sender: TObject);
    procedure raspadodemercancia1Click(Sender: TObject);
    procedure Retirodeefectivo1Click(Sender: TObject);
    function checarFechaFtp:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses Uremisiones, Uinventario, Umodulo, UListaRecepcion, UlistaRemision, Upagos,
  UCortes, Ulistadevoluciones, Uusuariosalta, Uusuariosmodificar,
  Uusuariosacceso, UClientes, UProveedores, UlistaSalidas, UVerificarUsuario,
  UExtras, Urespaldo, Ureportenotas, Uimpresoras, Uresumenventas,
  Uinventario_nube, Uagentes, Urepartos, Usubir_nube, Upago_creditos,
  Uagentesfirebase, Ureportetiquet, Ureportecortecaja, UreporteRecepcion,
  ureportenotascarta, Ureportetiquet58, UReporteAbonos58, Ureportecortecaja58,
  UreporteRecepcion58, UmoduloAPI, UReimpresiones, UretiroEfectivo;


function TFPrincipal.internet: boolean;
begin
  try
    IdTCPClient1.ReadTimeout:=2000;
    IdTCPClient1.ConnectTimeout:=2000;
    IdTCPClient1.Port:=80;
    IdTCPClient1.Host:= 'google.com';
    IdTCPClient1.Connect;
    IdTCPClient1.Disconnect;
    Result:= true;
  except
    result := false
  end;



end;

function TFPrincipal.checarFechaFtp: Boolean;
  var
    direccionFechaWeb,fechaWeb:string;
    pag_web: TIdHTTP;
    fechaLocal: TStringList;
begin
  modulo.QryExtras.Open('select * from extras');

  fechaLocal := TStringList.Create;
  fechaLocal.LoadFromFile(modulo.QryExtras['direc_fecha']);


  direccionFechaWeb:=modulo.QryExtras['fecha'];

  pag_web := TIdHTTP.Create(nil);
  try
    fechaWeb := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+direccionFechaWeb);
    pag_web.Free;
  except
    showmessage('Hay problemas con la conexion a internet');
    exit;
  end;

  //showmessage('fecha local: '+fechaLocal.Text+'     fecha web: '+fechaWeb);
  if trim(fechaLocal.Text)<> trim(fechaweb) then
  begin
    checarFechaFtp:=false;
    showmessage('Hay una actualizacion pendiente');
  end
  else
    checarFechaFtp:=true;
end;

function TFPrincipal.checar_fecha_actualizacion;
var
  ultima_actualizacion: TStringList;
  fecha_pag_web, fecha_local: tdatetime;
  pag_web: TIdHTTP;

  s, fecha, nfecha, jsonText,smfecha:string;
  JSOValue: TJSONValue;
begin
  modulo.QryExtras.Open('select * from extras');
  ultima_actualizacion := TStringList.Create;

  fecha:=modulo.QryExtras['direc_fecha']; //local
  smfecha:=modulo.QryExtras['fecha'];     //web
  ultima_actualizacion.LoadFromFile(fecha);


  pag_web := TIdHTTP.Create(nil);
  try
    s := pag_web.Get('http://mysilver.webcindario.com/Tiendas/'+smfecha);
    pag_web.Free;

    if trim(ultima_actualizacion.Text) = trim(S) then
      Result := true
    ELSE
    begin
      showmessage('Existe una actualizacion pendiente, primero debes actualizar el inventario');
      Result := false;
    end;
  except
    Result := true
  end;


end;

procedure TFPrincipal.Acttualizar1Click(Sender: TObject);
begin
  modulo.QrySalidas.Open('select * from salidas order by folio desc ROWS 30');
  flistasalidas.Ebuscar.Clear;
  fverificausu.ShowModal;
  if fverificausu.verificar('remiagregar')then
    flistasalidas.ShowModal;
end;

procedure TFPrincipal.Actualizar1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('exrespaldar')then
  begin
      modulo.Qrylistaremisionresp.Open('select * from lista_remision_resp order by folio desc rows 50');
      frespaldo.ShowModal;
  end;
end;

procedure TFPrincipal.Actualizar2Click(Sender: TObject);
begin
  modulo.QryClientes.Open('select (CLIENTES.NOMBRE|| '+QUOTEDSTR(' ')+ ' ||CLIENTES.APELLIDOS)AS NOM_COM, NOMBRE, APELLIDOS,DIRECCION , TELEFONO, EMAIL, CREDITO, MULTICREDITO, ID from CLIENTES order by nombre');
  fclientes.ShowModal;
end;

procedure TFPrincipal.Actualizarinventario1Click(Sender: TObject);
begin
  //se debe tener la ultima actualizacion para poder actualizar inventario
  if modulo.QryExtras['verificar_fecha']=1 then
    if not  checarFechaFtp then
      exit;

  fverificausu.ShowModal;
  if fverificausu.verificar('invevisualizar')then
  begin
    modulo.qryinventario.Open('select * from inventario order by producto');
    finventario.ShowModal;
  end;
end;

procedure TFPrincipal.Actulizar1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('provvisualizar')then
  begin
    modulo.Qryproveedores.Open('select * from proveedores order by nombre');
    fproveedores.Panel1.Enabled:=true;
    fproveedores.ShowModal;
  end;
end;

procedure TFPrincipal.Agentesdeventa1Click(Sender: TObject);
begin
  fagentes.showmodal;
end;

procedure TFPrincipal.Agentesfirebase1Click(Sender: TObject);
begin
    FAgentesMongo.ShowModal;
end;

procedure TFPrincipal.Agregar2Click(Sender: TObject);
begin
  fusuariosalta.ShowModal;
end;

procedure TFPrincipal.Ajustes1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('exajustes')then
  begin
      fextras.ShowModal;
  end;
end;

procedure TFPrincipal.Asignaraccesos1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('usuavisualizar') then
    fusuariosaccesos.ShowModal;
end;

procedure TFPrincipal.Cortesdecaja1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('cortes')then
    fcortes.ShowModal;
end;

procedure TFPrincipal.Creditos1Click(Sender: TObject);
begin
  modulo.QrylistaPagos.Filtered:=false;
  modulo.QrylistaPagos.Open('select FOLIO,CLIENTE,TOTAL,VENDEDOR,FECHA,DOMICILIO,CONDICION,ESTADO,FECHA+15 AS FECHA2 from lista_REMISION where (CONDICION='+quotedstr('CREDITO')+' and (ESTADO <>'+quotedstr('PAGADO')+')) ORDER BY FOLIO ');
  Fpago_creditos.Ebuscar.Clear;
  Fpago_creditos.ShowModal;
end;

procedure TFPrincipal.Descargar1Click(Sender: TObject);
begin
  if internet then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('invenube')then
    begin
      finventario_nube.showmodal;
    end;
  end
  else
    showmessage('No tienes conexion a internet')
end;

procedure TFPrincipal.FormActivate(Sender: TObject);
var
  texto1,texto2, texto3: TStringList;
begin
  texto1 := TStringList.Create;
  texto2 := TStringList.Create;
  //texto3 := TStringList.Create;

  texto1.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'BD.txt');
  texto2.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'BDaccess.txt');
  //texto3.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'BDrespaldo.txt');

  modulo.fbdriver.VendorHome:= ExtractFilePath(Application.GetNamePath)+'dll\';
  modulo.FBDriver.VendorLib:= 'fbclient.dll';
  modulo.Conector.Params.Database:=texto1.Text;
  modulo.Conector.Connected:=true;

  //modulo.respaldo.Params.Database:=texto3.Text;
  //modulo.respaldo.Connected:=true;

  modulo.Conector2.Params.Database:=texto2.Text;

  //texto1.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'imagen.txt');
  logo.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');


  //la imagen de las notas sera igual a la imagen del menu principal
  freportenotas.IMAGEN.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportenotas.IMAGEN2.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportenotascarta.IMAGEN.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportenotascarta.IMAGEN2.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');

  freportetiquet.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportetiquet58.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportecortecaja.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freportecortecaja58.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freporterecepcion.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  freporteabonos58.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');
  FreporteRecepcion58.ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'logo.jpg');


  modulo.qryinventario.Active:=true;
  modulo.qryremiaux2.Active:=true;
  modulo.QryUsuarios.Open('select * from usuarios order by login');

  modulo.QryExtras.Open('select * from extras');




  if modulo.QryExtras['version']<>'11.09.2023' then
  begin
    showmessage('Estas usando una version diferente a la actual, no puedes usar el sistema');
    close;
  end;

  //SI ACTIVO LA 2DA CAJA, NO SE DEBE HACER RETIROS DE EFECTIVO
  //Retirodeefectivo1.Enabled:=NOT(modulo.QryExtras['segundacaja']='1'); //true




  //**** verificar si hay actualizaciones de inventario pendientes


end;



procedure TFPrincipal.Impresoras1Click(Sender: TObject);
begin
  fimpresora.ShowModal;
end;

procedure TFPrincipal.Listadedevoluciones1Click(Sender: TObject);
begin
  modulo.QryDevoluciones.Open('select folio, cliente, cantidad, empaque ||'+quotedstr(' ')+' ||producto AS producto2, producto, total, fecha, usuario from devoluciones order by fecha desc ROWS 50');
  Flistadevoluciones.ShowModal;
end;

procedure TFPrincipal.Listaderemisiones1Click(Sender: TObject);
var
  paginacion,registros,total:integer;
begin
  paginacion:=50;
  modulo.QryListaremision.Open('select count(folio) as registros from lista_remision');
  registros:=modulo.QryListaremision['registros'];
  total:= registros div paginacion;
  if (registros mod paginacion)>0  then
    total:=total+1;
  flistaremision.Tregistros.Caption:=inttostr(total);
  flistaremision.Eregistros.Text:='1';
  flistaremision.Ebuscar.Clear;
  modulo.QryListaremision.Open('select * from lista_remision order by folio desc rows 1 to '+inttostr(paginacion));
  flistaremision.ShowModal

end;

procedure TFPrincipal.Modificar2Click(Sender: TObject);
begin
  fusuariosmodificar.ShowModal;
end;

procedure TFPrincipal.Nueva1Click(Sender: TObject);
begin
  if modulo.QryExtras['verificar_fecha']=1 then
    if internet then // verifica si hay conexion a intenet
      if not checarFechaFtp then  // avisa si falta actualizar el inventario
        exit;


  fverificausu.ShowModal;
  if fverificausu.verificar('remiagregar')then
  BEGIN
    fremisiones.Ltraspasos.Caption:='NO';//bandera que indica si se realiza traspaso entre tiendas
    fremisiones.Lborrar.Caption:='SI';
    fremisiones.showmodal;
  END;
end;

procedure TFPrincipal.Pagaalrecibir1Click(Sender: TObject);
begin
  modulo.QrylistaPagos.Filtered:=false;
  modulo.QrylistaPagos.Open('select * from lista_REMISION where (CONDICION='+quotedstr('PAGA AL RECIBIR')+' and (ESTADO <>'+quotedstr('PAGADO')+')) ORDER BY FOLIO DESC ');
  Fpagos.Ebuscar.Clear;
  Fpagos.ShowModal;
end;

procedure TFPrincipal.raspadodemercancia1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remiagregar')then
  BEGIN
    fremisiones.Ltraspasos.Caption:='SI';//bandera que indica si se realiza traspaso entre tiendas
    fremisiones.Lborrar.Caption:='SI';
    Fremisiones.ShowModal;
  END;
end;

procedure TFPrincipal.Recepciondemercancia1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('recevisualizar')then
    flistarecepcion.ShowModal;
end;

procedure TFPrincipal.Reimpresiones1Click(Sender: TObject);
begin
  FReimpresiones.Efolioini.Clear;FReimpresiones.Efoliofin.Clear;
  FReimpresiones.Combo.ItemIndex:=0;
  freimpresiones.ShowModal;
end;

procedure TFPrincipal.Repartos1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('repartos') then
  begin
    FLista_repartos.RPENDIENTES.Checked:=TRUE;
    modulo.QryLista_reparto.Open('select * from lista_reparto where estado <> '+quotedstr('PAGADO')+' order by fecha desc');
    FLista_repartos.showmodal;
  end;
end;

procedure TFPrincipal.Resumendeventas1Click(Sender: TObject);
begin
  fresumenventas.fechaini.Date:=date;
  fresumenventas.fechafin.Date:=date;
  fresumenventas.ShowModal;
  fresumenventas.Memo1.Clear;
end;

procedure TFPrincipal.Retirodeefectivo1Click(Sender: TObject);
begin
  fverificausu.ShowModal;
  if fverificausu.verificar('remiagregar')then
  BEGIN
    Fretiroefectivo.Ltotal.Caption:='0';
    Fretiroefectivo.LtotalVisible.Caption:='0';
    Fretiroefectivo.ShowModal;
  END;

end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
var
  segunda_caja:boolean;
begin
  {if internet then
    showmessage('hay conexion')
  else
    showmessage('No hay conexion')   }

  segunda_caja:= modulo.QryExtras['segundacaja']='1';

  if segunda_caja then
    showmessage('si')
  else
    showmessage('no');

end;

procedure TFPrincipal.Subir1Click(Sender: TObject);
begin
  if modulo.QryExtras['verificar_fecha']=1 then
    if not checarFechaFtp then  // avisa si falta actualizar el inventario
      exit;


  fverificausu.ShowModal;
  if fverificausu.verificar('invesubir')then
  begin
    fsubir_nube.showmodal;
  end;



 
end;

end.
