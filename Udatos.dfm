object Fdatos: TFdatos
  Left = 400
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Productos'
  ClientHeight = 367
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 15
    Caption = 'CANTIDAD:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 121
    Top = 7
    Width = 80
    Height = 15
    Caption = 'PRODUCTO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 438
    Top = 8
    Width = 55
    Height = 15
    Caption = 'PRECIO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 520
    Top = 275
    Width = 103
    Height = 21
    Caption = 'EXISTENCIAS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LExistencias: TLabel
    Left = 669
    Top = 299
    Width = 9
    Height = 21
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object precio: TEdit
    Left = 438
    Top = 31
    Width = 106
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object eprodu: TEdit
    Left = 121
    Top = 31
    Width = 311
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = eproduChange
    OnKeyDown = eproduKeyDown
  end
  object Panel1: TPanel
    Left = 625
    Top = 65
    Width = 92
    Height = 121
    TabOrder = 5
    object Baceptar: TButton
      Left = 9
      Top = 24
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
      TabOrder = 0
      OnClick = BaceptarClick
    end
    object Bcancelar: TButton
      Left = 9
      Top = 72
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
      TabOrder = 1
      OnClick = BcancelarClick
    end
  end
  object GRIDPRODUCTOS: TDBGrid
    Left = 121
    Top = 61
    Width = 311
    Height = 301
    Color = clBtnFace
    DataSource = Modulo.Dsinventarioaux
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    Options = [dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawDataCell = GRIDPRODUCTOSDrawDataCell
    OnEnter = GRIDPRODUCTOSEnter
    OnExit = GRIDPRODUCTOSExit
    OnKeyDown = GRIDPRODUCTOSKeyDown
    OnKeyUp = GRIDPRODUCTOSKeyUp
    OnMouseActivate = GRIDPRODUCTOSMouseActivate
    OnMouseWheel = GRIDPRODUCTOSMouseWheel
    Columns = <
      item
        Expanded = False
        FieldName = 'producto'
        Visible = True
      end>
  end
  object CSurtir: TCheckBox
    Left = -31
    Top = 241
    Width = 154
    Height = 17
    Caption = '&SURTIR PRODUCTO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnKeyUp = CSurtirKeyUp
  end
  object cantidad: TEdit
    Left = 8
    Top = 31
    Width = 104
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = cantidadChange
    OnKeyDown = cantidadKeyDown
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 16
    Top = 128
  end
  object Sqlred2: TFDQuery
    Connection = Modulo.Conector
    Left = 16
    Top = 176
  end
  object QryAux: TFDQuery
    Connection = Modulo.Conector
    Left = 454
    Top = 72
  end
end
