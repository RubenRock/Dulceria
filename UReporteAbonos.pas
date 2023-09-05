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
    report_matriz_punto: TppReport;
    ppHeaderBand1: TppHeaderBand;
    razonM: TppLabel;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    fechaM: TppLabel;
    abonosM: TppLabel;
    ppLabel14: TppLabel;
    devolucionesM: TppLabel;
    ppLabel16: TppLabel;
    DEUDAM: TppLabel;
    nombreM: TppLabel;
    ppLabel19: TppLabel;
    USUARIOM: TppLabel;
    CLIENTEM: TppLabel;
    FOLIOM: TppLabel;
    HORAM: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel24: TppLabel;
    RESTAM: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel45: TppLabel;
    ppLabel41: TppLabel;
    ppLabel1: TppLabel;
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
