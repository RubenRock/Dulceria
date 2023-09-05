program Fproyecto;





uses
  Vcl.Forms,
  Uproyecto in 'Uproyecto.pas' {FPrincipal},
  Uremisiones in 'Uremisiones.pas' {Fremisiones},
  Uinventario in 'Uinventario.pas' {Finventario},
  Umodulo in 'Umodulo.pas' {Modulo: TDataModule},
  UListaRecepcion in 'UListaRecepcion.pas' {FListaRecepcion},
  URecepciones in 'URecepciones.pas' {FRecepciones},
  Udatos2 in 'Udatos2.pas' {Fdatos2},
  Ureportetiquet in 'Ureportetiquet.pas' {Freportetiquet},
  Udatos in 'Udatos.pas' {Fdatos},
  Ugardar in 'Ugardar.pas' {Fguardar},
  Utiponota in 'Utiponota.pas' {Ftiponota},
  UClientes in 'UClientes.pas' {Fclientes},
  UlistaRemision in 'UlistaRemision.pas' {FlistaRemision},
  Upagos in 'Upagos.pas' {FPagos},
  UAbonos in 'UAbonos.pas' {Fabonos},
  UCortes in 'UCortes.pas' {FCortes},
  Udevoluciones in 'Udevoluciones.pas' {Fdevoluciones},
  Ulistadevoluciones in 'Ulistadevoluciones.pas' {Flistadevoluciones},
  Uusuariosalta in 'Uusuariosalta.pas' {Fusuariosalta},
  Uusuariosmodificar in 'Uusuariosmodificar.pas' {Fusuariosmodificar},
  Uusuariosacceso in 'Uusuariosacceso.pas' {Fusuariosaccesos},
  UProveedores in 'UProveedores.pas' {Fproveedores},
  Usalidas in 'Usalidas.pas' {Fsalidas},
  UlistaSalidas in 'UlistaSalidas.pas' {FListaSalidas},
  UVerificarUsuario in 'UVerificarUsuario.pas' {Fverificausu},
  Uestadocuenta in 'Uestadocuenta.pas' {FEstadocuenta},
  Ureportenotas in 'Ureportenotas.pas' {Freportenotas},
  Ureportecortecaja in 'Ureportecortecaja.pas' {Freportecortecaja},
  UReporteAbonos in 'UReporteAbonos.pas' {FReporteAbonos},
  UreporteRecepcion in 'UreporteRecepcion.pas' {FreporteRecepcion},
  UExtras in 'UExtras.pas' {Fextras},
  Urespaldo in 'Urespaldo.pas' {Frespaldo},
  Uimpresoras in 'Uimpresoras.pas' {Fimpresora},
  Uresumenventas in 'Uresumenventas.pas' {Fresumenventas},
  Uinventario_nube in 'Uinventario_nube.pas' {Finventario_nube},
  Uinventario_agregar in 'Uinventario_agregar.pas' {Finventario_agregar},
  Uinventario_modificar in 'Uinventario_modificar.pas' {Finventario_modificar},
  Uagentes in 'Uagentes.pas' {Fagentes},
  Udevoluciones_cantidad in 'Udevoluciones_cantidad.pas' {Fdevoluciones_cantidad},
  Urepartos in 'Urepartos.pas' {FLista_repartos},
  Urepartos_descripcion in 'Urepartos_descripcion.pas' {Frepartos},
  Urepartos_modificar in 'Urepartos_modificar.pas' {Frepartos_modificar},
  Usimilares in 'Usimilares.pas' {Fsimilares},
  UListaSimilares in 'UListaSimilares.pas' {Flista_similares},
  USurtir in 'USurtir.pas' {Fsurtir},
  UClientes_historial in 'UClientes_historial.pas' {FClientes_historial},
  UlistaCortes in 'UlistaCortes.pas' {Flistacortes},
  Usubir_nube in 'Usubir_nube.pas' {FSubir_nube},
  Upago_creditos in 'Upago_creditos.pas' {Fpago_creditos},
  Uagentesfirebase in 'Uagentesfirebase.pas' {FAgentesMongo},
  UmoduloAPI in 'UmoduloAPI.pas' {ModuloAPI: TDataModule},
  ureportenotascarta in 'ureportenotascarta.pas' {Freportenotascarta},
  Ureportetiquet58 in 'Ureportetiquet58.pas' {Freportetiquet58},
  UReporteAbonos58 in 'UReporteAbonos58.pas' {FReporteAbonos58},
  Ureportecortecaja58 in 'Ureportecortecaja58.pas' {Freportecortecaja58},
  UreporteRecepcion58 in 'UreporteRecepcion58.pas' {FreporteRecepcion58},
  Uintercambio in 'Uintercambio.pas' {Fintercambio},
  UReimpresiones in 'UReimpresiones.pas' {FReimpresiones},
  UretiroEfectivo in 'UretiroEfectivo.pas' {Fretiroefectivo},
  UhistorialRetiros in 'UhistorialRetiros.pas' {FhistorialRetiros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFremisiones, Fremisiones);
  Application.CreateForm(TFinventario, Finventario);
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TFListaRecepcion, FListaRecepcion);
  Application.CreateForm(TFRecepciones, FRecepciones);
  Application.CreateForm(TFdatos2, Fdatos2);
  Application.CreateForm(TFreportetiquet, Freportetiquet);
  Application.CreateForm(TFdatos, Fdatos);
  Application.CreateForm(TFguardar, Fguardar);
  Application.CreateForm(TFtiponota, Ftiponota);
  Application.CreateForm(TFclientes, Fclientes);
  Application.CreateForm(TFlistaRemision, FlistaRemision);
  Application.CreateForm(TFPagos, FPagos);
  Application.CreateForm(TFabonos, Fabonos);
  Application.CreateForm(TFCortes, FCortes);
  Application.CreateForm(TFdevoluciones, Fdevoluciones);
  Application.CreateForm(TFlistadevoluciones, Flistadevoluciones);
  Application.CreateForm(TFusuariosalta, Fusuariosalta);
  Application.CreateForm(TFusuariosmodificar, Fusuariosmodificar);
  Application.CreateForm(TFusuariosaccesos, Fusuariosaccesos);
  Application.CreateForm(TFproveedores, Fproveedores);
  Application.CreateForm(TFsalidas, Fsalidas);
  Application.CreateForm(TFListaSalidas, FListaSalidas);
  Application.CreateForm(TFverificausu, Fverificausu);
  Application.CreateForm(TFEstadocuenta, FEstadocuenta);
  Application.CreateForm(TFreportenotas, Freportenotas);
  Application.CreateForm(TFreportecortecaja, Freportecortecaja);
  Application.CreateForm(TFReporteAbonos, FReporteAbonos);
  Application.CreateForm(TFreporteRecepcion, FreporteRecepcion);
  Application.CreateForm(TFextras, Fextras);
  Application.CreateForm(TFrespaldo, Frespaldo);
  Application.CreateForm(TFimpresora, Fimpresora);
  Application.CreateForm(TFresumenventas, Fresumenventas);
  Application.CreateForm(TFinventario_nube, Finventario_nube);
  Application.CreateForm(TFinventario_agregar, Finventario_agregar);
  Application.CreateForm(TFinventario_modificar, Finventario_modificar);
  Application.CreateForm(TFagentes, Fagentes);
  Application.CreateForm(TFdevoluciones_cantidad, Fdevoluciones_cantidad);
  Application.CreateForm(TFLista_repartos, FLista_repartos);
  Application.CreateForm(TFrepartos, Frepartos);
  Application.CreateForm(TFrepartos_modificar, Frepartos_modificar);
  Application.CreateForm(TFsimilares, Fsimilares);
  Application.CreateForm(TFlista_similares, Flista_similares);
  Application.CreateForm(TFsurtir, Fsurtir);
  Application.CreateForm(TFClientes_historial, FClientes_historial);
  Application.CreateForm(TFlistacortes, Flistacortes);
  Application.CreateForm(TFSubir_nube, FSubir_nube);
  Application.CreateForm(TFpago_creditos, Fpago_creditos);
  Application.CreateForm(TFAgentesMongo, FAgentesMongo);
  Application.CreateForm(TModuloAPI, ModuloAPI);
  Application.CreateForm(TFreportenotascarta, Freportenotascarta);
  Application.CreateForm(TFreportetiquet58, Freportetiquet58);
  Application.CreateForm(TFReporteAbonos58, FReporteAbonos58);
  Application.CreateForm(TFreportecortecaja58, Freportecortecaja58);
  Application.CreateForm(TFreporteRecepcion58, FreporteRecepcion58);
  Application.CreateForm(TFintercambio, Fintercambio);
  Application.CreateForm(TFReimpresiones, FReimpresiones);
  Application.CreateForm(TFretiroefectivo, Fretiroefectivo);
  Application.CreateForm(TFhistorialRetiros, FhistorialRetiros);
  Application.Run;
end.
