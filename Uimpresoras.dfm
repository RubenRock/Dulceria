object Fimpresora: TFimpresora
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Impresoras'
  ClientHeight = 113
  ClientWidth = 541
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
    Left = 479
    Top = 32
    Width = 58
    Height = 34
    Caption = 'OK'
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 97
    Caption = '  Escribir nombre de la impresora:  '
    TabOrder = 0
    object Label3: TLabel
      Left = 13
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Notas:'
    end
    object Label4: TLabel
      Left = 13
      Top = 61
      Width = 37
      Height = 13
      Caption = 'Tickets:'
    end
    object Cnotas: TComboBox
      Left = 75
      Top = 21
      Width = 380
      Height = 21
      TabOrder = 0
      Text = 'Impresora para Notas'
    end
    object Ctickets: TComboBox
      Left = 75
      Top = 58
      Width = 380
      Height = 21
      TabOrder = 1
      Text = 'Impresora para Tickets'
    end
  end
end
