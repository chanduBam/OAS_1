@AbapCatalog.sqlViewName: 'ZOAS_01_SQLSALES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_C_Sales as select from ZOAS_01_I_SALES_N 
{
    key Category,
    sum(Amount) as TotalSales,
    Currency 
}
group by Category,Currency
