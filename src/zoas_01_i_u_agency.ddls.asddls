@AbapCatalog.sqlViewName: 'ZOAS01IUAGSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Agency'
@Metadata.ignorePropagatedAnnotations: true
define view zoas_01_i_u_agency as select from /dmo/agency association[1] to I_Country as _Country
on $projection.country_code = _Country.Country
{
    key agency_id as AgencyId,
    @Semantics.text: true
    name as AgencyName,
    street as AStreet,
    postal_code as PostalCode,
    city as City,
    country_code as ACountry,
    phone_number as APhone,
    email_address as AEmailAddress,
    web_address as AWebaddress,
    _Country
    
}
