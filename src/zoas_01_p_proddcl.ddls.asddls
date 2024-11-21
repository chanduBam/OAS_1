@AbapCatalog.sqlViewName: 'ZOAS_01_SQLPRD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'product table'
@Metadata.ignorePropagatedAnnotations: true
define view ZOAS_01_P_PRODDCL as select from zoa_01_product
{
 key product_id ,
 bp_role ,
 name ,
 catogory ,
 price ,
 currency ,
 discount 
    
}
