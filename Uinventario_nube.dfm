object Finventario_nube: TFinventario_nube
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Nube'
  ClientHeight = 587
  ClientWidth = 448
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
  object SpeedButton2: TSpeedButton
    Left = 287
    Top = 553
    Width = 153
    Height = 31
    Caption = 'Descargar inventario ftp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 16
    Top = 77
    Width = 319
    Height = 16
    Caption = 'Informacion del proceso de actualizacion del inventario:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 217
    Width = 176
    Height = 16
    Caption = 'Ultimos productos actualizados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 0
    Top = 0
    Width = 448
    Height = 71
    Align = alTop
    Caption = 'Descargar inventario 2021'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton4Click
    ExplicitLeft = -5
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 435
    Height = 115
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 441
    Width = 435
    Height = 106
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 256
      Height = 16
      Caption = 'Actualizacion del inventario de manera local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 27
      Width = 161
      Height = 43
      Caption = 'Crear archivo actualizado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 260
      Top = 27
      Width = 153
      Height = 43
      Caption = 'Actualizar inventario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 240
    Width = 432
    Height = 183
    DataSource = DsActualizados
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Dsmemtable2: TDataSource
    DataSet = FDMemTable2
    Left = 78
    Top = 153
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 14
    Top = 154
  end
  object Dsmemtable: TDataSource
    DataSet = FDMemTable1
    Left = 78
    Top = 105
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 14
    Top = 106
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 134
    Top = 106
  end
  object qryActualizados: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from inventario order by producto')
    Left = 400
    Top = 359
  end
  object DsActualizados: TDataSource
    DataSet = qryActualizados
    Left = 400
    Top = 407
  end
end
