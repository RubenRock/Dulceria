object Modulo: TModulo
  OldCreateOrder = False
  Height = 556
  Width = 1251
  object Conector: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FBDriver: TFDPhysFBDriverLink
    Left = 112
    Top = 16
  end
  object qryinventario: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from inventario order by producto')
    Left = 48
    Top = 71
  end
  object Dsinventario: TDataSource
    DataSet = qryinventario
    Left = 128
    Top = 71
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 16
  end
  object qryinventarioaux: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from inventario')
    Left = 48
    Top = 120
  end
  object Dsinventarioaux: TDataSource
    DataSet = qryinventarioaux
    Left = 128
    Top = 120
  end
  object Conector2: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 688
    Top = 16
  end
  object qryremiaux2: TFDQuery
    Connection = Conector2
    SQL.Strings = (
      'select * from remision_aux ')
    Left = 688
    Top = 80
  end
  object Dsremiaux2: TDataSource
    DataSet = qryremiaux2
    Left = 768
    Top = 80
  end
  object Qrylistarecepcion: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_recepcion')
    Left = 48
    Top = 171
  end
  object Dslistarecepcion: TDataSource
    DataSet = Qrylistarecepcion
    Left = 136
    Top = 171
  end
  object QryRecepciones: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from recepciones')
    Left = 48
    Top = 222
  end
  object DsRecepciones: TDataSource
    DataSet = QryRecepciones
    Left = 136
    Top = 222
  end
  object qryborraremiaux: TFDQuery
    Connection = Conector2
    SQL.Strings = (
      'delete from remision_aux ')
    Left = 776
    Top = 16
  end
  object QrynumFolio: TFDQuery
    Connection = Conector
    SQL.Strings = (
      'select MAX(FOLIO)+1 AS NUMFOLIO FROM LISTA_REMISION')
    Left = 200
    Top = 71
  end
  object QryRemisiones: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from remisiones')
    Left = 48
    Top = 278
  end
  object DsRemisiones: TDataSource
    DataSet = QryRemisiones
    Left = 136
    Top = 278
  end
  object QryListaremision: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_remision')
    Left = 48
    Top = 326
  end
  object DsListaremision: TDataSource
    DataSet = QryListaremision
    Left = 136
    Top = 326
  end
  object QryClientes: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from clientes')
    Left = 48
    Top = 382
  end
  object DsClientes: TDataSource
    DataSet = QryClientes
    Left = 136
    Top = 382
  end
  object Qrylista_folios: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_folios')
    Left = 48
    Top = 438
  end
  object Dslista_folios: TDataSource
    DataSet = Qrylista_folios
    Left = 136
    Top = 438
  end
  object QrylistaPagos: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from LISTA_REMISION where (condicion <>'#39'CONTADO'#39') '
      'OR  (ESTADO <>'#39'CANCELADO'#39') OR (ESTADO <>'#39'PAGADO'#39')'
      'order by folio')
    Left = 47
    Top = 490
  end
  object DslistaPagos: TDataSource
    DataSet = QrylistaPagos
    Left = 135
    Top = 490
  end
  object QryAbonos: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from abonos')
    Left = 312
    Top = 24
  end
  object DsAbonos: TDataSource
    DataSet = QryAbonos
    Left = 392
    Top = 24
  end
  object QryUsuarios: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from usuarios')
    Left = 312
    Top = 152
  end
  object DsDevoluciones: TDataSource
    DataSet = Qrydevoluciones
    Left = 392
    Top = 80
  end
  object Qrydevoluciones: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      
        'select folio, cliente, cantidad,empaque+'#39' '#39'+producto as producto' +
        '2, total, fecha, usuario from devoluciones')
    Left = 312
    Top = 88
  end
  object DsUsuarios: TDataSource
    DataSet = QryUsuarios
    Left = 392
    Top = 152
  end
  object QryAccesos: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from Accesos'
      '')
    Left = 312
    Top = 208
  end
  object DsAccesos: TDataSource
    DataSet = QryAccesos
    Left = 392
    Top = 208
  end
  object Qryproveedores: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from proveedores'
      '')
    Left = 312
    Top = 272
  end
  object Dsproveedores: TDataSource
    DataSet = Qryproveedores
    Left = 392
    Top = 272
  end
  object QrySalidas: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from salidas'
      '')
    Left = 312
    Top = 328
  end
  object DsSalidas: TDataSource
    DataSet = QrySalidas
    Left = 392
    Top = 328
  end
  object Qryimpresora: TFDQuery
    Connection = Conector2
    SQL.Strings = (
      'select * from impresora')
    Left = 688
    Top = 136
  end
  object Dsimpresora: TDataSource
    DataSet = Qryimpresora
    Left = 768
    Top = 136
  end
  object QryExtras: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from Extras'
      '')
    Left = 312
    Top = 392
  end
  object DsExtras: TDataSource
    DataSet = QryExtras
    Left = 392
    Top = 392
  end
  object Qrylistaremisionresp: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_remision_resp')
    Left = 480
    Top = 22
  end
  object Dslistaremisionresp: TDataSource
    DataSet = Qrylistaremisionresp
    Left = 568
    Top = 22
  end
  object Qrylistarecepcionresp: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_recepcion_resp')
    Left = 480
    Top = 86
  end
  object Dslistarecepcionresp: TDataSource
    DataSet = Qrylistarecepcionresp
    Left = 568
    Top = 86
  end
  object Qryremisionresp: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from remision_resp')
    Left = 480
    Top = 214
  end
  object Dsremisionresp: TDataSource
    DataSet = Qryremisionresp
    Left = 568
    Top = 214
  end
  object Qryrecepcionresp: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from recepcion_resp')
    Left = 480
    Top = 270
  end
  object Dsrecepcionresp: TDataSource
    DataSet = Qryrecepcionresp
    Left = 568
    Top = 270
  end
  object Qrylistafoliosresp: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from lista_folios_resp')
    Left = 480
    Top = 150
  end
  object Dslistafoliosresp: TDataSource
    DataSet = Qrylistafoliosresp
    Left = 568
    Top = 150
  end
  object QryEmpaque: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    Left = 312
    Top = 448
  end
  object DsEmpaque: TDataSource
    DataSet = QryEmpaque
    Left = 392
    Top = 449
  end
  object QryLista_reparto: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from Extras'
      '')
    Left = 480
    Top = 328
  end
  object DsLista_reparto: TDataSource
    DataSet = QryLista_reparto
    Left = 568
    Top = 328
  end
  object QryRepartos: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    Left = 480
    Top = 384
  end
  object DsRepartos: TDataSource
    DataSet = QryRepartos
    Left = 568
    Top = 385
  end
  object QryListaSimilar: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from Lista_similar'
      '')
    Left = 480
    Top = 448
  end
  object DsListaSimilar: TDataSource
    DataSet = QryListaSimilar
    Left = 568
    Top = 448
  end
  object QrySimilar: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'select * from similar')
    Left = 480
    Top = 504
  end
  object DsSimilar: TDataSource
    DataSet = QrySimilar
    Left = 568
    Top = 505
  end
  object QrySurtir: TFDQuery
    Connection = Conector2
    SQL.Strings = (
      'select * from impresora')
    Left = 688
    Top = 200
  end
  object DsSurtir: TDataSource
    DataSet = QrySurtir
    Left = 768
    Top = 200
  end
  object Qrylista_cortes: TFDQuery
    AfterEdit = qryinventarioAfterPost
    AfterPost = qryinventarioAfterPost
    AfterDelete = qryinventarioAfterPost
    Connection = Conector
    SQL.Strings = (
      'SELECT * FROM LISTA_CORTES')
    Left = 312
    Top = 504
  end
  object Dslista_cortes: TDataSource
    DataSet = Qrylista_cortes
    Left = 392
    Top = 505
  end
  object respaldo: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 696
    Top = 296
  end
end
