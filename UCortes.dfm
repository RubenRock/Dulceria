object FCortes: TFCortes
  Left = 0
  Top = 0
  Caption = 'Cortes'
  ClientHeight = 427
  ClientWidth = 720
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
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 329
    Height = 409
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 234
      Width = 42
      Height = 15
      Caption = 'FOLIOS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 266
      Width = 23
      Height = 15
      Caption = 'DEL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 302
      Width = 17
      Height = 15
      Caption = 'AL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Bcorte: TSpeedButton
      Left = 240
      Top = 59
      Width = 57
      Height = 30
      Caption = 'OK'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BcorteClick
    end
    object Label12: TLabel
      Left = 24
      Top = 42
      Width = 44
      Height = 15
      Caption = 'VENTAS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 24
      Top = 91
      Width = 23
      Height = 15
      Caption = 'DEL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 24
      Top = 167
      Width = 17
      Height = 15
      Caption = 'AL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Bhistorial: TSpeedButton
      Left = 17
      Top = 367
      Width = 280
      Height = 30
      Caption = 'Historial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = BhistorialClick
    end
    object Label15: TLabel
      Left = 59
      Top = 95
      Width = 31
      Height = 15
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 59
      Top = 171
      Width = 31
      Height = 15
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 59
      Top = 123
      Width = 26
      Height = 15
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 59
      Top = 199
      Width = 26
      Height = 15
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Efolioini: TEdit
      Left = 96
      Top = 262
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
    object Efoliofin: TEdit
      Left = 96
      Top = 294
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 5
    end
    object Ehoraini: TEdit
      Left = 96
      Top = 121
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
      OnChange = EfechainiChange
    end
    object Efechaini: TDateTimePicker
      Left = 96
      Top = 92
      Width = 121
      Height = 23
      Date = 43950.860184293980000000
      Time = 43950.860184293980000000
      Enabled = False
      TabOrder = 0
      OnChange = EfechainiChange
    end
    object Efechafin: TDateTimePicker
      Left = 96
      Top = 168
      Width = 121
      Height = 23
      Date = 43950.860184293980000000
      Time = 43950.860184293980000000
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnChange = EfechainiChange
    end
    object Ehorafin: TEdit
      Left = 96
      Top = 198
      Width = 121
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnChange = EfechainiChange
    end
  end
  object Panel1: TPanel
    Left = 347
    Top = 8
    Width = 358
    Height = 409
    TabOrder = 1
    object Bevel1: TBevel
      Left = 19
      Top = 288
      Width = 257
      Height = 28
    end
    object Label5: TLabel
      Left = 40
      Top = 87
      Width = 118
      Height = 20
      Caption = 'TOTAL CONTADO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lcontado: TLabel
      Left = 273
      Top = 87
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 40
      Top = 123
      Width = 108
      Height = 20
      Caption = 'TOTAL ABONOS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Labonos: TLabel
      Left = 273
      Top = 123
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 32
      Top = 42
      Width = 85
      Height = 20
      Caption = 'TOTAL NETO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Ltotal: TLabel
      Left = 238
      Top = 42
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 55
      Width = 282
      Height = 13
      Caption = '_______________________________________________'
    end
    object Label3: TLabel
      Left = 40
      Top = 221
      Width = 61
      Height = 20
      Caption = 'SALIDAS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lsalidas: TLabel
      Left = 273
      Top = 221
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Imprimir: TSpeedButton
      Left = 104
      Top = 351
      Width = 81
      Height = 33
      Hint = 'IMPRIMIR'
      Enabled = False
      Flat = True
      Glyph.Data = {
        6A080000424D6A0800000000000036000000280000001C000000190000000100
        1800000000003408000000000000000000000000000000000000FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF00809796978181817E7E817E7E817E7E817E7E817E7E81
        7E7E818181818181817E7E7E818181FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00809796977E
        7E81010A1E020A21020A21020A21010B23010B23000B21010B23010B27000B21
        818181FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080979697818181010B23061E4200568F00508600
        568F061E4200568F08244A00497C08244A010B27818181FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00809796
        977E7E7E020B171778B504163700508600497C00497C005086061E4200508606
        1E42003C6B010B23818181FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080979697818181010B1A136AA54AA1DB0416
        3700508600497C00497C041637005086061E4200497C08244A010B237E7E81FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        979697818181020B170A5B9E4AA1DB4AA1DB04163700568F0050860050860056
        8F08244A00568F08244A003C6B010B23818181FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080979697818181010A1E136AA54AA1DB
        4AA1DB002E6C010B1A010A26020B17010A1E010A1E010A1E010A1E000B21010B
        27010A1EFF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080818181010B1A136AA54AA1DB002E6C002E6CEDEEDF18181CF4F4E5
        B0B073E7E6C8B9B579E7E6C8B9B579E7E6C8C8C58318181CFF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080010B1A136AA54A
        A1DB002E6CEDEEDF171718FEFEFF171718FBFAF8C7C7A99B9B6BCFD0B59B9B6B
        CFCFB69B9B6BE5E4C918181CFF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF00800A5B9E136AA5003D79171718FEFDFD161719FE
        FEFF171718FBFAF892925ACFCFB69B9B6BD0D0B89B9B6BD0D0B8B0B073161719
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        800A5B9E002E6CEDEEDF171718FFFFFF161719FEFDFD161719F4F4EFF4F4EFB0
        B073E5E4C9B0B073E7E6C8B0B073E7E6C818181CFF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF00800A5B9E4C4B2DFEFEFF1717
        18FFFFFF171718E6E7B8FEFDFD1717181B1A1B1D1D271D1D271D1D271D1D2717
        1718161719FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080474338FFFEFD171718DCDCBEFEFEFF161719B1B3
        9A3B3B394D4D424D4D424D4D424949401D1D27FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        3B3B39DCDCBEFEFDFD18181C716F50716F5079797B79797B7D7D7D7575746F6F
        6F47484AFF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FEFDFD2322253B3B394F4E4F
        47484A4141454141453B3B393B3B392D2D30FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF00807575744141458C8D8727262B8C8D8747484A8C8D875B5B5C
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080
        FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF00
        80FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF0080FF
        0080FF0080FF0080FF0080FF0080}
      ParentShowHint = False
      ShowHint = True
      OnClick = ImprimirClick
    end
    object Label7: TLabel
      Left = 40
      Top = 190
      Width = 155
      Height = 20
      Caption = 'TOTAL DEVOLUCIONES:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LDevoluciones: TLabel
      Left = 273
      Top = 190
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lcreditos: TLabel
      Left = 234
      Top = 294
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 32
      Top = 294
      Width = 107
      Height = 20
      Caption = 'TOTAL CREDITO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 19
      Top = 262
      Width = 179
      Height = 20
      Caption = 'NOTAS CON DESCUENTOS:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object descuentos: TLabel
      Left = 279
      Top = 262
      Width = 8
      Height = 20
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object QryAux: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from salidas')
    Left = 176
    Top = 16
  end
  object DsAuxSalidas: TDataSource
    DataSet = QryAux
    Left = 228
    Top = 17
  end
end
