@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Travel Application'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{ typeName: 'Travel', typeNamePlural:'Travels' }
define root view entity zoas_01_m_proc_travel as projection on ZOAS_01_M_TRAVEL
{
@UI.facet: [{ id:'Travel' ,purpose:#STANDARD  ,type:#IDENTIFICATION_REFERENCE ,label:'Travel', position:10  },
            { id:'Booking' ,purpose:#STANDARD  ,type:#IDENTIFICATION_REFERENCE ,label:'Booking', position:20, targetElement: '_Booking' }
           ]                                                                     
@UI:{lineItem: [{ position: 10, importance:#HIGH  }],
    identification: [{ position:10,label:'Travel_id' }] }
 @Search.defaultSearchElement: true   
 key travel_id,
 @UI:{lineItem: [{ position: 20, importance:#HIGH  }],
    identification: [{ position:20,label:'Agency_id' }], 
    selectionField: [{ position: 20 }]
    }
  @Consumption.valueHelpDefinition: [{entity:{ name:'/DMO/I_Agency', element:'Agency_ID'}}] 
  @ObjectModel.text.element:['AgencyName']
 agency_id,
 _Agency.AgencyName as AgencyName,
 @UI:{lineItem: [{ position: 30, importance:#HIGH  }],
    identification: [{ position:30,label:'Customer_id' }], 
    selectionField: [{ position: 30 }]
    }
@Consumption.valueHelpDefinition: [{entity:{ name:'/DMO/I_Customer', element:'CustomerID'}}] 
  @ObjectModel.text.element:['CustomerName']    
 customer_id,
 _Customer.FirstName as CustomerName,
 @UI:{lineItem: [{ position: 40, importance:#HIGH  }],
    identification: [{ position:40,label:'Begin_Date' }]
    }
 begin_date,
 @UI:{lineItem: [{ position: 50, importance:#HIGH  }],
    identification: [{ position:50,label:'End_Date' }]
    }
 end_date,
 @UI:{lineItem: [{ position: 60, importance:#HIGH  }],
    identification: [{ position:60,label:'Booking_fee' }]
    }
 @Semantics.amount.currencyCode: 'Currency_code'
 booking_fee,
 @UI:{lineItem: [{ position: 70, importance:#HIGH  }],
    identification: [{ position:70,label:'Total_price' }]
    }
 @Semantics.amount.currencyCode: 'Currency_code'
 total_price,
 @UI:{lineItem: [{ position: 80, importance:#HIGH  }],
    identification: [{ position:80,label:'Currency_Code' }]
    }
 @Consumption.valueHelpDefinition: [{entity:{ name:'I_Currency', element:'Currency'}}] 
 currency_code,
 @UI:{lineItem: [{ position: 90, importance:#HIGH  }],
    identification: [{ position:90,label:'Description' }]
    }
 description,
 @UI:{lineItem: [{ position: 100, importance:#HIGH  }],
    identification: [{ position:100,label:'Status' }]
    }
 status,
 
 lastchangedat,
 /* Associations */
 _Agency,
 _Booking:redirected to composition child ZOAS_01_M_PROC_BOOKING,
 _Customer   
}
