CLASS zcl_amdp_get_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES : if_amdp_marker_hdb,
               if_oo_adt_classrun.
  TYPES : tt_prd type TABLE of zoa_01_product.
  METHODS get_data
     EXPORTING VALUE(et_data) type tt_prd.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AMDP_GET_DATA IMPLEMENTATION.


METHOD get_data BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zoa_01_product .
et_data = SELECT * FROM zoa_01_product;
ENDMETHOD.


METHOD if_oo_adt_classrun~main.
me->get_data(
  IMPORTING
    et_data = data(et_data1)
).
out->write(
  EXPORTING
    data   = et_data1
    name   = 'output'
*  RECEIVING
*    output =
).
ENDMETHOD.
ENDCLASS.
