object Flista_similares: TFlista_similares
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Flista_similares'
  ClientHeight = 552
  ClientWidth = 487
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
  object Label1: TLabel
    Left = 8
    Top = 139
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 49
      Width = 147
      Height = 15
      Caption = 'NOMBRE IDENTIFICADOR:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bguardar2: TSpeedButton
      Left = 8
      Top = 6
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
    object Modificar: TSpeedButton
      Left = 102
      Top = 6
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
        00008000FF8000FF000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000008000FF8000FF8000
        FF8000FF00008000FF8000FF000000FFFFFFFFFFFFEAEAC4F4F4CAEAEAC4F4F4
        CAEAEAC4DCDCBEF4F4CAEAEAC4DCDCBEF4F4CADCDCBEF4F4CA0000008000FF80
        00FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFFEAEAC4F4
        F4CAEAEAC4F4F4CAEAEAC4DCDCBEF4F4CAEAEAC4DCDCBEF4F4CADCDCBE000000
        8000FF8000FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFF
        FFFFFFFDFDF3F4F4CAEAEAC4FDFDF3F4F4CADCDCBEF4F4CAF4F4CADCDCBEF4F4
        CA0000008000FF8000FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDF37E7E817E7E817E7E817E7E81A3A3A67E7E81A3
        A3A6A3A3A60000008000FF8000FF8000FF8000FF00008000FF8000FF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF3432B73432B7A3A3A6FDFDF3F4F4CAEAEAC4
        DCDCBEF4F4CADCDCBE0000008000FF8000FF8000FF8000FF00008000FF8000FF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9CFF9E9CFF48484AA3A3A6FDFD
        F3F4F4CAF4F4CADCDCBEF4F4CA0000008000FF8000FF8000FF8000FF00008000
        FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9CFFFFFFFF4B
        4B4BC8C8CAA3A3A6848486848486DCDCBE0000008000FF8000FF8000FF8000FF
        00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        00C0FF0699C90273A6C8C8CAFDFDF3F4F4CAEAEAC40000008000FF8000FF8000
        FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00C0FF0699C90273A6C8C8CAC8C8CAF4F4CA0000008000FF80
        00FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90273A6C8C8CAC8C8CA000000
        8000FF8000FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF0699C90273A6F4F4
        CA0000008000FF8000FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C0FF06
        99C90273A60000008000FF8000FF8000FF8000FF00008000FF8000FF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCBEDCDCBE
        DCDCBE00C0FF0699C90273A68000FF8000FF8000FF8000FF00008000FF8000FF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        0000000000000000000000C0FF89B7C76591A18000FF8000FF8000FF00008000
        FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFE1E1E4B0B0B19A9A9A4B4B4B9A9A9A00C0FF89B7C78000FF8000FF8000FF
        00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFFE1E1E4B0B0B14B4B4B8000FF8000FF8000FFA5D7E80000008000
        FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFFE1E1E44B4B4B8000FF8000FF8000FF8000FF8000FF80
        00FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF4B4B4B8000FF8000FF8000FF8000FF8000FF
        8000FF8000FF8000FF8000FF00008000FF8000FF000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000006666668000FF8000FF8000FF8000FF8000
        FF8000FF8000FF8000FF8000FF8000FF00008000FF8000FF0000000000000000
        000000000000000000000000000000000000008000FF8000FF8000FF8000FF80
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
      Left = 197
      Top = 6
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
    object LCLAVE: TLabel
      Left = 320
      Top = 40
      Width = 36
      Height = 13
      Caption = 'LCLAVE'
      Visible = False
    end
    object Eproducto: TEdit
      Left = 16
      Top = 70
      Width = 262
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EproductoKeyDown
    end
  end
  object Ebuscar: TEdit
    Left = 64
    Top = 137
    Width = 225
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = EbuscarChange
  end
  object GridEmpaque: TDBGrid
    Left = 0
    Top = 181
    Width = 487
    Height = 371
    TabStop = False
    Align = alBottom
    DataSource = Modulo.DsListaSimilar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDblClick = GridEmpaqueDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        ReadOnly = True
        Width = 300
        Visible = True
      end>
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 341
    Top = 64
  end
end
