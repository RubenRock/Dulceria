object ModuloAPI: TModuloAPI
  OldCreateOrder = False
  Height = 460
  Width = 795
  object RemisionesGet: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/remisiones'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 32
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RemisionesGet
    Params = <
      item
        name = 'id'
      end
      item
        name = 'folio'
      end
      item
        name = 'cantidad'
      end
      item
        name = 'producto'
      end
      item
        name = 'total'
      end
      item
        name = 'tipo'
      end
      item
        name = 'empaque'
      end
      item
        name = 'descuento'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 112
    Top = 8
  end
  object RESTResponse1: TRESTResponse
    Left = 176
    Top = 8
  end
  object ListaremisionGet: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/listaremision'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 32
    Top = 55
  end
  object RESTRequest3: TRESTRequest
    Client = ListaremisionGet
    Params = <
      item
        name = 'id'
      end
      item
        name = 'folio'
      end
      item
        name = 'cantidad'
      end
      item
        name = 'producto'
      end
      item
        name = 'total'
      end
      item
        name = 'tipo'
      end
      item
        name = 'empaque'
      end
      item
        name = 'descuento'
      end>
    Response = RESTResponse3
    SynchronizedEvents = False
    Left = 112
    Top = 55
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'application/json'
    Left = 176
    Top = 55
  end
  object InventarioDelete: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/inventario'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 272
    Top = 8
  end
  object RESTRequest4: TRESTRequest
    Client = InventarioDelete
    Method = rmDELETE
    Params = <>
    Response = RESTResponse4
    SynchronizedEvents = False
    Left = 360
    Top = 8
  end
  object RESTResponse4: TRESTResponse
    ContentType = 'application/json'
    Left = 432
    Top = 8
  end
  object EmpaqueDelete: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/empaque'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 272
    Top = 53
  end
  object RESTRequest5: TRESTRequest
    Client = EmpaqueDelete
    Method = rmDELETE
    Params = <>
    Response = RESTResponse5
    SynchronizedEvents = False
    Left = 360
    Top = 53
  end
  object RESTResponse5: TRESTResponse
    ContentType = 'application/json'
    Left = 432
    Top = 53
  end
  object SimilarDelete: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/similares'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 276
    Top = 105
  end
  object RESTRequest6: TRESTRequest
    Client = SimilarDelete
    Method = rmDELETE
    Params = <>
    Response = RESTResponse6
    SynchronizedEvents = False
    Left = 364
    Top = 105
  end
  object RESTResponse6: TRESTResponse
    ContentType = 'application/json'
    Left = 436
    Top = 105
  end
  object InventarioPost: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/inventario'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 528
    Top = 8
  end
  object RESTRequest7: TRESTRequest
    Client = InventarioPost
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse7
    SynchronizedEvents = False
    Left = 605
    Top = 8
  end
  object RESTResponse7: TRESTResponse
    Left = 661
    Top = 8
  end
  object EmpaquePost: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/empaque'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 528
    Top = 55
  end
  object RESTRequest8: TRESTRequest
    Client = EmpaquePost
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse8
    SynchronizedEvents = False
    Left = 605
    Top = 55
  end
  object RESTResponse8: TRESTResponse
    Left = 661
    Top = 55
  end
  object ListasimilarPost: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/listasimilar'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 530
    Top = 161
  end
  object RESTRequest9: TRESTRequest
    Client = ListasimilarPost
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse9
    SynchronizedEvents = False
    Left = 607
    Top = 161
  end
  object RESTResponse9: TRESTResponse
    Left = 663
    Top = 161
  end
  object ListasimilarDelete: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/similares'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 276
    Top = 161
  end
  object RESTRequest2: TRESTRequest
    Client = ListasimilarDelete
    Method = rmDELETE
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 364
    Top = 161
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 436
    Top = 161
  end
  object SimilarPost: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/similares'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 530
    Top = 105
  end
  object RESTRequest10: TRESTRequest
    Client = SimilarPost
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse10
    SynchronizedEvents = False
    Left = 607
    Top = 105
  end
  object RESTResponse10: TRESTResponse
    Left = 663
    Top = 105
  end
  object RestPost: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/listasimilar'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 522
    Top = 248
  end
  object RESTRequest11: TRESTRequest
    AcceptCharset = 'Utf-8, *;q=0.8'
    Client = RestPost
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse11
    SynchronizedEvents = False
    Left = 599
    Top = 248
  end
  object RESTResponse11: TRESTResponse
    Left = 655
    Top = 248
  end
  object RestDelete: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/similares'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 268
    Top = 248
  end
  object RESTRequest12: TRESTRequest
    Client = RestDelete
    Method = rmDELETE
    Params = <>
    Response = RESTResponse12
    SynchronizedEvents = False
    Left = 356
    Top = 248
  end
  object RESTResponse12: TRESTResponse
    ContentType = 'application/json'
    Left = 428
    Top = 248
  end
  object Restfecha: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/fecha'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 522
    Top = 304
  end
  object Requestfecha: TRESTRequest
    Client = Restfecha
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = Responsefecha
    SynchronizedEvents = False
    Left = 599
    Top = 304
  end
  object Responsefecha: TRESTResponse
    ContentType = 'application/json'
    Left = 663
    Top = 304
  end
  object RestGet: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/remisiones'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 272
    Top = 360
  end
  object RequestGet: TRESTRequest
    Client = RestGet
    Params = <
      item
        name = 'id'
      end
      item
        name = 'folio'
      end
      item
        name = 'cantidad'
      end
      item
        name = 'producto'
      end
      item
        name = 'total'
      end
      item
        name = 'tipo'
      end
      item
        name = 'empaque'
      end
      item
        name = 'descuento'
      end>
    Response = ResponseGet
    SynchronizedEvents = False
    Left = 352
    Top = 360
  end
  object ResponseGet: TRESTResponse
    Left = 424
    Top = 360
  end
end
