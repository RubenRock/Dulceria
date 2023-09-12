unit Uusuariosacceso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFusuariosaccesos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btodo: TSpeedButton;
    Bnada: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GroupBox9: TGroupBox;
    DeAgregar: TCheckBox;
    GroupBox1: TGroupBox;
    Ragregar: TCheckBox;
    Rmodificar: TCheckBox;
    Rcambiar: TCheckBox;
    GroupBox2: TGroupBox;
    ivisualizar: TCheckBox;
    Iagregar: TCheckBox;
    Imodificar: TCheckBox;
    Ieliminar: TCheckBox;
    GroupBox3: TGroupBox;
    Prvisualizar: TCheckBox;
    Pragregar: TCheckBox;
    Prmodificar: TCheckBox;
    Preliminar: TCheckBox;
    GroupBox4: TGroupBox;
    Uvisualizar: TCheckBox;
    Umodificar: TCheckBox;
    Ueliminar: TCheckBox;
    GroupBox5: TGroupBox;
    Revisualizar: TCheckBox;
    Reagregar: TCheckBox;
    Remodificar: TCheckBox;
    GroupBox6: TGroupBox;
    SaliAgregar: TCheckBox;
    SaliModificar: TCheckBox;
    GroupBox7: TGroupBox;
    Clieasignar: TCheckBox;
    Cliecancelar: TCheckBox;
    GroupBox8: TGroupBox;
    Abeliminar: TCheckBox;
    Lista: TDBLookupListBox;
    Agregar: TSpeedButton;
    Eliminar: TSpeedButton;
    Sqlred: TFDQuery;
    Raumentar: TCheckBox;
    INUBE: TCheckBox;
    GroupBox10: TGroupBox;
    Exrespaldar: TCheckBox;
    Exajustes: TCheckBox;
    GroupBox11: TGroupBox;
    Rrepartos: TCheckBox;
    ISUBIR: TCheckBox;
    DeEliminar: TCheckBox;
    CCajero: TCheckBox;
    GroupBox12: TGroupBox;
    Ccortes: TCheckBox;
    grupo_cancelar: TGroupBox;
    cancelar: TCheckBox;
    IEXISTENCIAS: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgregarClick(Sender: TObject);
    procedure seleccionados(login:string;acceso:string);
    procedure BnadaClick(Sender: TObject);
    procedure BtodoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListaClick(Sender: TObject);
    function localizar(buscar:String):boolean;
    procedure EliminarClick(Sender: TObject);
    function verificar_usuario:boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fusuariosaccesos: TFusuariosaccesos;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario;

function TFusuariosaccesos.localizar(buscar: string):boolean;
begin
  localizar:=false;
  if modulo.QryAccesos.Locate('login;acceso',VarArrayOf([lista.selecteditem,buscar]),[]) then
    localizar:=true;

end;

procedure TFusuariosaccesos.seleccionados(login: string; acceso: string);
begin
  modulo.QryAccesos.Append;
  modulo.QryAccesos['login']:=login;
  modulo.QryAccesos['Acceso']:=acceso;
  modulo.QryAccesos.Post;
end;

procedure TFusuariosaccesos.SpeedButton3Click(Sender: TObject);
begin
  ragregar.Checked:=true;
  rmodificar.Checked:=false;
  rcambiar.Checked:=false;
  ivisualizar.Checked:=true;
  iagregar.Checked:=true;
  imodificar.Checked:=true;
  ieliminar.Checked:=false;
  isubir.Checked:=false;
  inube.Checked:=false;
  prvisualizar.Checked:=false;
  pragregar.Checked:=false;
  prmodificar.Checked:=false;
  preliminar.Checked:=false;
  uvisualizar.Checked:=false;
  umodificar.Checked:=false;
  ueliminar.Checked:=false;
  revisualizar.Checked:=true;
  reagregar.Checked:=true;
  remodificar.Checked:=false;
  saliagregar.Checked:=true;
  salimodificar.Checked:=false;
  clieasignar.Checked:=false;
  cliecancelar.Checked:=false;
  abeliminar.Checked:=false;
  deagregar.Checked:=false;
  Exrespaldar.Checked:=false;
  Exajustes.Checked:=false;
  rrepartos.Checked:=false;
  ccajero.Checked:=false;
end;

function TFusuariosaccesos.verificar_usuario:boolean;
var
  contraseña:string;
begin
  contraseña:= trim(Fverificausu.txtcontra.Text);
  verificar_usuario:=false;
  if modulo.QryUsuarios.Locate('passwd',contraseña,[])then
  begin
    modulo.QryAccesos.Open('select * from accesos');
    if modulo.QryAccesos.Locate('login;acceso',VarArrayOf([modulo.QryUsuarios['Login'],'cancelar']),[]) then
      verificar_usuario:=true
  end
end;

