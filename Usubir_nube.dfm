object FSubir_nube: TFSubir_nube
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Subir a la nube'
  ClientHeight = 394
  ClientWidth = 450
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
  object Bsubir: TSpeedButton
    Left = 8
    Top = 357
    Width = 193
    Height = 35
    Caption = 'Subir a internet inventario ftp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BsubirClick
  end
  object Label1: TLabel
    Left = 16
    Top = 83
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
  object Bagentes: TSpeedButton
    Left = 0
    Top = 0
    Width = 450
    Height = 77
    Align = alTop
    Caption = 'Subir inventario 2021'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BagentesClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 105
    Width = 435
    Height = 246
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
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 270
    Top = 120
  end
  object Dsmemtable: TDataSource
    DataSet = FDMemTable1
    Left = 334
    Top = 119
  end
  object Sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 390
    Top = 120
  end
  object Dsmemtable2: TDataSource
    DataSet = FDMemTable2
    Left = 334
    Top = 167
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 270
    Top = 168
  end
  object SMTP: TIdSMTP
    Port = 587
    SASLMechanisms = <>
    Left = 16
    Top = 112
  end
  object mailMensaje: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 64
    Top = 112
  end
  object SSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':587'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 16
    Top = 168
  end
end
