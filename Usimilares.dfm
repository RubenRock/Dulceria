object Fsimilares: TFsimilares
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Similares'
  ClientHeight = 490
  ClientWidth = 660
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
  object SpeedButton1: TSpeedButton
    Left = 303
    Top = 236
    Width = 78
    Height = 33
    Hint = 'Guardar'
    Caption = '->'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 303
    Top = 310
    Width = 78
    Height = 33
    Hint = 'Guardar'
    Caption = '<-'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 20
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
      Top = 41
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
      OnChange = EproductoChange
    end
  end
  object GridEmpaque: TDBGrid
    Left = 0
    Top = 104
    Width = 297
    Height = 387
    TabStop = False
    DataSource = Modulo.Dsinventarioaux
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUCTO'
        ReadOnly = True
        Width = 300
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 387
    Top = 104
    Width = 276
    Height = 387
    TabStop = False
    DataSource = Dssimilar
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
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUCTO'
        ReadOnly = True
        Width = 300
        Visible = True
      end>
  end
  object Qrysimilar: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from similar')
    Left = 480
    Top = 23
  end
  object Dssimilar: TDataSource
    DataSet = Qrysimilar
    Left = 568
    Top = 23
  end
  object QryAux: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from similar')
    Left = 392
    Top = 31
  end
end
