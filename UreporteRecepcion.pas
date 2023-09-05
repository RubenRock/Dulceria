unit UreporteRecepcion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ppDB, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TFreporteRecepcion = class(TForm)
    ppBDEPipeline1: TppBDEPipeline;
    report1: TppReport;
    ppTitleBand2: TppTitleBand;
    titulo: TppLabel;
    ppLabel18: TppLabel;
    usuario: TppLabel;
    cliente: TppLabel;
    hora: TppLabel;
    folio: TppLabel;
    ppImage1: TppImage;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    total: TppLabel;
    rfc: TppLabel;
    telefono: TppLabel;
    razon: TppLabel;
    COTIZACION: TppLabel;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    nombre: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FreporteRecepcion: TFreporteRecepcion;

implementation

{$R *.dfm}

uses Umodulo;

end.
