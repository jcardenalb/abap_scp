@AbapCatalog.sqlViewName: 'ZV_DET_CUSTJC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Detail of customers'
@Metadata.allowExtensions: true
define view z_b_det_customer_jc
  as select from zrent_custom_jc
{
  key doc_id    as Id,
  key matricula as Matricula,
      nombres   as Nombre,
      apellidos as Apellidos,
      email     as Correo,
      cntr_type as TipoContrato
}
