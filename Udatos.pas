unit Udatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFdatos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    precio: TEdit;
    eprodu: TEdit;
    Panel1: TPanel;
    Baceptar: TButton;
    Bcancelar: TButton;
    GRIDPRODUCTOS: TDBGrid;
    Sqlred: TFDQuery;
    Sqlred2: TFDQuery;
    CSurtir: TCheckBox;
    cantidad: TEdit;
    Label4: TLabel;
    LExistencias: TLabel;
    QryAux: TFDQuery;
    procedure BaceptarClick(Sender: TObject);
    procedure eproduChange(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure obtener_total;
    procedure seleccionar_producto;
    procedure GRIDPRODUCTOSKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eproduKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GRIDEMPAQUEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cantidadChange(Sender: TObject);
    procedure GRIDPRODUCTOSEnter(Sender: TObject);
    procedure GRIDPRODUCTOSExit(Sender: TObject);
    procedure verificar_similares(producto:string;empaque:string);
    procedure GRIDPRODUCTOSDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GRIDPRODUCTOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDEMPAQUEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDEMPAQUEMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure GRIDEMPAQUEMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GRIDPRODUCTOSMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure GRIDPRODUCTOSMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure CSurtirKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure seleccionar_producto_barras;
    procedure cantidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdatos: TFdatos;
  similares:integer;
  clave_similar:string;

implementation

{$R *.dfm}

uses Umodulo, Uremisiones, UVerificarUsuario, Uinventario, URecepciones,
  USurtir;

procedure TFdatos.verificar_similares(producto:string;empaque:string);
var
  clave_producto:string;
begin
  similares:=0;
  modulo.QrySimilar.Open('select * from similar');


  //VERIFICAMOS QUE EL PRODUCTO QUE VAMOS A METER ESTE EN LA LISTA DE SIMILARES
  sqlred2.Open('select * from similar, inventario, inventario_empaque where '+
                'inventario.PRODUCTO = '+QUOTEDSTR(PRODUCTO)+' AND '+
                'similar.PRODUCTO = inventario.CLAVE AND '+
                'inventario.CLAVE = inventario_empaque.CLAVE AND '+
                'inventario_empaque.EMPAQUE = '+QUOTEDSTR(empaque)+ ' AND '+
                'inventario_empaque.PIEZAS = 1');


  //si el producto esta en similares, obtenemos la clave de la tabla similar
  if sqlred2['clave']<>null then
  begin
      clave_similar:=sqlred2['clave'];
      inc(similares);
  end;

end;

procedure TFdatos.seleccionar_producto;
begin
  LEXISTENCIAS.Caption:='0';
  if modulo.qryinventarioaux.RecordCount>0 then
  begin
    modulo.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.qryinventarioaux['clave'])+' and empaque <> '+quotedstr('6')+' and empaque <> '+quotedstr('12'));
    if modulo.QryEmpaque.RecordCount>0 then
      obtener_total
    else
      precio.Text:='0.00';

  end
  else
  begin
    precio.Text:='0.00';
    modulo.QryEmpaque.Open('select * from inventario_empaque where 1 = 2');
  end;

end;

procedure TFdatos.seleccionar_producto_barras;
begin
  LEXISTENCIAS.Caption:='0';
  modulo.qryinventarioaux.Filtered:=false;
  modulo.qryinventarioaux.Locate('clave',sqlred['clave'],[]);
  modulo.QryEmpaque.open('select * from inventario_empaque where id ='+quotedstr(sqlred['id']));
  if modulo.qryinventarioaux.RecordCount>0 then
  begin
    if modulo.QryEmpaque.RecordCount>0 then
      obtener_total
    else
      precio.Text:='0.00';
  end
  else
  begin
    precio.Text:='0.00';
    modulo.QryEmpaque.Open('select * from inventario_empaque where 1 = 2');
  end;

end;

