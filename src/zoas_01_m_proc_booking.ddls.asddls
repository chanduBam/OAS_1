@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Travel Application'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{ typeName: 'Booking', typeNamePlural:'Bookings' }
define  view entity ZOAS_01_M_PROC_BOOKING as projection on ZOAS_01_M_BOOKING
{
@UI.facet: [{ id:'Booking' ,purpose:#STANDARD  ,type:#IDENTIFICATION_REFERENCE ,label:'Booking', position:10  },
            { id:'BookingS' ,purpose:#STANDARD  ,type:#IDENTIFICATION_REFERENCE ,label:'BookingSuppliment', position:20, targetElement: '_Booksuppl' }
           ]                                                                     
@UI:{lineItem: [{ position: 10, importance:#HIGH  }],
    identification: [{ position:10,label:'Travel_id' }] }
 @Search.defaultSearchElement: true   
 key travel_id,
 @UI:{lineItem: [{ position: 20, importance:#HIGH  }],
    identification: [{ position:20,label:'Booking_id' }] }
 @Search.defaultSearchElement: true 
 key booking_id,
 booking_date,
 customer_id,
 carrier_id,
 connection_id,
 flight_date,
 @Semantics.amount.currencyCode: 'Currency_code'
 flight_price,
 currency_code,
 lastchangedat,
 /* Associations */
 _Booksuppl:redirected to composition child ZOAS_01_M_PROC_BOOKSUPPL,
 _Carrier,
 _Connection,
 _Customer,
 _Travel:redirected to parent zoas_01_m_proc_travel
}
