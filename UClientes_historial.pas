unit UClientes_historial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFClientes_historial = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Ebuscar: TEdit;
    RadioGroup1: TRadioGroup;
    RNombre: TRadioButton;
    RCOMPRAS: TRadioButton;
    Efechaini: TDateTimePicker;
    Efechafin: TDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    QRYCLIENTES: TFDQuery;
    DSCLIENTES: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure RNombreClick(Sender: TObject);
    procedure RCOMPRASClick(Sender: TObject);
    procedure EfechainiChange(Sender: TObject);
    procedure EfechafinChange(Sender: TObject);
    procedure EbuscarChange(Sender: TObject);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientes_historial: TFClientes_historial;
  HORAINI,HORAFIN:STRING;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFClientes_historial.EbuscarChange(Sender: TObject);
begin
  qryCLIENTES.Filter:='NOMBRE like '+quotedstr('%'+ ebuscar.Text +'%');
  qryCLIENTES.Filtered:=TRUE;

end;

procedure TFClientes_historial.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_ESCAPE then
    EBUSCAR.Clear;
end;

procedure TFClientes_historial.EfechafinChange(Sender: TObject);
begin
  horafin:= formatdatetime('mm/dd/yyyy',efechafin.date)+' '+'23:00:00';
  if RNOMBRE.Checked then
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by nombre')
  else
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by total desc');
end;

procedure TFClientes_historial.EfechainiChange(Sender: TObject);
begin
  horaini:= formatdatetime('mm/dd/yyyy',efechaini.date)+' '+'00:01:00';
  if RNOMBRE.Checked then
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by nombre')
  else
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by total desc');

end;

procedure TFClientes_historial.FormActivate(Sender: TObject);
VAR
  FECHA:STRING;
begin
  FECHA:=DATETOSTR(DATE);
  FECHA[1]:='0';FECHA[2]:='1';
  EFECHAFIN.Date:=DATE;
  EFECHAINI.Date:=STRTODATE(FECHA);

  horaini:= formatdatetime('mm/dd/yyyy',efechaini.date)+' '+'00:01:00';
  horafin:= formatdatetime('mm/dd/yyyy',efechafin.date)+' '+'23:00:00';

  EBUSCAR.Clear;

  if RNOMBRE.Checked then
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by nombre')
  else
    QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by total desc');

end;

procedure TFClientes_historial.RCOMPRASClick(Sender: TObject);
begin
  QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by total desc');
end;

procedure TFClientes_historial.RNombreClick(Sender: TObject);
begin
  QRYCLIENTES.Open('select nombre||'+quotedstr(' ')+'||apellidos as nombre,direccion,sum(total)as total from clientes, LISTA_REMISION where clientes.id = LISTA_REMISION.CLIENTE AND fecha >'+quotedstr(horaini)+' and fecha <='+quotedstr(horafin)+ 'group by nombre,direccion order by nombre')
end;

end.

