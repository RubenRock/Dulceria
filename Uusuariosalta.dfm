object Fusuariosalta: TFusuariosalta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Alta de usuarios'
  ClientHeight = 242
  ClientWidth = 319
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
  object GroupBox1: TGroupBox
    Left = 40
    Top = 24
    Width = 241
    Height = 49
    Caption = '  Nombre de usuario:  '
    TabOrder = 0
    object txtusuario: TEdit
      Left = 23
      Top = 17
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 40
    Top = 88
    Width = 241
    Height = 121
    Caption = ' Contrase'#241'a:  '
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 53
      Width = 108
      Height = 13
      Caption = 'Confirmar contrase'#241'a:'
    end
    object txtcontra: TEdit
      Left = 23
      Top = 24
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 0
    end
    object txtconfirmar: TEdit
      Left = 23
      Top = 76
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 1
      OnKeyUp = txtconfirmarKeyUp
    end
  end
end
