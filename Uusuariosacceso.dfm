object Fusuariosaccesos: TFusuariosaccesos
  Left = 0
  Top = 0
  Caption = 'Accesos'
  ClientHeight = 714
  ClientWidth = 1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1053
    Height = 121
    Align = alTop
    TabOrder = 0
    object Agregar: TSpeedButton
      Left = 295
      Top = 5
      Width = 81
      Height = 33
      Hint = 'ASIGNAR ACCESOS'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5000555555555555577755555555555550B0555555555555F7F7555555555550
        00B05555555555577757555555555550B3B05555555555F7F557555555555000
        3B0555555555577755755555555500B3B0555555555577555755555555550B3B
        055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
        555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
        55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
        555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
        55555575FFFF7755555555570000755555555557777775555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = AgregarClick
    end
    object Eliminar: TSpeedButton
      Left = 295
      Top = 66
      Width = 81
      Height = 33
      Hint = 'Eliminar'
      Flat = True
      Glyph.Data = {
        66090000424D660900000000000036000000280000001B0000001C0000000100
        1800000000003009000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000081
        8181CDCDCD000000818181CDCDCD000000818181CDCDCD000000818181CDCDCD
        000000818181000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF000000818181CDCDCD000000818181CD
        CDCD000000818181CDCDCD000000818181CDCDCD000000818181000000FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000818181CDCDCD000000818181CDCDCD000000818181CDCDCD00
        0000818181CDCDCD000000818181000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000818181CDCD
        CD000000818181CDCDCD000000818181CDCDCD000000818181CDCDCD00000081
        8181000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0000004B4B4B8181814B4B4B4B4B4B8181814B4B
        4B4B4B4B8181814B4B4B4B4B4B8181814B4B4B4B4B4B000000FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FF0000004B4B4B818181818181818181
        CDCDCDCDCDCDFFFFFFFFFFFFCDCDCDCDCDCDCDCDCD8181818181818181818181
        814B4B4B000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF
        00FFFF00FF0000004B4B4B818181818181818181CDCDCDCDCDCDFFFFFFFFFFFF
        CDCDCDCDCDCDCDCDCD8181818181818181818181814B4B4B000000FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF595959FFFFFFD1C5A6A3A3A6D1
        C5A6595959D1C5A6FFFFFF686869FF00FFFF00FFFF00FFFF00FF000000000000
        000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF595959FFFFFFD1C5A6595959D1C5A6A2A29ED1C5A6595959FFFFFFFF
        FFFF686869FF00FFFF00FF0000000000004B4B4B4B4B4B000000FF00FFFF00FF
        FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF595959FFFFFFD1C5A65959
        59D1C5A6595959D1C5A6A3A3A6FFFFFFFFFFFFFFFFFFFFFFFFFF00FF00000000
        00000000004B4B4B4B4B4B000000FF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FF595959FFFFFFD1C5A6595959D1C5A6595959D1C5A6595959FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000818181000000FF
        00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFFFFFFD1C5A6
        595959D1C5A6595959D1C5A6595959FFFFFFFFFFFFA65400FFFFFFFFFFFFFF00
        FF000000000000000000CDCDCDCDCDCD000000FF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFD1C5A6595959D1C5A6595959
        FFFFFFFFFFFFA65400FFFFFFFFFFFFFF00FF000000000000000000000000FFFF
        FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFFFFFFFFFFFFD1C5A6595959FFFFFFFFFFFFA65400FFFFFFFFFFFF
        FF00FFFF00FF000000000000000000FFFFFFFFFFFF000000FF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
        FFFFFFFFFFFFFFFFA65400FFFFFFFFFFFFFF00FFFF00FF000000000000000000
        000000FFFFFF000000C0C0C1000000000000FF00FFFF00FFFF00FF000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00FFFF00FFFF00FF000000000000000000CDCDCDCDCDCD000000BEBEBF
        BEBEBF000000FF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FF00000000
        0000000000818181818181000000000000BDBBBDBDBBBD000000FF00FFFF00FF
        FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFFFFFFFF00FFFF00FFFF00FFFF00FF0000000000004B4B4B4B4B4B000000FF
        00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0000004B4B4B4B4B4B000000FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = EliminarClick
    end
    object Lista: TDBLookupListBox
      Left = 48
      Top = 5
      Width = 193
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'PASSWD'
      ListField = 'LOGIN'
      ListSource = Modulo.DsUsuarios
      ParentFont = False
      TabOrder = 0
      OnClick = ListaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 1053
    Height = 593
    Align = alClient
    TabOrder = 1
    ExplicitTop = 137
    object Btodo: TSpeedButton
      Left = 48
      Top = 9
      Width = 81
      Height = 33
      Hint = 'TODO'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
        FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
        FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
        FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
        00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
        55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
        5555777577775755555550FBFB0555555555575FFF7555555555570000755555
        5555557777555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = BtodoClick
    end
    object Bnada: TSpeedButton
      Left = 200
      Top = 9
      Width = 81
      Height = 33
      Hint = 'NINGUNO'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = BnadaClick
    end
    object SpeedButton3: TSpeedButton
      Left = 352
      Top = 9
      Width = 81
      Height = 33
      Hint = 'VENDEDORES'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object GroupBox9: TGroupBox
      Left = 520
      Top = 324
      Width = 137
      Height = 117
      Caption = '  DEVOLUCIONES  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object DeAgregar: TCheckBox
        Left = 32
        Top = 36
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DeEliminar: TCheckBox
        Left = 32
        Top = 80
        Width = 97
        Height = 17
        Caption = 'ELIMINAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 48
      Width = 137
      Height = 221
      Caption = '  REMISIONES  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Ragregar: TCheckBox
        Left = 12
        Top = 40
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Rmodificar: TCheckBox
        Left = 12
        Top = 88
        Width = 97
        Height = 17
        Caption = 'REIMPRIMIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Rcambiar: TCheckBox
        Left = 12
        Top = 132
        Width = 122
        Height = 17
        Caption = 'CAMBIAR PRECIOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Raumentar: TCheckBox
        Left = 12
        Top = 181
        Width = 122
        Height = 17
        Caption = 'AUMENTAR PRECIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 192
      Top = 48
      Width = 137
      Height = 265
      Caption = '  INVENTARIO  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object ivisualizar: TCheckBox
        Left = 24
        Top = 16
        Width = 97
        Height = 17
        Caption = 'VISUALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Iagregar: TCheckBox
        Left = 24
        Top = 51
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Imodificar: TCheckBox
        Left = 24
        Top = 87
        Width = 97
        Height = 17
        Caption = 'MODIFICAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Ieliminar: TCheckBox
        Left = 24
        Top = 123
        Width = 97
        Height = 23
        Caption = 'ELIMINAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object INUBE: TCheckBox
        Left = 24
        Top = 159
        Width = 97
        Height = 23
        Caption = 'DESCARGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object ISUBIR: TCheckBox
        Left = 24
        Top = 195
        Width = 97
        Height = 23
        Caption = 'SUBIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object IEXISTENCIAS: TCheckBox
        Left = 23
        Top = 224
        Width = 97
        Height = 23
        Caption = 'EXISTENCIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
    end
    object GroupBox3: TGroupBox
      Left = 360
      Top = 52
      Width = 137
      Height = 221
      Caption = '  PROVEEDORES  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Prvisualizar: TCheckBox
        Left = 32
        Top = 40
        Width = 97
        Height = 17
        Caption = 'VISUALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Pragregar: TCheckBox
        Left = 32
        Top = 86
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Prmodificar: TCheckBox
        Left = 32
        Top = 132
        Width = 97
        Height = 17
        Caption = 'MODIFICAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Preliminar: TCheckBox
        Left = 32
        Top = 178
        Width = 97
        Height = 17
        Caption = 'ELIMINAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object GroupBox4: TGroupBox
      Left = 520
      Top = 52
      Width = 137
      Height = 181
      Caption = '  USUARIOS  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Uvisualizar: TCheckBox
        Left = 32
        Top = 40
        Width = 97
        Height = 17
        Caption = 'VISUALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Umodificar: TCheckBox
        Left = 32
        Top = 88
        Width = 97
        Height = 17
        Caption = 'MODIFICAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Ueliminar: TCheckBox
        Left = 32
        Top = 136
        Width = 97
        Height = 17
        Caption = 'ELIMINAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox5: TGroupBox
      Left = 688
      Top = 52
      Width = 137
      Height = 181
      Caption = '  RECEPCIONES  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Revisualizar: TCheckBox
        Left = 32
        Top = 40
        Width = 97
        Height = 17
        Caption = 'VISUALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Reagregar: TCheckBox
        Left = 32
        Top = 88
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Remodificar: TCheckBox
        Left = 32
        Top = 136
        Width = 97
        Height = 17
        Caption = 'MODIFICAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox6: TGroupBox
      Left = 24
      Top = 324
      Width = 137
      Height = 125
      Caption = '  SALIDAS  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object SaliAgregar: TCheckBox
        Left = 32
        Top = 40
        Width = 97
        Height = 17
        Caption = 'AGREGAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object SaliModificar: TCheckBox
        Left = 32
        Top = 88
        Width = 97
        Height = 17
        Caption = 'MODIFICAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 192
      Top = 324
      Width = 137
      Height = 125
      Caption = '  CLIENTES  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Clieasignar: TCheckBox
        Left = 4
        Top = 40
        Width = 128
        Height = 17
        Caption = 'ASIGNAR CREDITO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Cliecancelar: TCheckBox
        Left = 4
        Top = 88
        Width = 128
        Height = 17
        Caption = 'CANCELAR CREDITO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 360
      Top = 324
      Width = 137
      Height = 77
      Caption = ' ABONOS '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object Abeliminar: TCheckBox
        Left = 32
        Top = 36
        Width = 97
        Height = 17
        Caption = 'ELIMINAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox10: TGroupBox
      Left = 688
      Top = 324
      Width = 137
      Height = 141
      Caption = '  EXTRAS  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object Exrespaldar: TCheckBox
        Left = 19
        Top = 40
        Width = 128
        Height = 17
        Caption = 'RESPALDAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Exajustes: TCheckBox
        Left = 19
        Top = 72
        Width = 128
        Height = 17
        Caption = 'AJUSTES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object CCajero: TCheckBox
        Left = 19
        Top = 104
        Width = 128
        Height = 17
        Caption = 'CAJERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox11: TGroupBox
      Left = 858
      Top = 52
      Width = 137
      Height = 77
      Caption = ' REPARTOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object Rrepartos: TCheckBox
        Left = 32
        Top = 36
        Width = 97
        Height = 17
        Caption = 'ACTUALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox12: TGroupBox
      Left = 858
      Top = 180
      Width = 137
      Height = 77
      Caption = ' CORTES '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object Ccortes: TCheckBox
        Left = 32
        Top = 36
        Width = 97
        Height = 17
        Caption = 'CORTES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object grupo_cancelar: TGroupBox
      Left = 858
      Top = 324
      Width = 137
      Height = 77
      Caption = ' CANCELAR NOTAS '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      object cancelar: TCheckBox
        Left = 32
        Top = 36
        Width = 97
        Height = 17
        Caption = 'CANCELAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 504
    Top = 32
  end
end
