unit Ureportenotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppDBPipe,
  ppDBBDE, ppComm, ppRelatv, ppProd, ppReport, ppModule, raCodMod, ppVar,
  Vcl.StdCtrls;

type
  TFreportenotas = class(TForm)
    ppBDEPipeline1: TppBDEPipeline;
    Bandera: TLabel;
    Label2: TLabel;
    ReporteNotas: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ecliente: TppLabel;
    Edireccion: TppLabel;
    razon: TppLabel;
    titulo1: TppLabel;
    IMAGEN: TppImage;
    titulo2: TppLabel;
    whatsapp: TppLabel;
    ppLabel28: TppLabel;
    rfc: TppLabel;
    telefono: TppLabel;
    ppLabel35: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ehora: TppLabel;
    efecha: TppLabel;
    ppLabel9: TppLabel;
    direc: TppLabel;
    COTIZACION: TppLabel;
    ppLabel3: TppLabel;
    Efolio: TppLabel;
    ppLabel42: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel17: TppLabel;
    eusuario: TppLabel;
    ppLabel45: TppLabel;
    asdf: TppLabel;
    ieps: TppLabel;
    vtatasa8: TppLabel;
    ppLabel49: TppLabel;
    aaa: TppLabel;
    iva: TppLabel;
    vtatasa15: TppLabel;
    ppLabel53: TppLabel;
    vtatasa0: TppLabel;
    ppLabel55: TppLabel;
    subtotal16: TppLabel;
    ppLabel57: TppLabel;
    subtotal18: TppLabel;
    ppLabel59: TppLabel;
    stotal: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    Eletra: TppLabel;
    ECONDICION: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppParameter1: TppParameter;
    paginas: TppLabel;
    Reportecredito: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    razon1: TppLabel;
    titulo3: TppLabel;
    IMAGEN2: TppImage;
    titulo4: TppLabel;
    whatsapp2: TppLabel;
    ppLabel8: TppLabel;
    rfc2: TppLabel;
    ppLabel12: TppLabel;
    cliente2: TppLabel;
    direccion2: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    hora2: TppLabel;
    fecha2: TppLabel;
    direcc2: TppLabel;
    telefono2: TppLabel;
    ppLabel6: TppLabel;
    COTIZACION2: TppLabel;
    ppLabel10: TppLabel;
    folio2: TppLabel;
    ppLabel20: TppLabel;
    paginas2: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel30: TppLabel;
    usuario2: TppLabel;
    ppLabel32: TppLabel;
    ppLabel36: TppLabel;
    ieps2: TppLabel;
    vtatasa82: TppLabel;
    ppLabel44: TppLabel;
    ppLabel46: TppLabel;
    iva2: TppLabel;
    vtatasa152: TppLabel;
    ppLabel50: TppLabel;
    vtatasa02: TppLabel;
    ppLabel52: TppLabel;
    subtotal162: TppLabel;
    ppLabel56: TppLabel;
    subtotal182: TppLabel;
    ppLabel60: TppLabel;
    Stotal2: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    letra2: TppLabel;
    condicion2: TppLabel;
    ppLabel68: TppLabel;
    CREDITO2: TppLabel;
    CREDITO3: TppLabel;
    CREDITO4: TppLabel;
    CREDITO6: TppLabel;
    CREDITO1: TppLabel;
    FECHAPAGO: TppLabel;
    ppLabel7: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freportenotas: TFreportenotas;

implementation

{$R *.dfm}

uses Umodulo;

end.
