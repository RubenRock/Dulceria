unit Ureportecortecaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDB,
  ppDBPipe, ppDBBDE;

type
  TFreportecortecaja = class(TForm)
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
    razon: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    FECHAINI: TppLabel;
    FECHAFIN: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    fecha: TppLabel;
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
    descuentos: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    VENTATOTAL: TppLabel;
    ppLabel13: TppLabel;
    CLIENTES: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel11: TppLabel;
    ppImage1: TppImage;
    report_matriz_ounto: TppReport;
    ppHeaderBand1: TppHeaderBand;
    razonM: TppLabel;
    nombreM: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    FECHAINIM: TppLabel;
    FECHAFINM: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    fechaM: TppLabel;
    contadoM: TppLabel;
    abonosM: TppLabel;
    ppLabel26: TppLabel;
    totalM: TppLabel;
    ppLabel28: TppLabel;
    devolucionesM: TppLabel;
    ppLabel30: TppLabel;
    SALIDASM: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppImage2: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel34: TppLabel;
    USUARIOM: TppLabel;
    ppLabel36: TppLabel;
    VENTATOTALM: TppLabel;
    ppLabel38: TppLabel;
    CLIENTESM: TppLabel;
    ppLabel40: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    nombre: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportecortecaja: TFreportecortecaja;

implementation

{$R *.dfm}

uses Umodulo, UCortes;

end.
