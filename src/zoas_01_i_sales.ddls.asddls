@AbapCatalog.sqlViewName: 'ZOAS_01_SQLSAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_I_Sales as select from zoa_01_so_i association[1] to zoa_01_so_i as _SalesHdr
on $projection.order_id = _SalesHdr.order_id
{
    key item_id ,
    order_id ,
    product ,
    qty ,
    uom ,
    amount ,
    currency ,
    _SalesHdr
}
