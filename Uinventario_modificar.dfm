object Finventario_modificar: TFinventario_modificar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Actualizar inventario'
  ClientHeight = 209
  ClientWidth = 508
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
  object eclave: TLabel
    Left = 318
    Top = 142
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
  object LID: TLabel
    Left = 400
    Top = 146
    Width = 13
    Height = 15
    Caption = 'ID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 218
    Top = 146
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
    Left = 15
    Top = 146
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
    Left = 116
    Top = 146
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 137
    Align = alTop
    TabOrder = 4
    ExplicitLeft = 8
    ExplicitTop = -5
    ExplicitWidth = 613
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
      Left = 419
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
      OnKeyUp = eprecio_uniKeyUp
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
      OnKeyUp = eprecio_uniKeyUp
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
      OnKeyUp = eprecio_uniKeyUp
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
      OnKeyUp = eprecio_uniKeyUp
    end
  end
  object epiezas: TEdit
    Left = 218
    Top = 167
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
    OnKeyUp = eprecio_uniKeyUp
  end
  object Button2: TButton
    Left = 625
    Top = 109
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'CANCELAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Eiva: TEdit
    Left = 15
    Top = 167
    Width = 57
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyUp = eprecio_uniKeyUp
  end
  object Eieps: TEdit
    Left = 116
    Top = 167
    Width = 54
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyUp = eprecio_uniKeyUp
  end
  object Sqlred: TFDQuery
    AfterEdit = SqlredAfterPost
    AfterPost = SqlredAfterPost
    AfterDelete = SqlredAfterPost
    AfterExecute = SqlredAfterExecute
    Connection = Modulo.Conector
    Left = 44
    Top = 104
  end
  object QryEmpaque: TFDQuery
    AfterEdit = SqlredAfterPost
    AfterPost = SqlredAfterPost
    AfterDelete = SqlredAfterPost
    Connection = Modulo.Conector
    Left = 108
    Top = 104
  end
  object DsEmpaque: TDataSource
    DataSet = QryEmpaque
    Left = 164
    Top = 105
  end
end
