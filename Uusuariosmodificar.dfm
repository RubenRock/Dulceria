object Fusuariosmodificar: TFusuariosmodificar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Modificar usuarios'
  ClientHeight = 327
  ClientWidth = 320
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
    object cmbusuario: TDBLookupComboBox
      Left = 23
      Top = 17
      Width = 201
      Height = 21
      KeyField = 'PASSWD'
      ListField = 'LOGIN'
      ListSource = Modulo.DsUsuarios
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 40
    Top = 88
    Width = 241
    Height = 209
    Caption = ' Contrase'#241'a:  '
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 141
      Width = 108
      Height = 13
      Caption = 'Confirmar contrase'#241'a:'
    end
    object Label2: TLabel
      Left = 13
      Top = 29
      Width = 101
      Height = 13
      Caption = 'Contrase'#241'a anterior:'
    end
    object Label3: TLabel
      Left = 13
      Top = 82
      Width = 92
      Height = 13
      Caption = 'Nueva contrase'#241'a:'
    end
    object txtnvacontra: TEdit
      Left = 23
      Top = 104
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 1
    end
    object txtconfirmar: TEdit
      Left = 23
      Top = 164
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 2
      OnKeyUp = txtconfirmarKeyUp
    end
    object txtcontraante: TEdit
      Left = 23
      Top = 52
      Width = 194
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 0
    end
  end
end
