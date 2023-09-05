unit Umodulo;

interface

uses
  System.SysUtils, System.Classes, REST.Backend.EMSServices, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  REST.Backend.EMSFireDAC, Data.Win.ADODB, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs;

type
  TModulo = class(TDataModule)
    Conector: TFDConnection;
    FBDriver: TFDPhysFBDriverLink;
    qryinventario: TFDQuery;
    Dsinventario: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryinventarioaux: TFDQuery;
    Dsinventarioaux: TDataSource;
    Conector2: TFDConnection;
    qryremiaux2: TFDQuery;
    Dsremiaux2: TDataSource;
    Qrylistarecepcion: TFDQuery;
    Dslistarecepcion: TDataSource;
    QryRecepciones: TFDQuery;
    DsRecepciones: TDataSource;
    qryborraremiaux: TFDQuery;
    QrynumFolio: TFDQuery;
    QryRemisiones: TFDQuery;
    DsRemisiones: TDataSource;
    QryListaremision: TFDQuery;
    DsListaremision: TDataSource;
    QryClientes: TFDQuery;
    DsClientes: TDataSource;
    Qrylista_folios: TFDQuery;
    Dslista_folios: TDataSource;
    QrylistaPagos: TFDQuery;
    DslistaPagos: TDataSource;
    QryAbonos: TFDQuery;
    DsAbonos: TDataSource;
    QryUsuarios: TFDQuery;
    DsDevoluciones: TDataSource;
    Qrydevoluciones: TFDQuery;
    DsUsuarios: TDataSource;
    QryAccesos: TFDQuery;
    DsAccesos: TDataSource;
    Qryproveedores: TFDQuery;
    Dsproveedores: TDataSource;
    QrySalidas: TFDQuery;
    DsSalidas: TDataSource;
    Qryimpresora: TFDQuery;
    Dsimpresora: TDataSource;
    QryExtras: TFDQuery;
    DsExtras: TDataSource;
    Qrylistaremisionresp: TFDQuery;
    Dslistaremisionresp: TDataSource;
    Qrylistarecepcionresp: TFDQuery;
    Dslistarecepcionresp: TDataSource;
    Qryremisionresp: TFDQuery;
    Dsremisionresp: TDataSource;
    Qryrecepcionresp: TFDQuery;
    Dsrecepcionresp: TDataSource;
    Qrylistafoliosresp: TFDQuery;
    Dslistafoliosresp: TDataSource;
    QryEmpaque: TFDQuery;
    DsEmpaque: TDataSource;
    QryLista_reparto: TFDQuery;
    DsLista_reparto: TDataSource;
    QryRepartos: TFDQuery;
    DsRepartos: TDataSource;
    QryListaSimilar: TFDQuery;
    DsListaSimilar: TDataSource;
    QrySimilar: TFDQuery;
    DsSimilar: TDataSource;
    QrySurtir: TFDQuery;
    DsSurtir: TDataSource;
    Qrylista_cortes: TFDQuery;
    Dslista_cortes: TDataSource;
    respaldo: TFDConnection;
    procedure qryinventarioAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo: TModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TModulo.qryinventarioAfterPost(DataSet: TDataSet);
begin
  conector.Commit;
end;

end.
