object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 500
  ClientWidth = 1245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object logo: TImage
    Left = 0
    Top = 25
    Width = 1245
    Height = 475
    Align = alClient
    AutoSize = True
    Center = True
    Proportional = True
    ExplicitLeft = 8
    ExplicitTop = 31
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 1245
    Height = 25
    Align = alTop
    Color = clBtnShadow
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 144
      Top = 3
      Width = 73
      Height = 22
      Caption = 'intenert'
      Visible = False
      OnClick = SpeedButton1Click
    end
  end
  object Menu: TMainMenu
    Left = 34
    Top = 40
    object Remisiones1: TMenuItem
      Caption = '&Remisiones'
      object Nueva1: TMenuItem
        Caption = '&Nueva'
        ShortCut = 16462
        OnClick = Nueva1Click
      end
      object Listaderemisiones1: TMenuItem
        Caption = '&Lista de remisiones'
        ShortCut = 16460
        OnClick = Listaderemisiones1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Pagos1: TMenuItem
        Caption = '&Pagos'
        object Pagaalrecibir1: TMenuItem
          Caption = 'Paga al recibir'
          ShortCut = 16464
          OnClick = Pagaalrecibir1Click
        end
        object Creditos1: TMenuItem
          Caption = 'Creditos'
          ShortCut = 16451
          OnClick = Creditos1Click
        end
        object Repartos1: TMenuItem
          Caption = 'Repartos'
          ShortCut = 16466
          OnClick = Repartos1Click
        end
      end
      object Retirodeefectivo1: TMenuItem
        Caption = '&Retiro de efectivo'
        OnClick = Retirodeefectivo1Click
      end
      object Cortesdecaja1: TMenuItem
        Caption = '&Cortes de caja'
        OnClick = Cortesdecaja1Click
      end
      object Resumendeventas1: TMenuItem
        Caption = 'R&esumen de ventas'
        OnClick = Resumendeventas1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Reimpresiones1: TMenuItem
        Caption = 'Re&impresiones'
        OnClick = Reimpresiones1Click
      end
    end
    object Inventario1: TMenuItem
      Caption = '&Inventario'
      object Actualizarinventario1: TMenuItem
        Caption = '&Actualizar inventario'
        OnClick = Actualizarinventario1Click
      end
      object Inventarioenlanube1: TMenuItem
        Caption = '&Inventario en la nube'
        object Descargar1: TMenuItem
          Caption = '&Descargar'
          OnClick = Descargar1Click
        end
        object Subir1: TMenuItem
          Caption = '&Subir'
          OnClick = Subir1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Recepciondemercancia1: TMenuItem
        Caption = '&Recepcion de mercancia'
        OnClick = Recepciondemercancia1Click
      end
      object raspadodemercancia1: TMenuItem
        Caption = '&Traspaso de mercancia'
        OnClick = raspadodemercancia1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Agentesdeventa1: TMenuItem
        Caption = 'A&gentes de venta'
        OnClick = Agentesdeventa1Click
      end
      object Agentesfirebase1: TMenuItem
        Caption = 'Agentes 2021'
        OnClick = Agentesfirebase1Click
      end
    end
    object Usuarios1: TMenuItem
      Caption = '&Usuarios'
      object Agregar2: TMenuItem
        Caption = '&Agregar'
        OnClick = Agregar2Click
      end
      object Modificar2: TMenuItem
        Caption = 'Modificar'
        OnClick = Modificar2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Asignaraccesos1: TMenuItem
        Caption = 'Asignar accesos'
        OnClick = Asignaraccesos1Click
      end
    end
    object Clientes1: TMenuItem
      Caption = '&Clientes'
      object Actualizar2: TMenuItem
        Caption = '&Actualizar'
        OnClick = Actualizar2Click
      end
    end
    object Proveedores1: TMenuItem
      Caption = '&Proveedores'
      object Actulizar1: TMenuItem
        Caption = '&Actulizar'
        OnClick = Actulizar1Click
      end
    end
    object Devoluciones1: TMenuItem
      Caption = 'Devoluciones'
      object Listadedevoluciones1: TMenuItem
        Caption = 'Lista de devoluciones'
        OnClick = Listadedevoluciones1Click
      end
    end
    object Salidas1: TMenuItem
      Caption = '&Salidas'
      object Acttualizar1: TMenuItem
        Caption = '&Actualizar'
        OnClick = Acttualizar1Click
      end
    end
    object Respaldar1: TMenuItem
      Caption = '&Extras'
      object Actualizar1: TMenuItem
        Caption = '&Respaldar'
        OnClick = Actualizar1Click
      end
      object Ajustes1: TMenuItem
        Caption = '&Ajustes'
        OnClick = Ajustes1Click
      end
      object Impresoras1: TMenuItem
        Caption = '&Impresoras'
        OnClick = Impresoras1Click
      end
    end
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 112
    Top = 128
  end
end