procedure TFusuariosaccesos.AgregarClick(Sender: TObject);
begin
  if fverificausu.verificar('usuamodificar') then
  begin
      sqlred.SQL.Clear;
      sqlred.SQL.Add('delete from accesos where login ='+quotedstr(lista.SelectedItem));
      sqlred.ExecSQL;

      if ragregar.Checked then seleccionados(lista.SelectedItem,'remiagregar');
      if rmodificar.Checked then seleccionados(lista.SelectedItem,'remimodificar');
      if rcambiar.Checked then seleccionados(lista.SelectedItem,'remicambiar');
      if raumentar.Checked then seleccionados(lista.SelectedItem,'remiaumentar');
      if ivisualizar.Checked then seleccionados(lista.SelectedItem,'invevisualizar');
      if iagregar.Checked then seleccionados(lista.SelectedItem,'inveagregar');
      if imodificar.Checked then seleccionados(lista.SelectedItem,'invemodificar');
      if ieliminar.Checked then seleccionados(lista.SelectedItem,'inveeliminar');
      if inube.Checked then seleccionados(lista.SelectedItem,'invenube');
      if isubir.Checked then seleccionados(lista.SelectedItem,'invesubir');
      if IEXISTENCIAS.Checked then seleccionados(lista.SelectedItem,'iexistencias');
      if prvisualizar.Checked then seleccionados(lista.SelectedItem,'provvisualizar');
      if pragregar.Checked then seleccionados(lista.SelectedItem,'provagregar');
      if prmodificar.Checked then seleccionados(lista.SelectedItem,'provmodificar');
      if preliminar.Checked then seleccionados(lista.SelectedItem,'proveliminar');
      if uvisualizar.Checked then seleccionados(lista.SelectedItem,'usuavisualizar');
      if umodificar.Checked then seleccionados(lista.SelectedItem,'usuamodificar');
      if ueliminar.Checked then seleccionados(lista.SelectedItem,'usuaeliminar');
      if revisualizar.Checked then seleccionados(lista.SelectedItem,'recevisualizar');
      if reagregar.Checked then seleccionados(lista.SelectedItem,'receagregar');
      if remodificar.Checked then seleccionados(lista.SelectedItem,'recemodificar');
      if saliagregar.Checked then seleccionados(lista.SelectedItem,'saliagregar');
      if salimodificar.Checked then seleccionados(lista.SelectedItem,'salimodificar');
      if clieasignar.Checked then seleccionados(lista.SelectedItem,'clieasignar');
      if cliecancelar.Checked then seleccionados(lista.SelectedItem,'cliecancelar');
      if abeliminar.Checked then seleccionados(lista.SelectedItem,'abonoeliminar');
      if deagregar.Checked then seleccionados(lista.SelectedItem,'devoagregar');
      if deeliminar.Checked then seleccionados(lista.SelectedItem,'devoeliminar');
      if Exrespaldar.Checked then seleccionados(lista.SelectedItem,'exrespaldar');
      if Exajustes.Checked then seleccionados(lista.SelectedItem,'exajustes');
      if Rrepartos.Checked then seleccionados(lista.SelectedItem,'repartos');
      if CCajero.Checked then seleccionados(lista.SelectedItem,'cajero');
      if ccortes.Checked then seleccionados(lista.SelectedItem,'cortes');
      if cancelar.Checked then seleccionados(lista.SelectedItem,'cancelar');

      showmessage('Accesos asginados correctamente a: '+lista.SelectedItem);

      modulo.QryAccesos.Close;
      modulo.QryAccesos.Open;
      lista.OnClick(sender);
  end;
end;

procedure TFusuariosaccesos.BnadaClick(Sender: TObject);
begin
  ragregar.Checked:=false;
  rmodificar.Checked:=false;
  rcambiar.Checked:=false;
  raumentar.Checked:=false;
  ivisualizar.Checked:=false;
  iagregar.Checked:=false;
  imodificar.Checked:=false;
  ieliminar.Checked:=false;
  inube.Checked:=false;
  isubir.Checked:=false;
  IEXISTENCIAS.Checked := false;
  prvisualizar.Checked:=false;
  pragregar.Checked:=false;
  prmodificar.Checked:=false;
  preliminar.Checked:=false;
  uvisualizar.Checked:=false;
  umodificar.Checked:=false;
  ueliminar.Checked:=false;
  revisualizar.Checked:=false;
  reagregar.Checked:=false;
  remodificar.Checked:=false;
  saliagregar.Checked:=false;
  salimodificar.Checked:=false;
  clieasignar.Checked:=false;
  cliecancelar.Checked:=false;
  abeliminar.Checked:=false;
  deagregar.Checked:=false;
  deeliminar.Checked:=false;
  Exrespaldar.Checked:=false;
  Exajustes.Checked:=false;
  rrepartos.Checked:=false;
  ccajero.Checked:=false;
  CCORTES.Checked:=FALSE;
  cancelar.Checked:=false;
end;

