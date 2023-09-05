unit UListaSimilares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFlista_similares = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    bguardar2: TSpeedButton;
    Modificar: TSpeedButton;
    Eliminar: TSpeedButton;
    Eproducto: TEdit;
    Label1: TLabel;
    Ebuscar: TEdit;
    GridEmpaque: TDBGrid;
    LCLAVE: TLabel;
    Sqlred: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure bguardar2Click(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure EbuscarChange(Sender: TObject);
    procedure EproductoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridEmpaqueDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flista_similares: TFlista_similares;
  alta:boolean;

implementation

{$R *.dfm}

uses Umodulo, Usimilares;

procedure TFlista_similares.bguardar2Click(Sender: TObject);
begin
  if trim(eproducto.Text)<>'' then
  begin
    modulo.qryinventario.Open('select * from inventario');
    if modulo.qryinventario.Locate('producto',trim(eproducto.Text),[]) then
    begin
      showmessage('nombre de producto ya se encuentra en el inventario');
      exit;
    end;


    if ALTA then
    BEGIN
        MODULO.QryListaSimilar.Open('select * from lista_similar order by descripcion');
        sqlred.Open('select max(clave)as folio from lista_similar');
        if not modulo.QryListaSimilar.Locate('descripcion',trim(eproducto.Text),[]) then
        begin
          modulo.QryListaSimilar.Append;
          if sqlred['folio']<>null then
            modulo.QryListaSimilar['CLAVE']:=sqlred['folio']+1
          else
            modulo.QryListaSimilar['CLAVE']:='1';
          modulo.QryListaSimilar['descripcion']:=trim(eproducto.Text);
          modulo.QryListaSimilar.Post;
          eproducto.Clear;
          alta:=true;
        end
        else
          showmessage('Identificador ya existe en el sistema');
    END
    ELSE
    BEGIN
        MODULO.QryListaSimilar.Open('select CLAVE from lista_similar where clave <> '+lclave.Caption+' and descripcion = '+quotedstr(eproducto.Text));
        if modulo.QryListaSimilar.RecordCount>0 then
        begin
          showmessage('Identificador ya existe en el sistema');
          MODULO.QryListaSimilar.Open('select * from lista_similar order by descripcion');
        end
        else
        begin
          MODULO.QryListaSimilar.Open('select * from lista_similar order by descripcion');
          modulo.QryListaSimilar.Locate('clave',lclave.Caption,[]);
          modulo.QryListaSimilar.Edit;
          modulo.QryListaSimilar['descripcion']:=trim(eproducto.Text);
          modulo.QryListaSimilar.Post;
          eproducto.Clear;
          alta:=true;
        end;
    END;
  end;
end;

procedure TFlista_similares.EbuscarChange(Sender: TObject);
begin
  if trim(ebuscar.Text)='' then
    MODULO.QryListaSimilar.Open('select * from lista_similar order by descripcion')
  else
    modulo.QryListaSimilar.Open('select * from lista_similar where descripcion like '+quotedstr('%'+ ebuscar.Text +'%')+ ' order by descripcion' );
end;

procedure TFlista_similares.EliminarClick(Sender: TObject);
begin
  if modulo.QryListaSimilar.RecordCount>0 then
    if MessageDlg('¿Deseas borrar este producto del inventario?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      modulo.QrySimilar.SQL.Clear;
      modulo.QrySimilar.SQL.Add('delete from similar where clave ='+inttostr(modulo.QryListaSimilar['clave']));
      modulo.QrySimilar.ExecSQL;
      modulo.QryListaSimilar.Delete;
    end;
end;

procedure TFlista_similares.EproductoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    bguardar2.Click;
end;

procedure TFlista_similares.FormActivate(Sender: TObject);
begin
  MODULO.QryListaSimilar.Open('select * from lista_similar order by descripcion');
  alta:=true;
  eproducto.Clear;
  eproducto.SetFocus;
end;

procedure TFlista_similares.GridEmpaqueDblClick(Sender: TObject);
begin
  fsimilares.LCLAVE.Caption:=modulo.QryListaSimilar['clave'];
  fsimilares.ShowModal;
end;

procedure TFlista_similares.ModificarClick(Sender: TObject);
begin
  if modulo.QryListaSimilar.RecordCount>0 then
  begin
    eproducto.Text:=modulo.QryListaSimilar['descripcion'];
    eproducto.SetFocus;
    alta:=false;
    LCLAVE.Caption:= modulo.QryListaSimilar['CLAVE'];
  end;
end;

end.
