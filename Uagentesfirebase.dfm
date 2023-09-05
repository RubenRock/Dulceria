object FAgentesMongo: TFAgentesMongo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Agentes de venta 2021'
  ClientHeight = 314
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Bacccion: TSpeedButton
    Left = 479
    Top = 216
    Width = 193
    Height = 41
    Caption = 'Accion Get'
    Visible = False
    OnClick = BacccionClick
  end
  object Bpost: TSpeedButton
    Left = 479
    Top = 263
    Width = 193
    Height = 41
    Caption = 'Accion Post'
    Visible = False
    OnClick = BpostClick
  end
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 309
    Height = 16
    Caption = 'Informacion del proceso de carga de notas del agente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 479
    Top = 29
    Width = 219
    Height = 115
    Caption = 'Descargar inventario de agentes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Layout = blGlyphBottom
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 29
    Width = 457
    Height = 275
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object Qryaux: TFDQuery
    Connection = Modulo.Conector
    Left = 664
    Top = 160
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vercel-api-eta.vercel.app/api/inventario'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 486
    Top = 160
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 550
    Top = 160
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 606
    Top = 160
  end
end