procedure TFusuariosaccesos.BtodoClick(Sender: TObject);
begin
  ragregar.Checked:=true;
  rmodificar.Checked:=true;
  rcambiar.Checked:=true;
  raumentar.Checked:=true;
  ivisualizar.Checked:=true;
  iagregar.Checked:=true;
  imodificar.Checked:=true;
  ieliminar.Checked:=true;
  inube.Checked:=true;
  isubir.Checked:=true;
  IEXISTENCIAS.Checked := TRUE;
  prvisualizar.Checked:=true;
  pragregar.Checked:=true;
  prmodificar.Checked:=true;
  preliminar.Checked:=true;
  uvisualizar.Checked:=true;
  umodificar.Checked:=true;
  ueliminar.Checked:=true;
  revisualizar.Checked:=true;
  reagregar.Checked:=true;
  remodificar.Checked:=true;
  saliagregar.Checked:=true;
  salimodificar.Checked:=true;
  clieasignar.Checked:=true;
  cliecancelar.Checked:=true;
  abeliminar.Checked:=true;
  deagregar.Checked:=true;
  deeliminar.Checked:=true;
  Exrespaldar.Checked:=true;
  Exajustes.Checked:=true;
  rrepartos.Checked:=true;
  ccajero.Checked:=true;
  CCORTES.Checked:=TRUE;
end;

procedure TFusuariosaccesos.EliminarClick(Sender: TObject);
begin
  if fverificausu.verificar('usuaeliminar') then
    if MessageDlg('¿Deseas borrar del sistema a '+lista.SelectedItem+'?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
            sqlred.SQL.Clear;
            sqlred.SQL.Add('delete from accesos where login ='+quotedstr(lista.SelectedItem));
            sqlred.ExecSQL;
            sqlred.SQL.Clear;
            sqlred.SQL.Add('delete from usuarios where login ='+quotedstr(lista.SelectedItem));
            sqlred.ExecSQL;
            modulo.QryUsuarios.Close;modulo.QryUsuarios.Open;


    end;


end;

procedure TFusuariosaccesos.FormActivate(Sender: TObject);
begin
  modulo.QryUsuarios.Open('select * from usuarios ORDER BY LOGIN');
  modulo.QryAccesos.Open('select * from accesos');
  grupo_cancelar.Enabled:= verificar_usuario;
  lista.Height:=109;
end;

procedure TFusuariosaccesos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  modulo.QryUsuarios.Open('select * from usuarios ORDER BY LOGIN');
end;

procedure TFusuariosaccesos.ListaClick(Sender: TObject);
begin
  bnada.Click;
  if localizar('remiagregar') then  ragregar.Checked:=true;
  if localizar('remimodificar') then  rmodificar.Checked:=true;
  if localizar('remicambiar') then  rcambiar.Checked:=true;
  if localizar('remiaumentar') then  raumentar.Checked:=true;
  if localizar('invevisualizar') then  ivisualizar.Checked:=true;
  if localizar('inveagregar') then  iagregar.Checked:=true;
  if localizar('invemodificar') then  imodificar.Checked:=true;
  if localizar('inveeliminar') then  ieliminar.Checked:=true;
  if localizar('invenube') then  inube.Checked:=true;
  if localizar('invesubir') then  isubir.Checked:=true;
  if localizar('iexistencias') then  IEXISTENCIAS.Checked:=true;
  if localizar('provvisualizar') then  prvisualizar.Checked:=true;
  if localizar('provagregar') then  pragregar.Checked:=true;
  if localizar('provmodificar') then  prmodificar.Checked:=true;
  if localizar('proveliminar') then  preliminar.Checked:=true;
  if localizar('usuavisualizar') then  uvisualizar.Checked:=true;
  if localizar('usuamodificar') then  umodificar.Checked:=true;
  if localizar('usuaeliminar') then  ueliminar.Checked:=true;
  if localizar('recevisualizar') then  revisualizar.Checked:=true;
  if localizar('receagregar') then  reagregar.Checked:=true;
  if localizar('recemodificar') then  remodificar.Checked:=true;
  if localizar('saliagregar') then  saliagregar.Checked:=true;
  if localizar('salimodificar') then  salimodificar.Checked:=true;
  if localizar('clieasignar') then  clieasignar.Checked:=true;
  if localizar('cliecancelar') then  cliecancelar.Checked:=true;
  if localizar('abonoeliminar') then  abeliminar.Checked:=true;
  if localizar('devoagregar') then  deagregar.Checked:=true;
  if localizar('devoeliminar') then  deeliminar.Checked:=true;
  if localizar('exrespaldar') then Exrespaldar.Checked:=true;
  if localizar('exajustes') then Exajustes.Checked:=true;
  if localizar('repartos') then Rrepartos.Checked:=true;
  if localizar('cajero') then ccajero.Checked:=true;
  if localizar('cortes') then ccortes.Checked:=true;

  if localizar('cancelar') then cancelar.Checked:=true;

end;

end.
