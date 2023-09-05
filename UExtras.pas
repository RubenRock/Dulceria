unit UExtras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls, json;

type
  TFextras = class(TForm)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    erazon: TEdit;
    enombre1: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    erfc: TEdit;
    Label6: TLabel;
    edireccion: TEdit;
    Guardar: TSpeedButton;
    Label7: TLabel;
    Etelefono: TEdit;
    Label8: TLabel;
    eWhatsapp: TEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Eempaques: TEdit;
    Elista_remision: TEdit;
    Eremisiones: TEdit;
    enombre2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Efecha: TEdit;
    Label12: TLabel;
    Edirec_fecha: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    CNotas: TComboBox;
    Label16: TLabel;
    CTiquet: TComboBox;
    Cimprimir_pantalla: TCheckBox;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Cnegocio: TComboBox;
    Einventario: TEdit;
    Label18: TLabel;
    lfechalocal: TLabel;
    lfechaservidor: TLabel;
    efechaServidor: TEdit;
    GroupBox5: TGroupBox;
    Cinventario: TCheckBox;
    Label13: TLabel;
    Sfechaactualizacion: TToggleSwitch;
    CsegundaCaja: TCheckBox;
    Label19: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure Leerfechas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fextras: TFextras;

implementation

{$R *.dfm}

uses Umodulo, UmoduloAPI;

procedure TFextras.FormActivate(Sender: TObject);
begin
  Leerfechas; // poner fechas local y en linea para ver en pantalla

  modulo.QryExtras.Open('select * from extras');
  modulo.QryExtras.First;
  erazon.Text:=modulo.QryExtras['razon'];
  enombre1.Text:=modulo.QryExtras['nombre1'];
  enombre2.Text:=modulo.QryExtras['nombre2'];
  erfc.Text:=modulo.QryExtras['rfc'];
  edireccion.Text:=modulo.QryExtras['direccion'];
  etelefono.Text:=modulo.QryExtras['telefono'];
  ewhatsapp.Text:=modulo.QryExtras['whatsapp'];
  einventario.Text:=modulo.QryExtras['inventario'];
  eempaques.Text:=modulo.QryExtras['empaque'];
  elista_remision.Text:=modulo.QryExtras['lista_remision'];
  eremisiones.Text:=modulo.QryExtras['remisiones'];
  efecha.Text:=modulo.QryExtras['fecha'];
  edirec_fecha.Text:=modulo.QryExtras['direc_fecha'];
  if modulo.QryExtras['negocio']= 'SAN MARTIN' then
    cnegocio.ItemIndex:=0
  else
    cnegocio.ItemIndex:=1;
  cinventario.Checked :=  modulo.QryExtras['manejar_inventario']>0;
  if modulo.QryExtras['verificar_fecha']>0 then
    Sfechaactualizacion.State:=tssOn
  else
    Sfechaactualizacion.State:=tssOff;

  if modulo.QryExtras['segundacaja']= null then
     CsegundaCaja.Checked:=false
  else
    if modulo.QryExtras['segundacaja']='0' then
      CsegundaCaja.Checked:=false
    else
      CsegundaCaja.Checked:=true;

  CNotas.ItemIndex:=modulo.QryExtras['notas'];
  Ctiquet.ItemIndex:=modulo.QryExtras['tiquet'];
  Cimprimir_pantalla.Checked := modulo.QryExtras['imprimir_en_pantalla']='1';
end;

procedure TFextras.GuardarClick(Sender: TObject);
begin
  modulo.QryExtras.Edit;
  modulo.QryExtras['razon']:= erazon.Text;
  modulo.QryExtras['nombre1']:= enombre1.Text;
  modulo.QryExtras['nombre2']:= enombre2.Text;
  modulo.QryExtras['rfc']:= erfc.Text;
  modulo.QryExtras['direccion']:= edireccion.Text;
  modulo.QryExtras['telefono']:= etelefono.Text;
  modulo.QryExtras['whatsapp']:= ewhatsapp.Text;
  modulo.QryExtras['inventario']:=einventario.Text;
  modulo.QryExtras['empaque']:=eempaques.Text;
  modulo.QryExtras['lista_remision']:=elista_remision.Text;
  modulo.QryExtras['remisiones']:=eremisiones.Text;
  modulo.QryExtras['fecha']:=efecha.Text;
  modulo.QryExtras['direc_fecha']:=edirec_fecha.Text;
  modulo.QryExtras['negocio']:=cnegocio.Text;
  if cinventario.Checked then
    modulo.QryExtras['manejar_inventario']:=1
  else
    modulo.QryExtras['manejar_inventario']:=0;

   if Sfechaactualizacion.State = tssOn then
    modulo.QryExtras['verificar_fecha']:=1
  else
    modulo.QryExtras['verificar_fecha']:=0;

   if CsegundaCaja.Checked then
    modulo.QryExtras['segundacaja']:='1'
   else
    modulo.QryExtras['segundacaja']:='0';


  modulo.QryExtras['notas']:=CNotas.ItemIndex;
  modulo.QryExtras['tiquet']:=Ctiquet.ItemIndex;
  if Cimprimir_pantalla.Checked then
    modulo.QryExtras['imprimir_en_pantalla']:=1
  else
    modulo.QryExtras['imprimir_en_pantalla']:=0;


  modulo.QryExtras.Post;
  showmessage('Guardado correctamente');
  close;
end;

procedure TFextras.Leerfechas;
var
  texto: TStringList;
  JSOValue: TJSONValue;
  fecha, nfecha:string;
begin
  texto := TStringList.Create;
  texto.LoadFromFile(ExtractFilePath(Application.GetNamePath)+'ultima_actualizacion.txt');
  lfechalocal.Caption:= datetimetostr(strtodatetime(texto.Text));

  try
      if modulo.QryExtras['negocio']= 'SAN MARTIN' then
        moduloapi.Restfecha.BaseURL:='https://vercel-api-eta.vercel.app/api/fecha'
      else
        moduloapi.Restfecha.BaseURL:='https://vercel-api-eta.vercel.app/api/papel_fecha';

      moduloAPI.Requestfecha.Execute;
      JSOValue:=TJSONObject.ParseJSONValue(moduloAPI.Responsefecha.Content);
      fecha:=(((JSOValue as TJSONArray).Items[0] as TJSonObject).Get('fecha').JSONValue.Value);
      nfecha:=fecha;
      //arreglo el formato de fecha
      {nfecha[1]:=fecha[4];
      nfecha[2]:=fecha[5];
      nfecha[4]:=fecha[1];
      nfecha[5]:=fecha[2];}

      efechaServidor.Text:=datetimetostr(strtodatetime(nfecha));

  except on E: Exception do

  end;

end;

end.
