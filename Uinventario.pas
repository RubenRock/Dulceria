unit Uinventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus;

type
  TFinventario = class(TForm)
    Panel1: TPanel;
    Pmodificar: TPanel;
    Modificar: TSpeedButton;
    PEliminar: TPanel;
    Eliminar: TSpeedButton;
    grid: TDBGrid;
    Sqlred: TFDQuery;
    Panel4: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Rclave: TRadioButton;
    Rnombre: TRadioButton;
    Ebuscar: TEdit;
    QryEmpaque: TFDQuery;
    DsEmpaque: TDataSource;
    FDMemTable1: TFDMemTable;
    Dsmemtable: TDataSource;
    FDMemTable2: TFDMemTable;
    Dsmemtable2: TDataSource;
    SpeedButton1: TSpeedButton;
    PAgregar: TPanel;
    Agregar: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Reiniciarinventarioa01: TMenuItem;
    QryAux: TFDQuery;
    QryActualizarInventario: TFDQuery;
    procedure AgregarClick(Sender: TObject);
    procedure desactivar;
    procedure activar;
    procedure Actualizar_productos(texto:string);
    procedure ModificarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure EbuscarChange(Sender: TObject);
    procedure beliminar2Click(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure EbuscarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RnombreClick(Sender: TObject);
    procedure RclaveClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure gridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Reiniciarinventarioa01Click(Sender: TObject);
    procedure facturable;
    procedure aumentarInventario(clave, empaque:string; cantidad:integer);
    procedure reducirInventario(clave, empaque:string; cantidad:integer);
    function verificarInventario(clave, empaque:string; cantidad:integer):boolean;
    procedure QryActualizarInventarioAfterExecute(DataSet: TFDDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Finventario: TFinventario;
  alta,alta2:boolean;
  Clvprod, nomant,IDprod,Nomprod,empaqueant:string;

implementation

uses Umodulo, UVerificarUsuario, Uinventario_agregar, Uinventario_modificar,
  UListaSimilares;



{$R *.dfm}

procedure TFinventario.facturable;
begin
  modulo.qryinventario.Edit;
  if modulo.qryinventario['facturable']='SI'then
      modulo.qryinventario['facturable']:='NO'
  else
      modulo.qryinventario['facturable']:='SI';
  modulo.qryinventario.Post;
end;

procedure TFinventario.FormActivate(Sender: TObject);
begin
  ebuscar.SetFocus;
end;

procedure TFinventario.Actualizar_productos(texto:string);
begin
  Sqlred.SQL.Clear;
  Sqlred.SQL.Add(texto);
  Sqlred.ExecSQL;
end;

procedure TFinventario.activar;
begin
  agregar.Enabled:=true;
  //guardar.Enabled:=false;
  modificar.Enabled:=true;
  eliminar.Enabled:=true;
  //cancelar.Enabled:=false;
end;

procedure TFinventario.desactivar;
begin
  agregar.Enabled:=false;
  //guardar.Enabled:=true;
  modificar.Enabled:=false;
  eliminar.Enabled:=false;
  //cancelar.Enabled:=true;
end;

procedure TFinventario.EbuscarChange(Sender: TObject);
begin
  modulo.qryinventario.Filtered:=false;

  if ((rclave.Checked) and (trim(ebuscar.Text)<>'')) then
  begin
    sqlred.Open('select * from inventario_empaque where barras like '+quotedstr('%'+ebuscar.Text+'%'));
    if sqlred.RecordCount<1 then
       modulo.qryinventario.Filter:='clave = '+quotedstr('no hay nada que mostrar')
    else
      modulo.qryinventario.Filter:='clave = '+quotedstr(sqlred['clave']);
  end
  else
  begin
    modulo.qryinventario.Filter:='producto like '+quotedstr('%'+ ebuscar.Text +'%');

  end;

  modulo.qryinventario.Filtered:=true;

  qryempaque.Close;
end;

procedure TFinventario.EbuscarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape  then
     ebuscar.Clear;
end;

procedure TFinventario.EliminarClick(Sender: TObject);
begin
  if fverificausu.verificar('inveeliminar') then
    if modulo.QryInventario.RecordCount>0 then
      if MessageDlg('¿Deseas borrar este producto del inventario?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            SQLRED.SQL.Clear;
            SQLRED.SQL.Add('DELETE FROM INVENTARIO_EMPAQUE WHERE CLAVE = '+ QUOTEDSTR(MODULO.qryinventario['CLAVE']));
            SQLRED.ExecSQL;
            modulo.QryInventario.Delete;
            QRYEMPAQUE.Close;
          end;


end;

procedure TFinventario.gridCellClick(Column: TColumn);
begin
  qryempaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.qryinventario['clave']));
end;

procedure TFinventario.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  qryempaque.Open('select * from inventario_empaque where clave = '+quotedstr(modulo.qryinventario['clave']));
  if key = VK_return then
    Modificar.Click;
end;

procedure TFinventario.ModificarClick(Sender: TObject);
begin
  if fverificausu.verificar('invemodificar') then
    if modulo.qryinventario.RecordCount>0 then
    begin
      finventario_modificar.eclave.Caption:=modulo.qryinventario['clave'];
      finventario_modificar.Eproducto.Text:=modulo.qryinventario['producto'];
      finventario_modificar.eprecio_uni.Text:=modulo.qryinventario['precio_uni'];
      finventario_modificar.eprecio_seis.Text:=modulo.qryinventario['precio_seis'];
      finventario_modificar.eprecio_doce.Text:=modulo.qryinventario['precio_doce'];
      finventario_modificar.eiva.Text:=modulo.qryinventario['iva'];
      finventario_modificar.eieps.Text:=modulo.qryinventario['ieps'];
      finventario_modificar.epiezas.Text:=modulo.qryinventario['piezas'];
      finventario_modificar.showmodal;
    end;
end;


procedure TFinventario.QryActualizarInventarioAfterExecute(DataSet: TFDDataSet);
begin
  modulo.Conector.Commit;
end;

procedure TFinventario.RclaveClick(Sender: TObject);
begin
  ebuscar.Clear;
end;

procedure TFinventario.reducirInventario(clave, empaque: string;cantidad:integer);
var
  piezas:integer;
begin
    qryaux.Open('select * from inventario_empaque where id = '+quotedstr(empaque));
    if qryaux['clave'] = clave then
    begin
      QryActualizarInventario.Open('select * from EXISTENCIAS where clave ='+quotedstr(clave));
      piezas := strtoint(QryActualizarInventario['existencia'])-(cantidad*qryaux['piezas']);
      showmessage(inttostr(piezas));
      QryActualizarInventario.ExecSQL('update inventario set existencia ='+quotedstr(inttostr(piezas))+' where clave = '+quotedstr(clave));
    end;
end;

procedure TFinventario.Reiniciarinventarioa01Click(Sender: TObject);
begin
  showmessage(modulo.qryinventario['producto']);
  Qryaux.SQL.Clear;
  Qryaux.SQL.Add('UPDATE remisiones SET CLAVE = '+quotedstr('')+', CLAVE_EMPAQUE= '+quotedstr('')+' where clave = '+quotedstr(modulo.qryinventario['clave']));
  Qryaux.ExecSQL;

  Qryaux.SQL.Clear;
  Qryaux.SQL.Add('UPDATE RECEPCIONES SET CLAVE = '+quotedstr('')+', CLAVE_EMPAQUE= '+quotedstr('')+' where clave = '+quotedstr(modulo.qryinventario['clave']));
  Qryaux.ExecSQL;

  Qryaux.SQL.Clear;
  Qryaux.SQL.Add('UPDATE DEVOLUCIONES SET CLAVE = '+quotedstr('')+', CLAVE_EMPAQUE= '+quotedstr('')+' where clave = '+quotedstr(modulo.qryinventario['clave']));
  Qryaux.ExecSQL;
end;

procedure TFinventario.RnombreClick(Sender: TObject);
begin
  ebuscar.Clear;
end;

procedure TFinventario.SpeedButton1Click(Sender: TObject);
begin
  ebuscar.Clear;
  FLISTA_SIMILARES.ShowModal;
end;

function TFinventario.verificarInventario(clave, empaque: string;
  cantidad: integer):boolean;
var
  piezas:integer;
begin
    qryaux.Open('select * from inventario_empaque where id = '+quotedstr(empaque));
    if qryaux['clave'] = clave then
    begin
      QryActualizarInventario.Open('select * from inventario where clave ='+quotedstr(clave));
      piezas := cantidad*qryaux['piezas'];
      if strtoint(QryActualizarInventario['existencia']) >= piezas then
        verificarInventario:=true
      else
      begin
        verificarInventario:=false;
        showmessage('no hay suficiente en el inventario'+ sLineBreak+
        'hay en existencia: '+inttostr(QryActualizarInventario['existencia'])+' piezas '+sLineBreak+
        'quieres vender: '+inttostr(piezas)+ sLineBreak+
        'hace falta: '+inttostr(piezas-strtoint(QryActualizarInventario['existencia']))+' piezas');
      end;
    end
    else
    begin
      verificarInventario:=false;
      showmessage('Existe un error con el producto');
    end;


end;

procedure TFinventario.beliminar2Click(Sender: TObject);
begin
  if fverificausu.verificar('inveeliminar') then
    if qryempaque.RecordCount>0 then
      if MessageDlg('¿Deseas borrar este empaque?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            qryempaque.Delete;
          end;

end;

procedure TFinventario.AgregarClick(Sender: TObject);
begin
  finventario_agregar.eclave.Caption:=datetimetostr(now);
  finventario_agregar.showmodal;
end;

procedure TFinventario.aumentarInventario(clave, empaque: string; cantidad: integer);
var
  piezas:integer;
begin
    qryaux.Open('select * from inventario_empaque where id = '+quotedstr(empaque));
    if qryaux['clave'] = clave then
    begin
      QryActualizarInventario.Open('select * from EXISTENCIAS where clave ='+quotedstr(clave));
      piezas := cantidad*qryaux['piezas']+strtoint(QryActualizarInventario['existencia']);
      //SHOWMESSAGE('PIEZAS: '+inttostr(piezas));
      QryActualizarInventario.ExecSQL('update inventario set existencia ='+quotedstr(inttostr(piezas))+' where clave = '+quotedstr(clave));
    end;
end;

end.