procedure TFdatos.obtener_total;
begin
  if trim(cantidad.Text)='' then
  BEGIN
    precio.Text:='0';
    exit;
  END;

  if modulo.qryinventarioaux.RecordCount>0 then
  begin

    if  modulo.QryExtras['manejar_inventario']=1 then
    begin
      qryaux.Open('SELECT * FROM INVENTARIO_AUX');
      IF qryaux.Locate('CLAVE',MODULO.qryinventarioaux['CLAVE'],[]) THEN
        LEXISTENCIAS.Caption:= INTTOSTR(qryaux['CANTIDAD'] DIV MODULO.QryEmpaque['PIEZAS'] );
    end;

    precio.Text:=modulo.qryinventarioaux['precio_uni'];

    if trim(cantidad.Text)='6' then
    begin
      if strtofloat(modulo.qryinventarioaux['precio_seis'])>0 then
        precio.Text:=floattostr(strtofloat(modulo.qryinventarioaux['precio_seis'])/6);
    end;

    if strtoint(trim(cantidad.Text)) mod 12 = 0 then
    begin
      finventario.QryEmpaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.qryinventarioaux['clave']));
       if strtofloat(modulo.qryinventarioaux['precio_doce'])>0 then
        precio.Text:=floattostr(strtofloat(modulo.qryinventarioaux['precio_doce'])/12);
    end;

  end
  else
    precio.Text:='0.00';
end;

procedure TFdatos.BaceptarClick(Sender: TObject);
var
  bclave:boolean;
  n,decimales:integer;
  entero:string;
  tot,pre:real;
begin


  entero:='';bclave:=false;decimales:=0;
  if modulo.qryinventarioaux.RecordCount>0 then
    bclave:=true;

  //proceso que uso para saber cuantos decimales tiene el precio
  entero:=trim(cantidad.Text);
  for n:=1 to length(precio.Text)do
  if precio.Text[n]='.' then
    decimales:=length(precio.Text)-n;

  if((strtofloat(precio.Text)>0)and(strtoint(entero)>0)and(bclave))then
  begin
      //if modulo.QryExtras['manejar_inventario']=1 then
        //Finventario.verificarInventario(modulo.qryinventarioaux['clave'],modulo.QryEmpaque['id'],strtoint(trim(cantidad.Text)));

       if Csurtir.Checked then
        if modulo.QrySimilar.Locate('producto',modulo.qryinventarioaux['clave'],[]) then
        begin

          modulo.QryListaSimilar.Locate('clave',modulo.QrySimilar['clave'],[]);
          fsurtir.Lclave.Caption:=modulo.qryinventarioaux['clave'];
          fsurtir.Lempaque.Caption:=modulo.QryEmpaque['empaque'];
          Fsurtir.Lproducto.Caption:=modulo.QryListaSimilar['descripcion'];
          fsurtir.Lpiezas.Caption:=inttostr(modulo.QryEmpaque['piezas']*strtoint(cantidad.Text));

          fsurtir.Liva.Caption:='0';
          if modulo.qryinventarioaux['iva']>0 then
            fsurtir.Liva.Caption:='16';
          if modulo.qryinventarioaux['ieps']>0 then
            fsurtir.Liva.Caption:='8';

          fsurtir.Lpiezas_agregadas.Caption:='0';
          Fsurtir.ShowModal;
          exit;
        end
        else
          showmessage('producto no se puede surtir');


        if HINT = 'MODIFICAR' then
          modulo.qryremiaux2.Edit
        ELSE
          modulo.qryremiaux2.Append;

        modulo.qryremiaux2['IVA']:=0;
        if modulo.qryinventarioaux['iva']>0 then
          modulo.qryremiaux2['IVA']:=16;
        if modulo.qryinventarioaux['ieps']>0 then
          modulo.qryremiaux2['IVA']:=8;
        pre:=strtofloat(precio.Text);
        tot:=strtofloat(precio.Text)*strtoint(entero);

        modulo.qryremiaux2['total']:=Format('%0:2f',[tot]);

        modulo.qryremiaux2['precio']:=Format('%0:2f',[pre]);
        modulo.qryremiaux2['cantidad']:=strtoint(entero);
        modulo.qryremiaux2['producto']:=modulo.qryinventarioaux['producto'];
        modulo.qryremiaux2['empaque']:=modulo.QryEmpaque['empaque'];
        modulo.qryremiaux2['clave_empaque']:=modulo.QryEmpaque['id'];
        modulo.qryremiaux2['producto2']:=modulo.QryEmpaque['empaque']+' '+modulo.qryinventarioaux['producto'];
        modulo.qryremiaux2['clave']:=modulo.qryinventarioaux['clave'];

        modulo.qryremiaux2.Post;



        fremisiones.total('NO');

        fremisiones.AgregarClick(sender);
        seleccionar_producto;
        csurtir.Checked:=false;

  end
  else
    showmessage('Datos incompletos');




