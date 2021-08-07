REPORT zbbo_flights_report.

CLASS main_flight_report DEFINITION.
  PUBLIC SECTION.

    CLASS-METHODS main.

    CLASS-DATA internal_alv_table TYPE REF TO cl_salv_table.

    CLASS-DATA company_id TYPE scarr-carrid.

    CLASS-DATA flight_date TYPE sflight-fldate.


  PRIVATE SECTION.

    CLASS-METHODS: select_data_from_tables,
                  display_alv_of_selected_tables.

    TYPES: BEGIN OF flights_table_struct,
            company_id TYPE scarr-carrid,
            company_name TYPE scarr-carrname,
            flight_connection TYPE sflight-connid,
            flight_date TYPE sflight-fldate,
            flight_price TYPE sflight-price,
           END OF flights_table_struct,

           flights_table_type TYPE TABLE OF flights_table_struct.

           CLASS-DATA flights_report TYPE flights_table_type.

ENDCLASS.

SELECT-OPTIONS company FOR main_flight_report=>company_id NO INTERVALS.
SELECT-OPTIONS date FOR main_flight_report=>flight_date.

CLASS main_flight_report IMPLEMENTATION.

  METHOD main.

    select_data_from_tables(  ).
    display_alv_of_selected_tables(  ).

  ENDMETHOD.

  METHOD select_data_from_tables.

    SELECT companies~carrid AS company_id,
           companies~carrname AS company_name,
           flights~connid AS flight_connection,
           flights~fldate AS flight_date,
           flights~price AS flight_price
        FROM scarr AS companies
        INNER JOIN sflight AS flights ON flights~carrid = companies~carrid
        INTO TABLE @flights_report
        WHERE companies~carrid IN @company
          AND flights~fldate IN @date.

    IF sy-subrc <> 0.
        MESSAGE 'Nenhum registro de voo foi encontrado com esses parâmetros' TYPE 'I'.
        LEAVE LIST-PROCESSING.
    ENDIF.

  ENDMETHOD.


  METHOD display_alv_of_selected_tables.

    TRY.
        cl_salv_table=>factory(
            IMPORTING
                r_salv_table = internal_alv_table
            CHANGING
                t_table = flights_report
        ).
      CATCH cx_salv_msg.
        MESSAGE 'Erro ao tentar instanciar os registros' TYPE 'I'.
        LEAVE LIST-PROCESSING.
    ENDTRY.

    internal_alv_table->get_functions(  )->set_all(  ).
    internal_alv_table->display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
    main_flight_report=>main( ).
