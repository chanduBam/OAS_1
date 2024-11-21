@AbapCatalog.sqlViewName: 'ZOAS_01UCUSTSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Customer'
@Metadata.ignorePropagatedAnnotations: true
define view ZOAS_01_I_U_customer
  as select from /dmo/customer
  association [1..*] to I_Country as _Country on $projection.country_code = _Country.Country
{

  key customer_id   as CustomerId,
      @Semantics.text: true
      first_name    as FirstName,
      last_name     as LastName,
      title         as Title,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCd,
      phone_number  as PhoneNo,
      email_address as EmailAdr,
      _Country
}
