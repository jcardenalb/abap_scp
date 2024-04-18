@AbapCatalog.sqlViewName: 'ZV_RENTINGJC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Renting'
@Metadata.allowExtensions: true
define view z_i_renting_jc
  as select from z_b_cars_jc as Cars
  association [1]    to z_b_rem_days_jc     as _RemDays      on Cars.Matricula = _RemDays.Matricula
  association [0..*] to z_b_brands_jc       as _Brands       on Cars.Marca = _Brands.Marca
  association [0..*] to z_b_det_customer_jc as _DetCustomers on Cars.Matricula = _DetCustomers.Matricula
{
  key Matricula,
      Marca,
      Modelo,
      Color,
      Motor,
      Potencia,
      Unidad,
      Combustible,
      Consumo,
      FechaFabricacion,
      Puertas,
      Precio,
      Moneda,
      Alquilado,
      Desde,
      Hasta,
      case
        when _RemDays.Dias <= 0 then 0                --neutral
        when _RemDays.Dias between 1 and 30 then 1    -- red
        when _RemDays.Dias between 31 and 100 then 2  -- yellow
        when _RemDays.Dias > 100 then 3               -- green
        else 0
        end as TiempoRenta,

      case
        when _RemDays.Dias <= 0 then 'New'                
        when _RemDays.Dias between 1 and 30 then 'Error'   
        when _RemDays.Dias between 31 and 100 then 'In progress'  
        when _RemDays.Dias > 100 then 'Delivered'               
        else ''
        end as Estado,        
      _Brands.Imagen,
      _DetCustomers
}
