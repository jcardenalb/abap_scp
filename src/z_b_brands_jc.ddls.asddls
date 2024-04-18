@AbapCatalog.sqlViewName: 'ZV_BRANDSJC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
define view z_b_brands_jc
  as select from zrent_brands_jc
{
  key marca as Marca,
      @UI.hidden: true
      url   as Imagen
}
