unit UreporteRecepcion58;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppDB, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Vcl.Imaging.jpeg;

type
  TFreporteRecepcion58 = class(TForm)
    ppBDEPipeline2: TppBDEPipeline;
    report1: TppReport;
    ppHeaderBand3: TppHeaderBand;
    razon: TppLabel;
    TITULO: TppLabel;
    fecha: TppLabel;
    ppLabel12: TppLabel;
    USUARIO: TppLabel;
    CLIENTE: TppLabel;
    FOLIO: TppLabel;
    HORA: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel6: TppLabel;
    TOTAL: TppLabel;
    TEXTO: TppLabel;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppDBText2: TppDBText;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    NOMBRE: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FreporteRecepcion58: TFreporteRecepcion58;

implementation

{$R *.dfm}

uses Umodulo;

end.
