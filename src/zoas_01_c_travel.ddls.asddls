@AbapCatalog.sqlViewName: 'Z0AS01CUTRAVSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Travel'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{typeName: 'Travel',typeNamePlural: 'Travels'}
@Search.searchable: true
define root view zoas_01_c_travel
  as select from /dmo/travel as _Travel
  association [1] to zoas_01_i_u_agency   as _Agency   on $projection.AgencyId = _Agency.AgencyId
  association [1] to zoas_00_I_u_customer as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1] to I_Currency           as _Currency on $projection.CurrencyCode = _Currency.Currency
{
      @UI.facet: [{ purpose:#STANDARD,type:#IDENTIFICATION_REFERENCE,label: 'Details',position:10 }]
      @UI.selectionField: [{ position:10 }]
      @UI.lineItem: [{ position:10, label: 'Travel No' }]
      @UI.identification: [{ position:10 }]
  key travel_id     as TravelId,
      @UI.selectionField: [{ position:20 }]
      @EndUserText.label: 'Agency No'
      @UI.lineItem: [{ position:20 }]
      @UI.identification: [{ position:20 }]
      @ObjectModel.text.association: '_Agency'
      @Consumption.valueHelpDefinition: [{entity:{name:'ZOAS_01_I_U_AGENCY',element: 'AgencyId'} }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      agency_id     as AgencyId,
      @UI.selectionField: [{ position:30 }]
      @UI.lineItem: [{ position:30 }]
      @UI.identification: [{ position:30 }]
      @ObjectModel.text.association: '_Customer'
      @Consumption.valueHelpDefinition: [{entity:{name:'ZOAS_01_I_U_CUSTOMER',element: 'CustomerId'} }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      customer_id   as CustomerId,
      @UI.identification: [{ position:40 }]
      begin_date    as BeginDate,
      @UI.identification: [{ position:50 }]
      end_date      as EndDate,
      @UI.identification: [{ position:60 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @UI.lineItem: [{ position:70 }]
      @UI.identification: [{ position:70 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      @UI.lineItem: [{ position:50 }]
      @UI.identification: [{ position:80 }]
      currency_code as CurrencyCode,
      @UI.lineItem: [{ position:90 }]
      @UI.identification: [{ position:90 }]
      description   as Description,
      @UI.lineItem: [{ position:100 }]
      @UI.identification: [{ position:100 }]
      status        as Status,
      _Agency,
      _Customer,
      _Currency

}
