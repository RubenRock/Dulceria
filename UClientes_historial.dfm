object FClientes_historial: TFClientes_historial
  Left = 0
  Top = 0
  Caption = 'Historial de clientes'
  ClientHeight = 469
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ScreenSnap = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -6
    object Label2: TLabel
      Left = 16
      Top = 18
      Width = 50
      Height = 15
      Caption = 'BUSCAR:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Ebuscar: TEdit
      Left = 72
      Top = 16
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EbuscarChange
      OnKeyUp = EbuscarKeyUp
    end
    object RadioGroup1: TRadioGroup
      Left = 72
      Top = 43
      Width = 449
      Height = 62
      Caption = '  ORDENAR POR:  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object RNombre: TRadioButton
      Left = 144
      Top = 72
      Width = 113
      Height = 17
      Caption = 'NOMBRE'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = RNombreClick
    end
    object RCOMPRAS: TRadioButton
      Left = 288
      Top = 72
      Width = 145
      Height = 17
      Caption = 'MAYORES COMPRAS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = RCOMPRASClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 755
    Height = 72
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 73
      Top = 31
      Width = 24
      Height = 15
      Caption = 'DEL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 305
      Top = 31
      Width = 17
      Height = 15
      Caption = 'AL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Efechaini: TDateTimePicker
      Left = 104
      Top = 27
      Width = 145
      Height = 23
      Date = 43950.860184293980000000
      Time = 43950.860184293980000000
      TabOrder = 0
      OnChange = EfechainiChange
    end
    object Efechafin: TDateTimePicker
      Left = 333
      Top = 27
      Width = 145
      Height = 23
      Date = 43950.860184293980000000
      Time = 43950.860184293980000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = EfechafinChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 193
    Width = 755
    Height = 276
    Align = alClient
    DataSource = DSCLIENTES
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Width = 200
        Visible = True
      end>
  end
  object QRYCLIENTES: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from LISTA_REMISION where (condicion <>'#39'CONTADO'#39') '
      'OR  (ESTADO <>'#39'CANCELADO'#39') OR (ESTADO <>'#39'PAGADO'#39')'
      'order by folio')
    Left = 599
    Top = 25
  end
  object DSCLIENTES: TDataSource
    DataSet = QRYCLIENTES
    Left = 679
    Top = 25
  end
end
