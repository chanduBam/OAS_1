@AbapCatalog.sqlViewName: 'ZOAS_01_SQLSHDR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Header'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_I_SalesHdr as select from zoa_01_so association[1..*] to zoa_01_bp as _Bp
on $projection.buyer = _Bp.bp_id
{
    key order_id ,
    order_no ,
    buyer ,
    gross_amount ,
    currency ,
    _Bp 
}
