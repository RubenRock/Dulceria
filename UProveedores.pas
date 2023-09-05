unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFproveedores = class(TForm)
    Panel1: TPanel;
    Guardar: TSpeedButton;
    Cancelar: TSpeedButton;
    PAgregar: TPanel;
    Agregar: TSpeedButton;
    PModificar: TPanel;
    Modificar: TSpeedButton;
    PEliminar: TPanel;
    Eliminar: TSpeedButton;
    Panel: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Enombre: TEdit;
    Edireccion: TEdit;
    Etelefono: TEdit;
    Erfc: TEdit;
    Email: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Ebuscar: TEdit;
    grid: TDBGrid;
    Sqlred: TFDQuery;
    procedure AgregarClick(Sender: TObject);
    procedure desactivar;
    procedure activar;
    procedure GuardarClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure EbuscarChange(Sender: TObject);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fproveedores: TFproveedores;
  alta:boolean;

implementation

{$R *.dfm}

uses Umodulo, URecepciones, UVerificarUsuario;

procedure TFProveedores.activar;
begin
  agregar.Visible:=true;guardar.Visible:=false;
  modificar.Visible:=true;eliminar.Visible:=true;
  cancelar.Visible:=false;panel.Enabled:=false;
  enombre.Clear;edireccion.Clear;
  etelefono.Clear;erfc.Clear;
  email.Clear;erfc.ReadOnly:=false;
end;

procedure TFProveedores.desactivar;
begin
  agregar.Visible:=false;guardar.Visible:=true;
  modificar.Visible:=false;eliminar.Visible:=false;
  cancelar.Visible:=true;
end;

procedure TFproveedores.EbuscarChange(Sender: TObject);
begin
  modulo.QryProveedores.Close;
  modulo.QryProveedores.Open('select * from Proveedores where nombre like '+quotedstr('%'+ ebuscar.Text +'%')+' order by nombre');
end;

procedure TFproveedores.EliminarClick(Sender: TObject);
begin
  if fverificausu.verificar('proveliminar') then
    if modulo.QryProveedores.RecordCount>0 then
        modulo.QryProveedores.Delete;
end;

procedure TFproveedores.FormActivate(Sender: TObject);
begin
  activar;ebuscar.SetFocus;
end;

procedure TFproveedores.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if modulo.Qryproveedores.RecordCount > 0 then
    if key = vk_return then
    begin
      frecepciones.Eproveedor.Text:=modulo.Qryproveedores['nombre'];
      close;
    end;

  if key = vk_delete then
    eliminar.Click;
end;

procedure TFproveedores.GuardarClick(Sender: TObject);
begin
  if trim(email.Text)='' then email.Text:='CONOCIDO';
  if trim(etelefono.Text)=''then etelefono.Text:='CONOCIDO';

  if ((trim(erfc.Text)<>'')and(trim(enombre.Text)<>'')and(trim(edireccion.Text)<>''))then
  begin
    modulo.Qryproveedores.Open('select * from proveedores');
    if alta then
    begin
      if ((not (modulo.QryProveedores.Locate('RFC',trim(erfc.Text),[]))) and (not (modulo.QryProveedores.Locate('nombre',trim(enombre.Text),[])))) then
      begin
        modulo.QryProveedores.Append;
        modulo.QryProveedores['rfc']:=trim(erfc.Text);
      end
      else
      begin
        showmessage('El proveedor ya existe');
        exit;
      end;
    end
    else
    begin
      Sqlred.Close;
      Sqlred.SQL.Clear;
      sqlred.SQL.Add('update LISTA_RECEPCION set proveedor = '+Quotedstr(trim(enombre.Text))+' WHERE proveedor = '+Quotedstr(modulo.QryProveedores['nombre']));
      sqlred.ExecSQL;

      modulo.QryProveedores.Locate('RFC',eRFC.Text,[]);
      modulo.QryProveedores.Edit;
    end;
    modulo.QryProveedores['Nombre']:=trim(enombre.Text);
    modulo.QryProveedores['Direccion']:=trim(edireccion.Text);
    modulo.QryProveedores['telefono']:=etelefono.Text;
    modulo.QryProveedores['email']:=trim(email.Text);
    modulo.QryProveedores.Post;
    modulo.Qryproveedores.Open('select * from proveedores order by nombre');
    activar;
  end
  else
    showmessage('Los datos estan incompletos');
end;

procedure TFproveedores.ModificarClick(Sender: TObject);
begin
  if fverificausu.verificar('provmodificar') then
    if modulo.QryProveedores.RecordCount>0 then
    begin
      panel.Enabled:=true;desactivar;
      alta:=false;
      enombre.Text:=modulo.QryProveedores['nombre'];
      edireccion.Text:=modulo.QryProveedores['direccion'];
      etelefono.Text:=modulo.QryProveedores['telefono'];
      erfc.Text:=modulo.QryProveedores['rfc'];
      email.Text:=modulo.QryProveedores['email'];
      enombre.SetFocus;erfc.ReadOnly:=true;
    end;
end;

procedure TFproveedores.AgregarClick(Sender: TObject);
begin
  if fverificausu.verificar('provagregar') then
  begin
    ebuscar.Clear;
    alta:=true;desactivar;
    panel.Enabled:=true;
    erfc.SetFocus;
  end;
end;

procedure TFproveedores.CancelarClick(Sender: TObject);
begin
  panel.Enabled:=false;activar;
  modulo.QryProveedores.Cancel;
end;

end.
