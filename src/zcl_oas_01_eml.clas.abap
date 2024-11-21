CLASS zcl_oas_01_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA lv_type TYPE c VALUE 'R'.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_oas_01_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    IF lv_type = 'C'.
      DATA : it_data_create TYPE TABLE FOR CREATE zoas_01_m_travel.

      it_data_create  = VALUE #( (
                               travel_id = '00009998'
                               agency_id = 70003
                               customer_id = 3
                               begin_date = cl_abap_context_info=>get_system_date(  )
                               end_date = cl_abap_context_info=>get_system_date(  ) + 30
                               booking_fee = 50
                               total_price = 5000
                               currency_code = 'USD'
                               description = 'EML Testing'
                               %control = VALUE #( travel_id = if_abap_behv=>mk-on
                                                   agency_id = if_abap_behv=>mk-on
                                                   customer_id =  if_abap_behv=>mk-on
                                                   begin_date = if_abap_behv=>mk-on
                                                   end_date = if_abap_behv=>mk-on
                                                   booking_fee = if_abap_behv=>mk-on
                                                   total_price = if_abap_behv=>mk-on
                                                   currency_code = if_abap_behv=>mk-on
                                                   description = if_abap_behv=>mk-on
                                ) )
                                ).
      MODIFY ENTITIES OF Zoas_01_m_travel
      ENTITY Travel
      CREATE FROM it_data_create
      FAILED DATA(lt_data_failed)
      REPORTED DATA(lt_reported).
      IF lt_data_failed IS NOT INITIAL.
        out->write(
          EXPORTING
            data   = lt_data_failed
*              name   =
*            RECEIVING
*              output =
        ).

      ENDIF.
      COMMIT ENTITIES.
    ELSEIF lv_type = 'U'.
      DATA : it_data_update TYPE TABLE FOR UPDATE zoas_01_m_travel.
      it_data_update  = VALUE #( (
                                      travel_id = '00009998'
                                     description = 'EML Testing123'
                                      %control = VALUE #(   description = if_abap_behv=>mk-on
                                       ) )
                                       ).

      MODIFY ENTITIES OF Zoas_01_m_travel
      ENTITY Travel
      UPDATE FROM it_data_update
      FAILED lt_data_failed
      REPORTED lt_reported.
      IF lt_data_failed IS NOT INITIAL.
        out->write(
          EXPORTING
            data   = lt_data_failed
*              name   =
*            RECEIVING
*              output =
        ).
            ENDIF.
        COMMIT ENTITIES.
      ELSEIF lv_type = 'D'.
        DATA : it_data_delete TYPE TABLE FOR DELETE zoas_01_m_travel.
        it_data_delete  = VALUE #( (
                                        travel_id = '00009998'

                                       )
                                         ).
      MODIFY ENTITIES OF Zoas_01_m_travel
      ENTITY Travel
      DELETE FROM it_data_delete
      FAILED lt_data_failed
      REPORTED lt_reported.
       IF lt_data_failed IS NOT INITIAL.
        out->write(
          EXPORTING
            data   = lt_data_failed
*              name   =
*            RECEIVING
*              output =
        ).

      ENDIF.
      COMMIT ENTITIES.
     if lv_type = 'R'.
     READ ENTITIES OF zoas_01_m_travel entity Travel FROM
     VALUE #( ( travel_id = '00009998'
     %control = VALUE #( booking_fee = if_abap_behv=>mk-on
                         description = if_abap_behv=>mk-on
                                )
      ) ) RESULT DATA(lt_found_records).
     if lt_found_records is NOT INITIAL.
     out->write(
       EXPORTING
         data   = lt_found_records
*         name   =
*       RECEIVING
*         output =
     ).
     ENDIF.
     ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
