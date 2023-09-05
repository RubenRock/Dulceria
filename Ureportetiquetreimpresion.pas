unit Ureportetiquetreimpresion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, ppViewr, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache,
  ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, Vcl.StdCtrls;

type
  TFreportetiquetreimpresion = class(TForm)
    ppBDEPipeline1: TppBDEPipeline;
    report1: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    razon: TppLabel;
    nombre: TppLabel;
    rfc: TppLabel;
    direccion: TppLabel;
    telefono: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    Eusuario: TppLabel;
    ecliente1: TppLabel;
    Efecha: TppLabel;
    Efolio: TppLabel;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ETOTAL: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
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
    ppLabel6: TppLabel;
    CONDICION: TppLabel;
    ppLabel7: TppLabel;
    condicion2: TppLabel;
    ppLabel9: TppLabel;
    condicion3: TppLabel;
    COTIZACION: TppLabel;
    subtotal: TppLabel;
    descuento: TppLabel;
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
    ppImage1: TppImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportetiquetreimpresion: TFreportetiquetreimpresion;

implementation

{$R *.dfm}

uses Umodulo;

end.
