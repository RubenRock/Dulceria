object Fdatos2: TFdatos2
  Left = 300
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Productos'
  ClientHeight = 354
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 10
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
  object Label2: TLabel
    Left = 123
    Top = 10
    Width = 71
    Height = 17
    Caption = 'PRODUCTO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 496
    Top = 10
    Width = 48
    Height = 17
    Caption = 'PRECIO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 729
    Top = 80
    Width = 92
    Height = 121
    TabOrder = 4
    object Button1: TButton
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
      OnClick = Button1Click
    end
    object Button2: TButton
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
      OnClick = Button2Click
    end
  end
  object precio: TEdit
    Left = 495
    Top = 26
    Width = 85
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnKeyUp = precioKeyUp
  end
  object cantidad: TMaskEdit
    Left = 17
    Top = 26
    Width = 88
    Height = 25
    EditMask = '0999;1; '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = '    '
    OnChange = cantidadChange
  end
  object eprodu: TEdit
    Left = 123
    Top = 26
    Width = 350
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
  object GRIDPRODUCTOS: TDBGrid
    Left = 123
    Top = 59
    Width = 350
    Height = 286
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
    OnCellClick = GRIDPRODUCTOSCellClick
    OnEnter = GRIDPRODUCTOSEnter
    OnExit = GRIDPRODUCTOSExit
    OnKeyDown = GRIDPRODUCTOSKeyDown
    OnKeyUp = GRIDPRODUCTOSKeyUp
    OnMouseActivate = GRIDPRODUCTOSMouseActivate
    OnMouseWheelDown = GRIDPRODUCTOSMouseWheelDown
    Columns = <
      item
        Expanded = False
        FieldName = 'producto'
        Width = 280
        Visible = True
      end>
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector2
    Left = 617
    Top = 31
  end
end
