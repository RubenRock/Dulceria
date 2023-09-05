object Finventario_agregar: TFinventario_agregar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Agregar articulo'
  ClientHeight = 215
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 192
    Top = 143
    Width = 42
    Height = 15
    Caption = 'PIEZAS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 19
    Top = 144
    Width = 22
    Height = 15
    Caption = 'IVA:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 108
    Top = 143
    Width = 27
    Height = 15
    Caption = 'IEPS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object epiezas: TEdit
    Left = 192
    Top = 165
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyUp = EprecioKeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 137
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 1
    ExplicitWidth = 554
    object Label4: TLabel
      Left = 8
      Top = 5
      Width = 68
      Height = 15
      Caption = 'PRODUCTO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bguardar2: TSpeedButton
      Left = 411
      Top = 19
      Width = 78
      Height = 33
      Hint = 'Guardar'
      Flat = True
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C07000000000000000000000000000000000000FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF008000FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF008000FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF008000FF00
        80FF0080FF008000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        FF0080FF0080FF008000FF0080FF0080FF00806B63580000004D3824330A0EF4
        ECDEC9AF89C9AF89F4ECDEC9AF89F4ECDEC9AF89F4ECDEC9AF89F4ECDEC9AF89
        330A0E4F3016330A0E000000FF0080FF0080FF008000FF0080FF0080FF00806B
        63580000003F1C124F3016F4ECDEDBC29A330A0E330A0EF4ECDEC9AF89F4ECDE
        C9AF89DBC29AC9AF89F4ECDE4F3016330A0E4F3016000000FF0080FF0080FF00
        8000FF0080FF0080FF00806B63580000004D3824330A0EF4ECDEC9AF89330A0E
        330A0EC9AF89F4ECDEC9AF89F4ECDEC9AF89F4ECDEC9AF89330A0E4F3016330A
        0E000000FF0080FF0080FF008000FF0080FF0080FF00806B63580000003F1C12
        4F3016F4ECDEDBC29A330A0E330A0EF4ECDEC9AF89F4ECDEC9AF89F4ECDEC9AF
        89F4ECDE4F3016330A0E4F3016000000FF0080FF0080FF008000FF0080FF0080
        FF00806B63580000004D3824330A0EF4ECDEC9AF89330A0E330A0EC9AF89F4EC
        DEC9AF89F4ECDEC9AF89F4ECDEC9AF89330A0E4F3016330A0E000000FF0080FF
        0080FF008000FF0080FF0080FF00806B63580000003F1C124F3016DBC29AF4EC
        DE330A0E330A0EF4ECDEC9AF89F4ECDEC9AF89F4ECDEC9AF89F4ECDE4F301633
        0A0E4F3016000000FF0080FF0080FF008000FF0080FF0080FF00806B63580000
        004D3824330A0E4F3016F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4
        ECDEF4ECDE330A0E330A0E4F3016330A0E000000FF0080FF0080FF008000FF00
        80FF0080FF00806B63580000004426164F3016330A0E4F30164F3016330A0E33
        0A0E4F3016330A0E4F3016330A0E4F3016330A0E4F3016330A0E4F3016000000
        FF0080FF0080FF008000FF0080FF0080FF00806B63580000004D3824330A0E4F
        3016330A0E330A0E4F30164F3016330A0E4F3016330A0E4F3016330A0E4F3016
        330A0E4F3016330A0E000000FF0080FF0080FF008000FF0080FF0080FF00806B
        63580000003F1C12C9AF89C9AF89C9AF89C9AF89C9AF89C9AF89C9AF89C9AF89
        C9AF89C9AF89C9AF89C9AF89C9AF89330A0E4F3016000000FF0080FF0080FF00
        8000FF0080FF0080FF00806B63580000004D3824F4ECDEF4ECDEF4ECDEF4ECDE
        F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE4F3016330A
        0E000000FF0080FF0080FF008000FF0080FF0080FF00806B63580000003F1C12
        F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4EC
        DEF4ECDEF4ECDE330A0E4F3016000000FF0080FF0080FF008000FF0080FF0080
        FF00806B63580000004D3824F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4EC
        DEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE4F3016330A0E000000FF0080FF
        0080FF008000FF0080FF0080FF00806B63580000003F1C12F4ECDEF4ECDEF4EC
        DEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE33
        0A0E4F3016000000FF0080FF0080FF008000FF0080FF0080FF00806B63580000
        004D3824F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4
        ECDEF4ECDEF4ECDEF4ECDE4F3016330A0E000000FF0080FF0080FF008000FF00
        80FF0080FF00806B63580000003F1C12F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4
        ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE330A0E4F3016000000
        FF0080FF0080FF008000FF0080FF0080FF00806B63580000003F1C12F4ECDEF4
        ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE
        F4ECDE330A0EF4ECDE000000FF0080FF0080FF008000FF0080FF0080FF00806B
        63580000004D3824F4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDEF4ECDE
        F4ECDEF4ECDEF4ECDEF4ECDEF4ECDE4F3016330A0E000000FF0080FF0080FF00
        8000FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF008000FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF008000FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF008000}
      ParentShowHint = False
      ShowHint = True
      OnClick = bguardar2Click
    end
    object Label3: TLabel
      Left = 15
      Top = 58
      Width = 104
      Height = 15
      Caption = 'PRECIO UNITARIO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 335
      Top = 58
      Width = 78
      Height = 15
      Caption = 'PRECIO DOCE:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 174
      Top = 58
      Width = 71
      Height = 15
      Caption = 'PRECIO SEIS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eclave: TLabel
      Left = 19
      Top = 106
      Width = 34
      Height = 15
      Caption = 'CLAVE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Eproducto: TEdit
      Left = 8
      Top = 26
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = EproductoExit
      OnKeyUp = EprecioKeyUp
    end
    object eprecio_uni: TEdit
      Left = 15
      Top = 79
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyUp = EprecioKeyUp
    end
    object eprecio_seis: TEdit
      Left = 174
      Top = 79
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyUp = EprecioKeyUp
    end
    object eprecio_doce: TEdit
      Left = 335
      Top = 79
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyUp = EprecioKeyUp
    end
  end
  object Eiva: TEdit
    Left = 19
    Top = 165
    Width = 57
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyUp = EprecioKeyUp
  end
  object Eieps: TEdit
    Left = 108
    Top = 165
    Width = 54
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyUp = EprecioKeyUp
  end
  object Sqlred: TFDQuery
    AfterEdit = SqlredAfterPost
    AfterPost = SqlredAfterPost
    AfterDelete = SqlredAfterPost
    Connection = Modulo.Conector
    Left = 316
    Top = 148
  end
  object QryEmpaque: TFDQuery
    AfterEdit = SqlredAfterPost
    AfterPost = SqlredAfterPost
    AfterDelete = SqlredAfterPost
    Connection = Modulo.Conector
    Left = 364
    Top = 148
  end
  object DsEmpaque: TDataSource
    DataSet = QryEmpaque
    Left = 404
    Top = 149
  end
end
