@AbapCatalog.sqlViewName: 'ZOAS01MSQLBSUP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliment'
@Metadata.ignorePropagatedAnnotations: true
define view ZOAS_01_M_booksuppl as select from /dmo/booksuppl_m as _BookSupplement association to parent ZOAS_01_M_BOOKING 
as _Booking on $projection.booking_id = _Booking.booking_id and $projection.travel_id = _Booking.travel_id
association[1..1] to ZOAS_01_M_TRAVEL as _Travel on $projection.travel_id = _Travel.travel_id
association[1..1] to /DMO/I_Supplement as _Product on $projection.supplement_id = _Product.SupplementID
association[1..1] to /DMO/I_SupplementText as _SupplementText on $projection.supplement_id = _SupplementText.SupplementID
{
    key travel_id ,
    key booking_id ,
    key booking_supplement_id ,
    supplement_id ,
    price ,
    currency_code ,
    last_changed_at ,
    _Travel,
    _Product,
    _SupplementText,
    _Booking
    
}
