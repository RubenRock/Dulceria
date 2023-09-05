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
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    razon: TppLabel;
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
    subtotal: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ecliente2: TppLabel;
    efolio2: TppLabel;
    efecha2: TppLabel;
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
    ppLabel9: TppLabel;
    ppImage1: TppImage;
    NOMBRE: TppLabel;
    condicion: TppLabel;
    condicion2: TppLabel;
    cotizacion: TppLabel;
    cotizacion2: TppLabel;
    condicion3: TppLabel;
    ppLabel5: TppLabel;
    descuento: TppLabel;
    ppLabel8: TppLabel;
    etotal: TppLabel;
    Label1: TLabel;
    report2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppLabel32: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ETOTALR2: TppLabel;
    ppLabel34: TppLabel;
    ERAZONR2: TppLabel;
    EFECHAR2: TppLabel;
    EFOLIOR2: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ECONDICIONR2: TppLabel;
    ppLabel53: TppLabel;
    EUSUARIOR2: TppLabel;
    ppLabel55: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel35: TppLabel;
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
