object Fverificausu: TFverificausu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Verificar usuario'
  ClientHeight = 43
  ClientWidth = 205
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
  object Lusuario: TLabel
    Left = 64
    Top = 29
    Width = 40
    Height = 13
    Caption = 'Lusuario'
    Visible = False
  end
  object txtcontra: TEdit
    Left = 4
    Top = 8
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 0
    OnKeyDown = txtcontraKeyDown
  end
end
