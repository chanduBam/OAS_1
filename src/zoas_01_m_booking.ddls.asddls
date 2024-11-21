@AbapCatalog.sqlViewName: 'ZOAS01MSQLBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
define view ZOAS_01_M_BOOKING
  as select from /dmo/booking as _Booking 
     association to parent ZOAS_01_M_TRAVEL as _Travel on $projection.travel_id = _Travel.travel_id
     composition[0..*] of ZOAS_01_M_booksuppl as _Booksuppl 
  association [1..1] to /dmo/customer     as _Customer   on  $projection.customer_id = _Customer.customer_id
  association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                         and $projection.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      _Travel.lastchangedat,
      _Customer,
      _Carrier,
      _Connection,
      _Travel,
      _Booksuppl
      
}
