CLASS lhc_zoas_01_c_travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zoas_01_c_travel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zoas_01_c_travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zoas_01_c_travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zoas_01_c_travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ zoas_01_c_travel RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zoas_01_c_travel.
    METHODS map_data importing im_data type ZOAS_01_C_TRAVEL
    RETURNING VALUE(r_bapi_data) TYPE /dmo/s_travel_in.

ENDCLASS.

CLASS lhc_zoas_01_c_travel IMPLEMENTATION.

  METHOD map_data .
r_bapi_data-agency_id = im_data-AgencyId.
r_bapi_data-begin_date = im_data-BeginDate.
r_bapi_data-booking_fee = im_data-BookingFee.
r_bapi_data-currency_code = im_data-CurrencyCode.
r_bapi_data-customer_id = im_data-CustomerId.
r_bapi_data-description = im_data-Description.
r_bapi_data-end_date = im_data-EndDate.
r_bapi_data-status = im_data-Status.
r_bapi_data-total_price = im_data-TotalPrice.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    data : ls_travel_in type /dmo/s_travel_in,
         ls_travel_out TYPE /dmo/travel,
         lt_messages TYPE /dmo/t_message.
  loop at entities assigning field-symbol(<fs_travel_create>).
  ls_travel_in = map_data( im_data = CORRESPONDING #( <fs_travel_create> ) ).
  CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
    EXPORTING
      is_travel             = ls_travel_in
*      it_booking            =
*      it_booking_supplement =
*      iv_numbering_mode     =
    IMPORTING
      es_travel             = ls_travel_out
*      et_booking            =
*      et_booking_supplement =
      et_messages           = lt_messages
    .
    if lt_messages is INITIAL.
    INSERT VALUE #( %cid = <fs_travel_create>-%cid
                    travelid = ls_travel_out-travel_id ) INTO TABLE mapped-zoas_01_c_travel.
    else.

           loop AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' or msgty = 'A'.
              ls_travel_in = map_data( im_data = CORRESPONDING #( <fs_travel_create>  ) ).
               INSERT VALUE #( %cid = <fs_travel_create>-%cid  ) INTO TABLE failed-zoas_01_c_travel.
                 RETURN.

               ENDLOOP..

    endif.
  ENDLOOP.
  ENDMETHOD.

  METHOD update.
  data : ls_travel_in type /dmo/s_travel_in,
         ls_travel_x TYPE /dmo/s_travel_inx,
         lt_message TYPE /dmo/t_message.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<to_be_updated>).
    ls_travel_in = map_data( im_data = CORRESPONDING #( <to_be_updated> ) ).
    ls_travel_x-agency_id = xsdbool( <to_be_updated>-%control-AgencyId = cl_abap_behv=>flag_changed ).
    ls_travel_x-begin_date = xsdbool( <to_be_updated>-%control-BeginDate = cl_abap_behv=>flag_changed ).
    ls_travel_x-booking_fee = xsdbool( <to_be_updated>-%control-BookingFee = cl_abap_behv=>flag_changed ).
    ls_travel_x-currency_code = xsdbool( <to_be_updated>-%control-CurrencyCode = cl_abap_behv=>flag_changed ).
    ls_travel_x-customer_id = xsdbool( <to_be_updated>-%control-CustomerId = cl_abap_behv=>flag_changed ).
    ls_travel_x-description = xsdbool( <to_be_updated>-%control-Description = cl_abap_behv=>flag_changed ).
    ls_travel_x-end_date = xsdbool( <to_be_updated>-%control-EndDate = cl_abap_behv=>flag_changed ).
    ls_travel_x-status = xsdbool( <to_be_updated>-%control-Status = cl_abap_behv=>flag_changed ).
    ls_travel_x-total_price = xsdbool( <to_be_updated>-%control-TotalPrice = cl_abap_behv=>flag_changed ).
    ls_travel_x-travel_id = <to_be_updated>-TravelId.
    ls_travel_in-travel_id = <to_be_updated>-TravelId.
    ENDLOOP.

   call FUNCTION '/DMO/FLIGHT_TRAVEL_UPDATE'
     EXPORTING
       is_travel              = ls_travel_in
       is_travelx             = ls_travel_x
*       it_booking             =
*       it_bookingx            =
*       it_booking_supplement  =
*       it_booking_supplementx =
     IMPORTING
*       es_travel              =
*       et_booking             =
*       et_booking_supplement  =
       et_messages            = lt_message
     .




  ENDMETHOD.

  METHOD delete.
  data : lv_travel_id TYPE /dmo/travel_id,
         lt_messages TYPE /dmo/if_flight_legacy=>tt_message.

  loop at keys ASSIGNING FIELD-SYMBOL(<to_be_deleted>) .
         lv_travel_id = <to_be_deleted>-TravelId.
         call FUNCTION  '/DMO/FLIGHT_TRAVEL_DELETE'
             EXPORTING
               iv_travel_id = lv_travel_id
             importing
               et_messages  = lt_messages.
               loop AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' or msgty = 'A'.
               INSERT VALUE #( %cid = <to_be_deleted>-%cid_ref travelid = <to_be_deleted>-TravelId ) INTO TABLE failed-zoas_01_c_travel.


               ENDLOOP..

  ENDLOOP.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZOAS_01_C_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZOAS_01_C_TRAVEL IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  call FUNCTION '/DMO/FLIGHT_TRAVEL_SAVE'.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
