
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Travel Application'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{ typeName: 'BookingSuppl', typeNamePlural:'BookingSupplies' }
define  view entity ZOAS_01_M_PROC_BOOKSUPPL as projection on ZOAS_01_M_booksuppl
{
@UI.facet: [{ id:'Booking' ,purpose:#STANDARD  ,type:#IDENTIFICATION_REFERENCE ,label:'Booking', position:10  }]
 key travel_id,
 key booking_id,
 key booking_supplement_id,
 supplement_id,
 @Semantics.amount.currencyCode: 'Currency_code'
 price,
 currency_code,
 last_changed_at,
 /* Associations */
 _Booking:redirected to parent ZOAS_01_M_PROC_BOOKING,
 _Product,
 _SupplementText,
 _Travel
}
