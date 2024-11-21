@AbapCatalog.sqlViewName: 'ZOAS_01_SQSALESR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Header'
@Metadata.ignorePropagatedAnnotations: true
define view ZOAS_01_I_SALES_N as select from zoa_01_so_i association[1..*] to zoas_01_P_Product as _Products
on $projection.product = _Products.product_id
association[1] to zoas_01_I_SalesHdr as _SalesHdr
on $projection.order_id = _SalesHdr.order_id 
{
    key item_id as ItemId,
    order_id,
    product,
    _SalesHdr.order_no as OrderNo,
    _SalesHdr._Bp.comp_name as CompanyName,
    _SalesHdr._Bp.country as Country,
    _SalesHdr._Bp.region as Region,
    _Products.name  as ProductName,
    _Products.catogory as Category,
    qty as Qty,
    uom as UOM,
    amount as Amount,
    currency as Currency
    
}
