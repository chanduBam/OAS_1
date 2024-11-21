@AbapCatalog.sqlViewName: 'ZOAS_01_SQL_PRD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'product table'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_P_Product as select from zoa_01_product
{
 key product_id ,
 bp_role ,
 name ,
 catogory ,
 price ,
 currency ,
 discount 
    
}
