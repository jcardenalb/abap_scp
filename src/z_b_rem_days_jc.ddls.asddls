@AbapCatalog.sqlViewName: 'ZV_REM_DAYSJC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'remaining days'
define view z_b_rem_days_jc
  as select from zrent_cars_jc
{
  key matricula as Matricula,
      marca     as Marca,
      case
      when alq_hasta <> ''
      then dats_days_between( cast($session.system_date as abap.dats) , alq_hasta )
      end       as Dias
}
