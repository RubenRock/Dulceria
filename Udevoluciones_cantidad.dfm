object Fdevoluciones_cantidad: TFdevoluciones_cantidad
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cantidad'
  ClientHeight = 50
  ClientWidth = 179
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
  object Ecantidad: TEdit
    Left = 16
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 0
    OnKeyUp = EcantidadKeyUp
  end
end
