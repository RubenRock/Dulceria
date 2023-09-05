unit UmoduloAPI;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TModuloAPI = class(TDataModule)
    RemisionesGet: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ListaremisionGet: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    InventarioDelete: TRESTClient;
    RESTRequest4: TRESTRequest;
    RESTResponse4: TRESTResponse;
    EmpaqueDelete: TRESTClient;
    RESTRequest5: TRESTRequest;
    RESTResponse5: TRESTResponse;
    SimilarDelete: TRESTClient;
    RESTRequest6: TRESTRequest;
    RESTResponse6: TRESTResponse;
    InventarioPost: TRESTClient;
    RESTRequest7: TRESTRequest;
    RESTResponse7: TRESTResponse;
    EmpaquePost: TRESTClient;
    RESTRequest8: TRESTRequest;
    RESTResponse8: TRESTResponse;
    ListasimilarPost: TRESTClient;
    RESTRequest9: TRESTRequest;
    RESTResponse9: TRESTResponse;
    ListasimilarDelete: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    SimilarPost: TRESTClient;
    RESTRequest10: TRESTRequest;
    RESTResponse10: TRESTResponse;
    RestPost: TRESTClient;
    RESTRequest11: TRESTRequest;
    RESTResponse11: TRESTResponse;
    RestDelete: TRESTClient;
    RESTRequest12: TRESTRequest;
    RESTResponse12: TRESTResponse;
    Restfecha: TRESTClient;
    Requestfecha: TRESTRequest;
    Responsefecha: TRESTResponse;
    RestGet: TRESTClient;
    RequestGet: TRESTRequest;
    ResponseGet: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModuloAPI: TModuloAPI;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
