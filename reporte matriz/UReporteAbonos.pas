unit UReporteAbonos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppDB, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TFReporteAbonos = class(TForm)
    ppBDEPipeline2: TppBDEPipeline;
    report1: TppReport;
    ppHeaderBand3: TppHeaderBand;
    razon: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    fecha: TppLabel;
    RESTA: TppLabel;
    abonos: TppLabel;
    ppLabel8: TppLabel;
    devoluciones: TppLabel;
    ppLabel9: TppLabel;
    DEUDA: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel12: TppLabel;
    USUARIO: TppLabel;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    nombre: TppLabel;
    CLIENTE: TppLabel;
    FOLIO: TppLabel;
    HORA: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReporteAbonos: TFReporteAbonos;

implementation

{$R *.dfm}

end.
