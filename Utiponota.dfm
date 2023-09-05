object Ftiponota: TFtiponota
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tipo de notas'
  ClientHeight = 219
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 233
    Height = 201
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 13
      Top = 5
      Width = 209
      Height = 188
      TabOrder = 0
      object Label1: TLabel
        Left = 49
        Top = 108
        Width = 124
        Height = 13
        Caption = 'Cantidad de venta foliada'
      end
      object rdserie: TRadioButton
        Left = 11
        Top = 18
        Width = 73
        Height = 17
        Caption = 'Serie A'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object Txtcantidad: TEdit
        Left = 32
        Top = 84
        Width = 153
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '0.00'
      end
      object Rdfolio: TRadioButton
        Left = 11
        Top = 54
        Width = 65
        Height = 17
        Caption = 'Foliadas'
        TabOrder = 2
      end
      object fecha: TDateTimePicker
        Left = 24
        Top = 152
        Width = 161
        Height = 21
        Date = 40241.501012361100000000
        Format = 'MMMM dd, yyyy'
        Time = 40241.501012361100000000
        TabOrder = 3
        OnCloseUp = FormActivate
      end
    end
  end
  object sqlred: TFDQuery
    Connection = Modulo.Conector
    Left = 141
    Top = 32
  end
end
