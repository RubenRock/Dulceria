unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFclientes = class(TForm)
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
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Enombre: TEdit;
    Edireccion: TEdit;
    Etelefono: TEdit;
    Email: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Ebuscar: TEdit;
    grid: TDBGrid;
    Label3: TLabel;
    Eapellidos: TEdit;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Cmulticredito: TCheckBox;
    BAsignar: TSpeedButton;
    Label8: TLabel;
    Label10: TLabel;
    Lnombre_anterior: TLabel;
    Lapellido_anterior: TLabel;
    QryAux: TFDQuery;
    Lid: TLabel;
    Bhistorial: TSpeedButton;
    Label11: TLabel;
    LCLIENTES: TLabel;
    SpeedButton2: TSpeedButton;
    procedure Activar;
    procedure Desactivar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgregarClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure EbuscarChange(Sender: TObject);
    procedure BAsignarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnombreChange(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BhistorialClick(Sender: TObject);
    PROCEDURE total_clientes;
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fclientes: TFclientes;
  alta:boolean;

implementation

{$R *.dfm}

uses Umodulo, Uremisiones, UVerificarUsuario, UClientes_historial,
  Uagentesfirebase;

procedure TFclientes.total_clientes;
begin
  //QRYAUX.SQL.Clear;
  QRYAUX.Open('SELECT count(ID) AS NUMERO FROM CLIENTES');
  //QRYAUX.ExecSQL;

  LCLIENTES.Caption:=QRYAUX['NUMERO'];
end;

procedure TFclientes.Activar;
begin
  agregar.Visible:=true;guardar.Visible:=false;
  modificar.Visible:=true;eliminar.Visible:=true;
  cancelar.Visible:=false;panel.Enabled:=false;
  enombre.Clear;edireccion.Clear;eapellidos.Clear;
  etelefono.Clear;email.Clear;cmulticredito.Checked:=false;
end;

procedure TFclientes.Desactivar;
begin
  agregar.Visible:=false;guardar.Visible:=true;
  modificar.Visible:=false;eliminar.Visible:=false;
  cancelar.Visible:=true;

end;

procedure TFclientes.EbuscarChange(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
  if EBUSCAR.Text='' then
    MODULO.QryClientes.Filtered:=FALSE
  ELSE
  BEGIN
    modulo.QryClientes.Filter:= 'NOM_COM LIKE '+quotedstr('%'+ ebuscar.Text +'%');
    MODULO.QryClientes.Filtered:=TRUE;
  END;

    //modulo.QryClientes.open('select * FROM CLIENTES WHERE (CLIENTES.NOMBRE|| '+QUOTEDSTR(' ')+ ' ||CLIENTES.APELLIDOS) LIKE '+quotedstr('%'+ ebuscar.Text +'%')+' ORDER BY NOMBRE');

end;

procedure TFclientes.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_ESCAPE then
    EBUSCAR.Clear;
end;

procedure TFclientes.EliminarClick(Sender: TObject);
begin
  if modulo.QryClientes.RecordCount>0 then
    modulo.QryClientes.Delete;
  total_clientes;
end;

procedure TFclientes.EnombreChange(Sender: TObject);
begin
  fremisiones.Reiniciar_tiempo;
end;

procedure TFclientes.AgregarClick(Sender: TObject);
begin
  ebuscar.Clear;
  alta:=true;desactivar;
  panel.Enabled:=true;
  enombre.SetFocus;enombre.ReadOnly:=false;
end;

procedure TFclientes.BAsignarClick(Sender: TObject);
begin
  if modulo.QryClientes.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('clieasignar') then
    begin
      modulo.QryClientes.Edit;
      modulo.QryClientes['credito']:='ACTIVADO';
      if cmulticredito.Checked then
        modulo.QryClientes['multicredito']:='SI'
      else
        modulo.QryClientes['multicredito']:='NO';
      modulo.QryClientes.Post;
      modulo.QryClientes.Close;modulo.QryClientes.Open();
      cmulticredito.Checked:=FALSE;
    end;
  end;
end;

procedure TFclientes.BhistorialClick(Sender: TObject);
begin
  fclientes_historial.ShowModal;
end;

procedure TFclientes.CancelarClick(Sender: TObject);
begin
  panel.Enabled:=false;activar;
  modulo.QryClientes.Cancel;ebuscar.Clear;
end;

procedure TFclientes.FormActivate(Sender: TObject);
begin
  activar;ebuscar.SetFocus;
  total_clientes;
end;

procedure TFclientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cancelar.Click;
  MODULO.QryClientes.Filtered:=FALSE;
end;

procedure TFclientes.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fremisiones.Reiniciar_tiempo;
  if modulo.QryClientes.RecordCount > 0 then
    if key = vk_return then
    begin
      IF modulo.QryClientes['APELLIDOS']='.' THEN
        fremisiones.Ecliente.Text:=modulo.QryClientes['nombre']
      ELSE
        fremisiones.Ecliente.Text:=modulo.QryClientes['nombre']+' '+modulo.QryClientes['APELLIDOS'] ;
      fremisiones.Edomicilio.Caption:=modulo.QryClientes['direccion'];
      fremisiones.Lid.Caption:=modulo.QryClientes['ID'];
      close;
    end;

  if key = vk_delete then
    eliminar.Click;
end;

procedure TFclientes.GuardarClick(Sender: TObject);
begin
  modulo.QryClientes.Open('select (CLIENTES.NOMBRE|| '+QUOTEDSTR(' ')+ ' ||CLIENTES.APELLIDOS)AS NOM_COM, NOMBRE, APELLIDOS,DIRECCION , TELEFONO, EMAIL, CREDITO, MULTICREDITO, ID from CLIENTES');


  if trim(email.Text)='' then email.Text:='CONOCIDO';
  if trim(edireccion.Text)=''then edireccion.Text:='CONOCIDO';

  if ((trim(enombre.Text)<>'')and(trim(eApellidos.Text)<>'')and(trim(etelefono.Text)<>''))then
  begin
    if alta then
    begin
      if (not (modulo.QryClientes.Locate('nombre;apellidos',VarArrayOf([trim(enombre.Text),trim(eapellidos.Text)]),[]))) then
      begin
        modulo.QryClientes.Append;
        modulo.QryClientes['ID']:=trim(enombre.Text)+trim(eApellidos.Text);
      end
      else
      begin
        showmessage('El cliente ya existe');
        exit;
      end;
    end
    else
    begin
      qryaux.Open('select * from clientes where nombre = '+quotedstr(trim(enombre.Text))+' and apellidos = '+quotedstr(trim(eapellidos.Text))+' AND ID <> '+quotedstr(LID.Caption));
      QRYAUX.Last;
      if QRYAUX.RecordCount>0 then
      begin
        showmessage('Este cliente ya existe');
        exit;
      end;


      modulo.QryClientes.Locate('ID',LID.Caption,[]);
      modulo.QryClientes.Edit;
    end;

    modulo.QryClientes['nombre']:=trim(enombre.Text);
    modulo.QryClientes['credito']:='NO';
    modulo.QryClientes['multicredito']:='NO';
    modulo.QryClientes['apellidos']:=trim(eapellidos.Text);
    modulo.QryClientes['Direccion']:=trim(edireccion.Text);
    modulo.QryClientes['telefono']:=trim(etelefono.Text);
    modulo.QryClientes['email']:=trim(email.Text);
    modulo.QryClientes.Post;
    activar;

    modulo.QryClientes.Close;modulo.QryClientes.Open('select (CLIENTES.NOMBRE|| '+QUOTEDSTR(' ')+ ' ||CLIENTES.APELLIDOS)AS NOM_COM, NOMBRE, APELLIDOS,DIRECCION , TELEFONO, EMAIL, CREDITO, MULTICREDITO, ID from CLIENTES order by nombre');
  end
  else
    showmessage('Los datos estan incompletos');

  total_clientes;
end;

procedure TFclientes.ModificarClick(Sender: TObject);
begin
  if modulo.QryClientes.RecordCount>0 then
    begin
      panel.Enabled:=true;desactivar;
      alta:=false;
      LID.Caption:=MODULO.QryClientes['ID'];
      enombre.Text:=modulo.QryClientes['nombre'];
      lnombre_anterior.Caption:=modulo.QryClientes['nombre'];
      eapellidos.Text:='';
      lapellido_anterior.Caption:='';
      if modulo.QryClientes['apellidos']<>null then
      begin
        eapellidos.Text:=modulo.QryClientes['apellidos'];
        lapellido_anterior.Caption:=modulo.QryClientes['apellidos'];
      end;
      edireccion.Text:=modulo.QryClientes['direccion'];
      etelefono.Text:=modulo.QryClientes['telefono'];
      email.Text:=modulo.QryClientes['email'];
      enombre.SetFocus;
    end;
end;

procedure TFclientes.SpeedButton1Click(Sender: TObject);
begin
  if modulo.QryClientes.RecordCount>0 then
  begin
    fverificausu.ShowModal;
    if fverificausu.verificar('cliecancelar') then
    begin
      modulo.QryClientes.Edit;
      modulo.QryClientes['credito']:='NO';
      modulo.QryClientes['multicredito']:='NO';
      modulo.QryClientes.Post;
      modulo.QryClientes.Close;modulo.QryClientes.Open();
    end;
  end;
end;

procedure TFclientes.SpeedButton2Click(Sender: TObject);
begin
  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
  begin
      FAgentesMongo.post('https://vercel-api-eta.vercel.app/api/clientes',
            'select * from clientes ORDER BY nombre',
            'clientes');
  end;
end;

end.
