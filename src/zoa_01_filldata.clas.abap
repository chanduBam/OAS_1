CLASS zoa_01_filldata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS : clear.
    METHODS : fill_master_data.
    METHODS : fill_transaction_data.
ENDCLASS.



CLASS ZOA_01_FILLDATA IMPLEMENTATION.


  METHOD clear.
    DELETE FROM : zoa_01_bp,zoa_01_product,zoa_01_so,zoa_01_so_i.
  ENDMETHOD.


  METHOD fill_master_data.
    DATA: lt_bp   TYPE TABLE OF zoa_01_bp,
          lt_prod TYPE TABLE OF zoa_01_product.
    APPEND VALUE #( bp_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c22(  )
    bp_role = '01'
    comp_name = 'BCT CONS'
    city = 'HYDERABAD'
    street = 'Sultanbagh Erragadda'
    country = 'IN'
    region = 'SI'
    ) TO lt_bp.

    APPEND VALUE #( bp_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c22(  )
    bp_role = '02'
    comp_name = 'BCT CONS'
    city = 'HYDERABAD'
    street = 'Sultanbagh Erragadda'
    country = 'IN'
    region = 'SI'
    ) TO lt_bp.

    APPEND VALUE #( product_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  )
bp_role = '01'
name = 'HP PAVALION'
catogory = 'HP'
price = '125'
currency = 'INR'
discount = 2
) TO lt_prod.
    APPEND VALUE #( product_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c32(  )
bp_role = '02'
name = 'DELL LAPTOP'
catogory = 'DELL'
price = '124'
currency = 'INR'
discount = 2
) TO lt_prod.
    INSERT zoa_01_bp FROM TABLE @lt_bp.
    INSERT zoa_01_product FROM TABLE @lt_prod.

  ENDMETHOD.


  METHOD fill_transaction_data.
    DATA: o_rand  TYPE REF TO cl_abap_random_int,
          n       TYPE i,
          seed    TYPE i,
          lt_so   TYPE TABLE OF zoa_01_so,
          lt_so_i TYPE TABLE OF zoa_01_so_i,
          lv_date TYPE timestamp.
    seed = cl_abap_random=>seed(  ).
    cl_abap_random_int=>create(
      EXPORTING
        seed = seed
        min  = 1
        max  = 2
      RECEIVING
        prng = o_rand
    ).

    SELECT * FROM zoa_01_bp INTO TABLE @DATA(lt_bp).
    SELECT * FROM zoa_01_product INTO TABLE @DATA(lt_prod).
    DO 10 TIMES.
      DATA(lv_ord_id) = cl_uuid_factory=>create_system_uuid( )->create_uuid_c22( ).
      n = o_rand->get_next( ).
      READ TABLE lt_bp INTO DATA(ls_bp) INDEX n.
      APPEND VALUE #( order_id = lv_ord_id
                      order_no = sy-index
                      buyer    = ls_bp-bp_id
                      gross_amount = n * 100
                      currency = 'INR'
                      created_by = sy-uname
                      created_on = lv_date
                      changed_by = sy-uname
                      changed_on = lv_date ) TO lt_so.
      DO 2 TIMES.
        n = o_rand->get_next(  ).
        READ TABLE lt_prod INTO DATA(ls_product) INDEX n.
        APPEND VALUE #( order_id = lv_ord_id
                        item_id = cl_uuid_factory=>create_system_uuid(  )->create_uuid_c22(  )
                        product = ls_product-product_id
                        qty    = n
                        uom = 'PC'
                        amount = n * ls_product-price
                        currency = 'INR'
                         created_by = sy-uname
                        created_on = lv_date
                        changed_by = sy-uname
                        changed_on = lv_date ) TO lt_so_i.
      ENDDO.
    ENDDO.

    INSERT zoa_01_so FROM TABLE @lt_so.
    INSERT zoa_01_so_i FROM TABLE @lt_so_i.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    me->clear(  ).
    me->fill_master_data(  ).
    me->fill_transaction_data(  ).
  ENDMETHOD.
ENDCLASS.
