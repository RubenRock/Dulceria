unit Uresumenventas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFresumenventas = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Fechaini: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Fechafin: TDateTimePicker;
    Memo1: TMemo;
    QryAux: TFDQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure totalporhora(fecha1:string;fecha2:string);
    procedure SpeedButton2Click(Sender: TObject);
    procedure productospordia(fecha1:string;fecha2:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fresumenventas: TFresumenventas;

implementation

{$R *.dfm}

uses Umodulo;

procedure TFresumenventas.productospordia(fecha1: string; fecha2: string);
begin
  qryaux.Open('select SUM(cantidad)as suma, producto from lista_remision,remisiones where fecha >'+QUOTEDSTR(FECHA1)+' and fecha < '+QUOTEDSTR(FECHA2)+' and LISTA_REMISION.FOLIO = remisiones.FOLIO GROUP BY PRODUCTO ORDER BY SUMA DESC, PRODUCTO');
  qryaux.First;
  while not qryaux.Eof do
  begin
    memo1.Lines.Add(inttostr(qryaux['suma'])+CHR(9)+qryaux['producto']);
    qryaux.Next;
  end;
end;

procedure TFresumenventas.SpeedButton2Click(Sender: TObject);
var
  hora:byte;
  horaini,horafin:string;
begin
  memo1.Clear;
  horaini:=FormatDateTime('mm/dd/yyyy',fechaini.Date-1);
  horafin:=FormatDateTime('mm/dd/yyyy',fechafin.Date+1);
  memo1.Lines.Add('Resumen de movimientos de productos del:');
  memo1.Lines.Add(datetostr(fechaini.Date)+' al '+datetostr(fechafin.Date));
  productospordia(horaini+' 23:59:00',horafin+' 00:01:00');

end;

procedure TFresumenventas.totalporhora(fecha1: string; fecha2: string);
var
  horaini,horafin,mediashoras:string;
  hora:byte;
  Dmediahora:tdatetime;
  suma:array[1..24] of real;
begin
  for hora := 1 to 24 do
    suma[hora]:=0;

  qryaux.Open('select folio, total , fecha from lista_remision where fecha >'+quotedstr(fecha1)+' and fecha <'+quotedstr(fecha2)+' order by fecha');
  qryaux.First;

  while not qryaux.Eof do
  begin
    //elijo unicamente la hora sin minutos ni segundos
    DateTimeToString(horaini, 'HH', qryaux['fecha']);

    mediashoras:= formatdatetime('HH:mm:ss',qryaux['fecha']);
    dmediahora:=strtotime(mediashoras);

    //pintar resultados para corroborar:
    //memo1.Lines.Add(inttostr(qryaux['folio'])+'   '+datetostr(qryaux['fecha'])+'   '+chr(9)+horaini+'   '+chr(9)+floattostr(qryaux['total']));

    {case strtoint(horaini) of
      8:suma[1]:=suma[1]+qryaux['total'];
      9:suma[2]:=suma[2]+qryaux['total'];
      10:suma[3]:=suma[3]+qryaux['total'];
      11:suma[4]:=suma[4]+qryaux['total'];
      12:suma[5]:=suma[5]+qryaux['total'];
      13:suma[6]:=suma[6]+qryaux['total'];
      14:suma[7]:=suma[7]+qryaux['total'];
      15:suma[8]:=suma[8]+qryaux['total'];
      16:suma[9]:=suma[9]+qryaux['total'];
      17:suma[10]:=suma[10]+qryaux['total'];
      18:suma[11]:=suma[11]+qryaux['total'];
      19: suma[12]:=suma[12]+qryaux['total'];
    end;}

    case strtoint(horaini) of
      8: if dmediahora < strtotime('08:30:00') then suma[1]:=suma[1]+qryaux['total']
         else suma[13]:=suma[13]+qryaux['total'];
      9: if dmediahora < strtotime('09:30:00') then suma[2]:=suma[2]+qryaux['total']
         else suma[14]:=suma[14]+qryaux['total'];
      10: if dmediahora < strtotime('10:30:00') then suma[3]:=suma[3]+qryaux['total']
         else suma[15]:=suma[15]+qryaux['total'];
      11: if dmediahora < strtotime('11:30:00') then suma[4]:=suma[4]+qryaux['total']
         else suma[16]:=suma[16]+qryaux['total'];
      12: if dmediahora < strtotime('12:30:00') then suma[5]:=suma[5]+qryaux['total']
         else suma[17]:=suma[17]+qryaux['total'];
      13: if dmediahora < strtotime('13:30:00') then suma[6]:=suma[6]+qryaux['total']
         else suma[18]:=suma[18]+qryaux['total'];
      14: if dmediahora < strtotime('14:30:00') then suma[7]:=suma[7]+qryaux['total']
         else suma[19]:=suma[19]+qryaux['total'];
      15: if dmediahora < strtotime('15:30:00') then suma[8]:=suma[8]+qryaux['total']
         else suma[20]:=suma[20]+qryaux['total'];
      16: if dmediahora < strtotime('16:30:00') then suma[9]:=suma[9]+qryaux['total']
         else suma[21]:=suma[21]+qryaux['total'];
      17: if dmediahora < strtotime('17:30:00') then suma[10]:=suma[10]+qryaux['total']
         else suma[22]:=suma[22]+qryaux['total'];
      18: if dmediahora < strtotime('18:30:00') then suma[11]:=suma[11]+qryaux['total']
         else suma[23]:=suma[23]+qryaux['total'];
      19: if dmediahora < strtotime('19:30:00') then suma[12]:=suma[12]+qryaux['total']
         else suma[24]:=suma[24]+qryaux['total'];
    end;

    qryaux.Next;
  end;

  memo1.Lines.Add('');
  for hora := 8 to 19 do
  begin
    if hora > 12 then
      memo1.Lines.Add(inttostr(hora-12)+':00 pm   -    '+inttostr(hora-12)+':30pm')
    else
      memo1.Lines.Add(inttostr(hora)+':00 am   -    '+inttostr(hora)+':30am');
     //de la casilla 1 a la 12 son horas enteras
     //de la casiilla 13 a la 24 son las medias horas
     memo1.Lines.Add('*** $'+floattostr(suma[hora-7])+'    -    $'+floattostr(suma[hora+5]));
  end;


end;

procedure TFresumenventas.SpeedButton1Click(Sender: TObject);
var
  horaini,horafin:string;
begin
  memo1.Clear;
  horaini:=FormatDateTime('mm/dd/yyyy',fechaini.Date-1);
  horafin:=FormatDateTime('mm/dd/yyyy',fechafin.Date+1);
  memo1.Lines.Add('Resumen de movimientos de efectivo del:');
  memo1.Lines.Add(datetostr(fechaini.Date)+' al '+datetostr(fechafin.Date));
  memo1.Lines.Add('--------------*******---------------');
  //igualarlos al mismo dia no funciona correctamente
  //elijo la ultima hora del dia anterior y la primer hora del dia siguiente para el funcionamiento correcto
  totalporhora(horaini+' 23:59:00',horafin+' 00:01:00');

end;

end.

