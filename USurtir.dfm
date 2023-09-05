object Fsurtir: TFsurtir
  Left = 0
  Top = 0
  Caption = 'Fsurtir'
  ClientHeight = 512
  ClientWidth = 940
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
  object panel1: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 241
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Lproducto: TLabel
      Left = 683
      Top = 180
      Width = 78
      Height = 21
      Caption = 'Lproducto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 697
      Top = 15
      Width = 232
      Height = 21
      Caption = 'PRODUCTOS SELECCIONADOS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lpiezas: TLabel
      Left = 697
      Top = 42
      Width = 58
      Height = 21
      Caption = 'PIEZAS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 5
      Width = 68
      Height = 17
      Caption = 'CANTIDAD:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 84
      Width = 58
      Height = 21
      Caption = 'PIEZAS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lpiezas_agregadas: TLabel
      Left = 92
      Top = 111
      Width = 9
      Height = 21
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Agregar: TSpeedButton
      Left = 15
      Top = 202
      Width = 81
      Height = 33
      Hint = 'Agregar'
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C006000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000002E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
        2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E0000000000000000
        00000000000000000000000000000000666666FFFFFFFFFFFFFFFFFFF4F4CAEA
        EAC4F4F4CAEAEAC4F4F4CAF4F4CADCDCBEF4F4CAEAEAC4DCDCBEEAEAC42E2E2E
        000000000000000000000000000000000000000000000000666666FFFFFFFFFF
        FFFFFFFFFFFFFFF4F4CAEAEAC4F4F4CAEAEAC4DCDCBEF4F4CAEAEAC4DCDCBEF4
        F4CADCDCBE2E2E2E000000000000000000000000000000000000000000000000
        666666FFFFFFFFFFFFFFFFFFFFFFFFFDFDF3FDFDF3F4F4CAF4F4CAF4F4CADCDC
        BEF4F4CAF4F4CADCDCBEF4F4CA2E2E2E00000000000000000000000000000000
        0000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007E7E81
        7E7E817E7E817E7E817E7E817E7E817E7E817E7E812E2E2E0000000000000000
        00000000000000000000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA5D7E87AA8B8FDFDF3F4F4CAEAEAC4DCDCBEF4F4CADCDCBE2E2E2E
        000000000000000000000000000000000000000000000000666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D7E86591A17E7E81F4F4CAF4F4CADC
        DCBEF4F4CA2E2E2E000000000000000000000000000000000000000000000000
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5D7E80699C90062
        957E7E81EAEAC4F4F4CADCDCBE2E2E2E00000000000000000000000000000000
        0000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00C0FF0699C90062957E7E81F4F4CAEAEAC42E2E2E0000000000000000
        00000000000000000000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90062957E7E81F4F4CA2E2E2E
        000000000000000000000000000000000000000000000000666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C900
        62957E7E812E2E2E000000000000000000000000000000000000000000000000
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF00C0FF0699C90062957E7E8100000000000000000000000000000000
        0000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90062957E7E810000000000
        00000000000000000000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCBEDCDCBEDCDCBE00C0FF0699C9
        0062957E7E81000000000000000000000000000000000000666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A9A9A9A4B4B4B4B4B4B4B4B4B4B
        4B4B0505059A9A9AFFFFFF3432B77E7E81000000000000000000000000000000
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFFFFFFE1E1
        E4B0B0B19A9A9A4B4B4B000000000000716EF59E9CFF3432B700000000000000
        0000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9A9A9AFFFFFFE1E1E4B0B0B14B4B4B0000000000000000FF000000716EF50000
        00000000000000000000000000000000666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9A9A9AFFFFFFE1E1E44B4B4B0000000000000000000000FF
        000000000000000000000000000000000000000000000000666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFFFFFF4B4B4B00000000000000
        00FF0000FF0000FF0000FF0000FF000000000000000000000000000000000000
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A4B4B4B0000
        000000000000000000000000000000FF00000000000000000000000000000000
        0000000000000000666666666666666666666666666666666666666666666666
        6666660000000000000000000000000000000000000000FF0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = AgregarClick
    end
    object Liva: TLabel
      Left = 684
      Top = 207
      Width = 23
      Height = 21
      Caption = 'iva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Lempaque: TLabel
      Left = 684
      Top = 149
      Width = 80
      Height = 21
      Caption = 'Lempaque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Lclave: TLabel
      Left = 685
      Top = 118
      Width = 48
      Height = 21
      Caption = 'Lclave'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object GRIDEMPAQUE: TDBGrid
      Left = 488
      Top = 6
      Width = 186
      Height = 229
      DataSource = Modulo.DsEmpaque
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEnter = GRIDEMPAQUEEnter
      OnExit = GRIDEMPAQUEExit
      Columns = <
        item
          Expanded = False
          FieldName = 'empaque'
          Title.Caption = 'EMPAQUE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end>
    end
    object Gridproductos: TDBGrid
      Left = 127
      Top = 6
      Width = 338
      Height = 229
      DataSource = DsAux
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = cl3DDkShadow
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Options = [dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEnter = GridproductosEnter
      OnExit = GridproductosExit
      Columns = <
        item
          Expanded = False
          FieldName = 'producto'
          Title.Caption = 'PRODUCTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 310
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 957
      Top = 109
      Width = 75
      Height = 25
      Caption = 'ACEPTAR'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object cantidad: TEdit
      Left = 15
      Top = 28
      Width = 86
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 241
    Width = 940
    Height = 271
    Align = alClient
    DataSource = Modulo.DsSurtir
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnKeyUp = DBGrid1KeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'cantidad'
        Title.Caption = 'CANTIDAD'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empaque'
        Title.Caption = 'EMPAQUE'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'producto'
        Title.Caption = 'PRODUCTO'
        Width = 400
        Visible = True
      end>
  end
  object QryAux: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      '')
    Left = 136
    Top = 36
  end
  object DsAux: TDataSource
    DataSet = QryAux
    Left = 187
    Top = 40
  end
  object Qryred: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      '')
    Left = 704
    Top = 76
  end
end
