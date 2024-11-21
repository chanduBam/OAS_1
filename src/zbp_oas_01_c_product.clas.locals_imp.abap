CLASS lhc_ZOAS_01_C_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zoas_01_c_product RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zoas_01_c_product.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zoas_01_c_product.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zoas_01_c_product.

    METHODS read FOR READ
      IMPORTING keys FOR READ zoas_01_c_product RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zoas_01_c_product.

ENDCLASS.

CLASS lhc_ZOAS_01_C_PRODUCT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  data : lv_p_id TYPE zoa_01_de_id.
  loop at keys ASSIGNING FIELD-SYMBOL(<to_be_deleted>) .
  lv_p_id = <to_be_deleted>-product_id.
  DELETE from zoa_01_product where product_id = @lv_p_id.
  ENDLOOP.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZOAS_01_C_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZOAS_01_C_PRODUCT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
