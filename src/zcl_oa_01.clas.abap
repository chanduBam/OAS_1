CLASS zcl_oa_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_OA_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write(
      EXPORTING
        data   = 'Welcome to ABAP on cloud'
        name   = 'Heading'
*  RECEIVING
*    output =
    ).

  ENDMETHOD.
ENDCLASS.
