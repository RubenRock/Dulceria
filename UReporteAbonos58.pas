unit UReporteAbonos58;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppDB, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Vcl.Imaging.jpeg;

type
  TFReporteAbonos58 = class(TForm)
    ppBDEPipeline2: TppBDEPipeline;
    report1: TppReport;
    ppHeaderBand3: TppHeaderBand;
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
    CLIENTE: TppLabel;
    FOLIO: TppLabel;
    HORA: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    RAZON: TppLabel;
    NOMBRE: TppLabel;
    ppImage1: TppImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReporteAbonos58: TFReporteAbonos58;

implementation

{$R *.dfm}

end.
