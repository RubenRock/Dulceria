object Fabonos: TFabonos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Abonos'
  ClientHeight = 494
  ClientWidth = 368
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
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 329
    Height = 225
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 58
      Width = 55
      Height = 15
      Caption = 'CLIENTES:'
    end
    object Label2: TLabel
      Left = 32
      Top = 110
      Width = 39
      Height = 15
      Caption = 'FECHA:'
    end
    object Label3: TLabel
      Left = 32
      Top = 164
      Width = 64
      Height = 15
      Caption = 'CANTIDAD:'
    end
    object Label4: TLabel
      Left = 32
      Top = 10
      Width = 37
      Height = 15
      Caption = 'FOLIO:'
    end
    object fecha: TDateTimePicker
      Left = 27
      Top = 131
      Width = 249
      Height = 23
      Date = 39398.468688148100000000
      Time = 39398.468688148100000000
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Cantidad: TEdit
      Left = 27
      Top = 183
      Width = 249
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Eclientes: TEdit
      Left = 27
      Top = 79
      Width = 249
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Efolio: TEdit
      Left = 27
      Top = 31
      Width = 94
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 16
    Top = 240
    Width = 329
    Height = 241
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Bguardar: TSpeedButton
      Left = 33
      Top = 192
      Width = 97
      Height = 30
      Caption = 'OK'
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
      OnClick = BguardarClick
    end
    object Label5: TLabel
      Left = 32
      Top = 10
      Width = 98
      Height = 15
      Caption = 'ABONO NUMERO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Labono: TLabel
      Left = 215
      Top = 10
      Width = 7
      Height = 15
      Alignment = taRightJustify
      Caption = '0'
    end
    object Label6: TLabel
      Left = 32
      Top = 44
      Width = 76
      Height = 15
      Caption = 'DEUDA TOTAL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Ldeuda: TLabel
      Left = 185
      Top = 44
      Width = 40
      Height = 15
      Alignment = taRightJustify
      Caption = 'Ldeuda'
    end
    object Label7: TLabel
      Left = 32
      Top = 78
      Width = 96
      Height = 15
      Caption = 'TOTAL ABONADO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Ltotalabonado: TLabel
      Left = 148
      Top = 78
      Width = 79
      Height = 15
      Alignment = taRightJustify
      Caption = 'Ltotalabonado'
    end
    object Label8: TLabel
      Left = 32
      Top = 152
      Width = 35
      Height = 15
      Caption = 'RESTA:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Lresto: TLabel
      Left = 192
      Top = 152
      Width = 35
      Height = 15
      Alignment = taRightJustify
      Caption = 'Lresto'
    end
    object Label9: TLabel
      Left = 32
      Top = 115
      Width = 88
      Height = 15
      Caption = 'DEVOLUCIONES:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Ldevoluciones: TLabel
      Left = 148
      Top = 115
      Width = 79
      Height = 15
      Alignment = taRightJustify
      Caption = 'Ldevoluciones'
    end
    object BCancelar: TBitBtn
      Left = 186
      Top = 192
      Width = 95
      Height = 30
      Caption = 'CANCELAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BCancelarClick
    end
  end
  object Sqlaux: TFDQuery
    Connection = Modulo.Conector
    Left = 300
    Top = 256
  end
end
