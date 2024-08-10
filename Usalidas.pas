unit Usalidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFsalidas = class(TForm)
    Panel: TPanel;
    confi: TSpeedButton;
    Guardar: TSpeedButton;
    Label7: TLabel;
    Efolio: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    EMonto: TEdit;
    Fecha: TDateTimePicker;
    EDescripcion: TMemo;
    Sqlaux: TFDQuery;
    procedure GuardarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function VerificarSaldo(cantidad_a_cobrar:real):real;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsalidas: TFsalidas;

implementation

{$R *.dfm}

uses Umodulo, UVerificarUsuario, UCortes;

function TFsalidas.VerificarSaldo(cantidad_a_cobrar: Real):real;
var
  sender:TObject;
begin
  fcortes.LlenarFolios();
  fcortes.BcorteClick(sender);
  VerificarSaldo:=strtofloat(fcortes.Ltotal.Caption)-cantidad_a_cobrar;
end;

procedure TFsalidas.FormActivate(Sender: TObject);
begin
  if panel.ShowHint then
  begin
    emonto.Clear;edescripcion.Clear;emonto.SetFocus;
    fecha.Date:=date;
    sqlaux.Close;
    sqlaux.Open('select MAX(folio) as maxfolio from salidas');

    if sqlaux['maxfolio']= null then
      efolio.Text:='1'
    else
    begin
      if sqlaux.RecordCount>0then
        efolio.Text:=inttostr(sqlaux['maxfolio']+1)
      else
        efolio.Text:='1';
    end;
  end;
end;

procedure TFsalidas.GuardarClick(Sender: TObject);
begin
  if ((trim(emonto.Text)<>'') and (trim(edescripcion.Text)<>''))then
  begin
    {if VerificarSaldo(strtofloat(emonto.Text))<0 then
    begin
      showmessage('Saldo insuficiente para cubrir esta salida');
      exit;
    end; }


    if fverificausu.verificar('saliagregar') then
    begin
      if panel.ShowHint then
      begin
        sqlaux.Close;
        sqlaux.Open('select max(folio) as maxfolio from salidas');

        if sqlaux['maxfolio']= null then
          efolio.Text:='1'
        else
          efolio.Text:=inttostr(sqlaux['maxfolio']+1);

        modulo.QrySalidas.Append;
        modulo.QrySalidas['fecha']:=datetostr(fecha.Date)+ ' '+timetostr(time);
      end
      else
        if modulo.QrySalidas.Locate('folio',efolio.Text,[])then
          modulo.QrySalidas.Edit;
      modulo.QrySalidas['folio']:=efolio.Text;
      modulo.QrySalidas['cantidad']:=emonto.Text;
      modulo.QrySalidas['descripcion']:=edescripcion.Text;
      modulo.QrySalidas['usuario']:=fverificausu.Lusuario.Caption;
      modulo.QrySalidas.Post;
      modulo.QrySalidas.Close;modulo.QrySalidas.Open('select * from salidas order by folio desc');


      panel.ShowHint:=true;
      FormActivate(sender);
    end
    else
      showmessage('No tienes permiso de guardar salidas');
  end;
end;

end.
