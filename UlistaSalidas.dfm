object FListaSalidas: TFListaSalidas
  Left = 0
  Top = 0
  Caption = 'Lista de salidas'
  ClientHeight = 524
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotones: TPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 41
    Align = alTop
    Color = clBtnShadow
    TabOrder = 0
    object Agregar: TSpeedButton
      Left = 8
      Top = 3
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
    object Modificar: TSpeedButton
      Left = 110
      Top = 3
      Width = 81
      Height = 33
      Hint = 'Modificar'
      Flat = True
      Glyph.Data = {
        DA060000424DDA06000000000000360000002800000016000000190000000100
        180000000000A4060000000000000000000000000000000000008000FF8000FF
        8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
        FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF00008000
        FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
        00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
        00008000FF8000FF6666662E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E
        2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E8000FF8000FF8000
        FF8000FF00008000FF8000FF666666FFFFFFFFFFFFEAEAC4F4F4CAEAEAC4F4F4
        CAEAEAC4DCDCBEF4F4CAEAEAC4DCDCBEF4F4CADCDCBEF4F4CA2E2E2E8000FF80
        00FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFFEAEAC4F4
        F4CAEAEAC4F4F4CAEAEAC4DCDCBEF4F4CAEAEAC4DCDCBEF4F4CADCDCBE2E2E2E
        8000FF8000FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFF
        FFFFFFFDFDF3F4F4CAEAEAC4FDFDF3F4F4CADCDCBEF4F4CAF4F4CADCDCBEF4F4
        CA2E2E2E8000FF8000FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDF37E7E817E7E817E7E817E7E81A3A3A67E7E81A3
        A3A6A3A3A62E2E2E8000FF8000FF8000FF8000FF00008000FF8000FF666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF3432B73432B7A3A3A6FDFDF3F4F4CAEAEAC4
        DCDCBEF4F4CADCDCBE2E2E2E8000FF8000FF8000FF8000FF00008000FF8000FF
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716EF59E9CFF48484AA3A3A6FDFD
        F3F4F4CAF4F4CADCDCBEF4F4CA2E2E2E8000FF8000FF8000FF8000FF00008000
        FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716EF5FFFFFF4B
        4B4BC8C8CAA3A3A6848486848486DCDCBE2E2E2E8000FF8000FF8000FF8000FF
        00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        00C0FF0699C90273A6C8C8CAFDFDF3F4F4CAEAEAC42E2E2E8000FF8000FF8000
        FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00C0FF0699C90273A6C8C8CAC8C8CAF4F4CA2E2E2E8000FF80
        00FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90273A6C8C8CAC8C8CA2E2E2E
        8000FF8000FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90273A6F4F4
        CA2E2E2E8000FF8000FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF06
        99C90273A62E2E2E8000FF8000FF8000FF8000FF00008000FF8000FF666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCBEDCDCBE
        DCDCBE00C0FF0699C90273A68000FF8000FF8000FF8000FF00008000FF8000FF
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A9A9A9A4B4B
        4B05050505050505050500C0FF89B7C76591A18000FF8000FF8000FF00008000
        FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF
        FFFFE1E1E4B0B0B19A9A9A4B4B4B9A9A9AA5D7E889B7C78000FF8000FF8000FF
        00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9A9A9AFFFFFFE1E1E4B0B0B14B4B4B8000FF8000FF8000FFA5D7E80000008000
        FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9A9A9AFFFFFFE1E1E44B4B4B8000FF8000FF8000FF8000FF8000FF80
        00FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9A9A9AFFFFFF4B4B4B8000FF8000FF8000FF8000FF8000FF
        8000FF8000FF8000FF8000FF00008000FF8000FF666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF9A9A9A6666668000FF8000FF8000FF8000FF8000
        FF8000FF8000FF8000FF8000FF8000FF00008000FF8000FF6666666666666666
        666666666666666666666666666666666666668000FF8000FF8000FF8000FF80
        00FF8000FF8000FF8000FF8000FF8000FF8000FF00008000FF8000FF8000FF80
        00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
        8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF00008000FF8000FF
        8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
        FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = ModificarClick
    end
    object Eliminar: TSpeedButton
      Left = 213
      Top = 3
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 979
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 8
      Width = 50
      Height = 15
      Caption = 'BUSCAR:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Ebuscar: TEdit
      Left = 115
      Top = 6
      Width = 278
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyUp = EbuscarKeyUp
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 82
    Width = 979
    Height = 442
    Align = alClient
    DataSource = Modulo.DsSalidas
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'FOLIO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Visible = True
      end>
  end
end
