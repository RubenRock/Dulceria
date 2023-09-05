unit Ureportetiquet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, ppViewr, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache,
  ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TFreportetiquet = class(TForm)
    ppBDEPipeline1: TppBDEPipeline;
    report1: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ETOTAL: TppLabel;
    report2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ERAZONR2: TppLabel;
    EUSUARIOR2: TppLabel;
    EFECHAR2: TppLabel;
    EFOLIOR2: TppLabel;
    ECONDICIONR2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel36: TppLabel;
    ETOTALR2: TppLabel;
    ppLabel39: TppLabel;
    reimpresion: TppReport;
    ppDetailBand3: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel30: TppLabel;
    reTOTAL: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppTitleBand1: TppTitleBand;
    rerazon: TppLabel;
    renombre: TppLabel;
    rerfc: TppLabel;
    redireccion: TppLabel;
    retelefono: TppLabel;
    ppLabel16: TppLabel;
    ppLabel19: TppLabel;
    reusuario: TppLabel;
    reCLIENTE: TppLabel;
    reFECHA: TppLabel;
    reFOLIO: TppLabel;
    ppLabel26: TppLabel;
    reCONDICION: TppLabel;
    ppImage2: TppImage;
    REDOMICILIO: TppLabel;
    ppTitleBand2: TppTitleBand;
    nombre: TppLabel;
    direccion: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    Eusuario: TppLabel;
    ecliente1: TppLabel;
    Efecha: TppLabel;
    Efolio: TppLabel;
    ppLabel6: TppLabel;
    CONDICION: TppLabel;
    ppImage1: TppImage;
    reimpresion_copia: TppReport;
    ppHeaderBand2: TppHeaderBand;
    rerazon2: TppLabel;
    reusuario2: TppLabel;
    refecha2: TppLabel;
    refolio2: TppLabel;
    ppLabel20: TppLabel;
    recondicion2: TppLabel;
    ppLabel23: TppLabel;
    retotal2: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList4: TppParameterList;
    recliente2: TppLabel;
    redomicilio2: TppLabel;
    Report1_copia: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand5: TppSummaryBand;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppParameterList5: TppParameterList;
    ecliente2: TppLabel;
    ppLabel5: TppLabel;
    efolio2: TppLabel;
    efecha2: TppLabel;
    ppLabel10: TppLabel;
    eusuario2: TppLabel;
    ppLabel12: TppLabel;
    etotal2: TppLabel;
    ecliente3: TppLabel;
    ppLabel21: TppLabel;
    efolio3: TppLabel;
    efecha3: TppLabel;
    ppLabel25: TppLabel;
    eusuario3: TppLabel;
    ppLabel27: TppLabel;
    etotal3: TppLabel;
    ppLabel7: TppLabel;
    condicion2: TppLabel;
    ppLabel9: TppLabel;
    condicion3: TppLabel;
    subtotal: TppLabel;
    descuento: TppLabel;
    reporteTraspaso: TppReport;
    ppTitleBand3: TppTitleBand;
    Trazon: TppLabel;
    ppLabel28: TppLabel;
    Tusuario: TppLabel;
    Tcliente: TppLabel;
    Tfecha: TppLabel;
    Tfolio: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel42: TppLabel;
    Ttotal: TppLabel;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList6: TppParameterList;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ReporteRetiros: TppReport;
    ppHeaderBand4: TppHeaderBand;
    LRetiroRazon: TppLabel;
    ppLabel22: TppLabel;
    LretiroFecha: TppLabel;
    LretiroUsuario: TppLabel;
    ppLabel35: TppLabel;
    LRetiroTotal: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppSummaryBand7: TppSummaryBand;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppParameterList7: TppParameterList;
    ppShape1: TppShape;
    ppImage3: TppImage;
    report_matriz_punto: TppReport;
    ppTitleBand4: TppTitleBand;
    razonM: TppLabel;
    nombreM: TppLabel;
    rfcM: TppLabel;
    direccionM: TppLabel;
    telefonoM: TppLabel;
    ppLabel31: TppLabel;
    ppLabel37: TppLabel;
    EusuarioM: TppLabel;
    ECLIENTEM: TppLabel;
    EfechaM: TppLabel;
    EfolioM: TppLabel;
    ppLabel44: TppLabel;
    CONDICIONM: TppLabel;
    COTIZACIONM: TppLabel;
    ppImage4: TppImage;
    ppDetailBand8: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppSummaryBand8: TppSummaryBand;
    ppLabel47: TppLabel;
    ETOTALM: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList8: TppParameterList;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel8: TppLabel;
    reporte_sin_compranbante_matriz: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ERAZONR2M: TppLabel;
    EUSUARIOR2M: TppLabel;
    EFECHAR2M: TppLabel;
    EFOLIOR2M: TppLabel;
    ECONDICIONR2M: TppLabel;
    ETOTALR2M: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand8: TppFooterBand;
    ppSummaryBand9: TppSummaryBand;
    ppDesignLayers9: TppDesignLayers;
    ppDesignLayer9: TppDesignLayer;
    ppParameterList9: TppParameterList;
    ppLabel24: TppLabel;
    ppLabel29: TppLabel;
    ppLabel38: TppLabel;
    EDOMICILIOM: TppLabel;
    EDOMICILIO1: TppLabel;
    rfc: TppLabel;
    telefono: TppLabel;
    razon: TppLabel;
    COTIZACION: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportetiquet: TFreportetiquet;

implementation

{$R *.dfm}

uses Umodulo;

end.