end;

procedure TFdatos.BcancelarClick(Sender: TObject);
begin
  modulo.qryremiaux2.Cancel;
  eprodu.Clear;
  close;
end;

procedure TFdatos.cantidadChange(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
  obtener_total;
end;

procedure TFdatos.cantidadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
  begin
    //fverificausu.ShowModal;
      if fverificausu.verificar('remicambiar') then
        precio.ReadOnly:=false;
  end;

  if key = vk_return then
    baceptar.Click;
end;

procedure TFdatos.CSurtirKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  baceptar.Enabled:=true;
end;

procedure TFdatos.GRIDEMPAQUEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  baceptar.Enabled:=false;
end;

procedure TFdatos.GRIDEMPAQUEKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if (KEY = VK_UP)OR (KEY=VK_DOWN) OR (KEY=VK_TAB) then
    baceptar.Enabled:=true;
    obtener_total;
end;

procedure TFdatos.GRIDEMPAQUEMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  close;
  exit;
end;

procedure TFdatos.GRIDEMPAQUEMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  close;
end;

procedure TFdatos.GRIDPRODUCTOSDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  fremisiones.Reiniciar_tiempo;
  seleccionar_producto;
end;

procedure TFdatos.GRIDPRODUCTOSEnter(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=clWindowText;
  GRIDPRODUCTOS.Font.Size:=9;
end;

procedure TFdatos.GRIDPRODUCTOSExit(Sender: TObject);
begin
  GRIDPRODUCTOS.Font.Color:=cl3DDkShadow;
  GRIDPRODUCTOS.Font.Size:=9;
end;

procedure TFdatos.GRIDPRODUCTOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  baceptar.Enabled:=false;
end;

procedure TFdatos.GRIDPRODUCTOSKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  baceptar.Enabled:=true;
  fremisiones.Reiniciar_tiempo;
  obtener_total;


end;

procedure TFdatos.GRIDPRODUCTOSMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
 close;
end;

procedure TFdatos.GRIDPRODUCTOSMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
   close;
end;

procedure TFdatos.eproduChange(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
  sqlred.Open('select * from inventario_empaque where barras = '+quotedstr(trim(eprodu.Text)));
  if ((sqlred['clave']<>null) and (trim(eprodu.Text)<>'')) then
  begin
    seleccionar_producto_barras;
  end
  else
  begin
    modulo.qryinventarioaux.Filtered:=false;
    modulo.qryinventarioaux.Filter:='producto like '+quotedstr('%'+ eprodu.Text +'%');
    modulo.qryinventarioaux.Filtered:=true;

    if modulo.qryinventarioaux.RecordCount>0 then
      seleccionar_producto;

  end;
end;

procedure TFdatos.eproduKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ord(key)=40 then
    GRIDPRODUCTOS.SetFocus;
end;

procedure TFdatos.FormActivate(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
  seleccionar_producto;
  IF fdatos.Hint='MODIFICAR' THEN
  BEGIN
    modulo.QryEmpaque.Locate('empaque',modulo.qryremiaux2['empaque'],[]);
    obtener_total;
  END;

end;

end.
