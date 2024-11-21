@AbapCatalog.sqlViewName: 'ZOAS01TRAVSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Bussiness'
@Metadata.ignorePropagatedAnnotations: true
define root view ZOAS_01_M_TRAVEL 
  as select from /dmo/travel as Travel composition[0..*] of ZOAS_01_M_BOOKING as _Booking
  association [1] to zoas_01_i_u_agency   as _Agency   on $projection.agency_id = _Agency.AgencyId
  association [1] to ZOAS_01_I_U_customer as _Customer on $projection.customer_id = _Customer.CustomerId
{
  key travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      @Semantics.amount.currencyCode: 'Currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'Currency_code'
      total_price,
      currency_code,
      description,
      status,
      @Semantics.user.createdBy: true
      createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat,--eTag
      _Agency,
      _Customer,
      _Booking
}
