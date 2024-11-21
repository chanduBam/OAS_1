@AbapCatalog.sqlViewName: 'ZOAS_01SQLPRD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'product table'
@Metadata.ignorePropagatedAnnotations: true
define root view ZOAS_01_C_PRODUCT as select from zoa_01_product
{
@UI.lineItem: [{ position :10 }]
 key product_id ,
@UI.lineItem: [{ position :20 }]
 bp_role ,
 @UI.lineItem: [{ position :30 }]
 name ,
 @UI.lineItem: [{ position :40 }]
 catogory ,
 @UI.lineItem: [{ position :50 }]
 price ,
 @UI.lineItem: [{ position :60 }]
 currency ,
 @UI.lineItem: [{ position :70 }]
 discount 
    
}
