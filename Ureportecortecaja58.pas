unit Ureportecortecaja58;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDB,
  ppDBPipe, ppDBBDE, Vcl.Imaging.jpeg;

type
  TFreportecortecaja58 = class(TForm)
    ppBDEPipeline2: TppBDEPipeline;
    report1: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText5: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    FECHAINI: TppLabel;
    FECHAFIN: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    fecha: TppLabel;
    ppLine2: TppLine;
    contado: TppLabel;
    abonos: TppLabel;
    ppLabel10: TppLabel;
    total: TppLabel;
    ppLabel8: TppLabel;
    devoluciones: TppLabel;
    ppLabel9: TppLabel;
    SALIDAS: TppLabel;
    ppLabel12: TppLabel;
    USUARIO: TppLabel;
    ppDBText1: TppDBText;
    razon: TppLabel;
    ppImage1: TppImage;
    NOMBRE: TppLabel;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    DESCUENTOS: TppLabel;
    ppLabel2: TppLabel;
    VENTATOTAL: TppLabel;
    ppLabel13: TppLabel;
    CLIENTES: TppLabel;
    ppLabel11: TppLabel;
    ppLabel35: TppLabel;
    ppLabel14: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportecortecaja58: TFreportecortecaja58;

implementation

{$R *.dfm}

uses Umodulo, UCortes;

end.
