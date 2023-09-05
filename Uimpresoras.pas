unit Uimpresoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFimpresora = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Cnotas: TComboBox;
    Ctickets: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimpresora: TFimpresora;

implementation

{$R *.dfm}

uses Umodulo, Ureportenotas, printers;

procedure TFimpresora.FormActivate(Sender: TObject);
begin
  modulo.Qryimpresora.Open('select * from impresora');
  modulo.Qryimpresora.First;
  Cnotas.SetFocus;
  Cnotas.Items.Assign(Printer.Printers);
  Ctickets.Items.Assign(Printer.Printers);

  Cnotas.Text:=modulo.Qryimpresora['Nota'];
  Ctickets.Text:=modulo.Qryimpresora['Ticket'];

end;

procedure TFimpresora.SpeedButton1Click(Sender: TObject);
begin
  if cnotas.Text<>'' then
    if ctickets.Text<>'' then
    begin
      modulo.Qryimpresora.Edit;
      modulo.Qryimpresora['Nota']:=cnotas.Text;
      modulo.Qryimpresora['Ticket']:=ctickets.Text;
      modulo.Qryimpresora.Post;
      showmessage('Impresoras actualizados');
      close;
    end;
end;

end.
