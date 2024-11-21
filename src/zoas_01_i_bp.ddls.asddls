@AbapCatalog.sqlViewName: 'ZOAS_01_SQLBP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BP extraction'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_I_BP as select from zoa_01_bp
{
    key bp_id,
        bp_role,
        comp_name,
        street,
        city,
        country,
        region
}
