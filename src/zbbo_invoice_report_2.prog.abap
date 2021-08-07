REPORT zbbo_invoice_report_2.


CLASS lcl_main DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA document_date TYPE vbak-erdat.
    CLASS-METHODS main.

  PRIVATE SECTION.

    TYPES: BEGIN OF ty_report,
             document_number TYPE vbeln_va,
             document_date   TYPE vbak-erdat,
             customer_name   TYPE kna1-name1,
             invoice_number  TYPE vbeln_vf,
           END OF ty_report,

           ty_t_report TYPE TABLE OF ty_report.

    CLASS-DATA report TYPE ty_t_report.

    CLASS-METHODS:
      select_data,
      show_alv.

ENDCLASS.

SELECT-OPTIONS docdate FOR lcl_main=>document_date.

CLASS lcl_main IMPLEMENTATION.

  METHOD main.
    select_data( ).
    show_alv( ).
  ENDMETHOD.

  METHOD select_data.

    SELECT sales_order~vbeln AS document_number,
           sales_order~erdat AS document_date,
           customer~name1 AS customer_name,
           invoice~vbeln AS invoice_number
      FROM vbak AS sales_order
      INNER JOIN kna1 AS customer ON customer~kunnr = sales_order~kunnr
      INNER JOIN vbfa AS document_flow ON    document_flow~vbelv   = sales_order~vbeln
                                         AND document_flow~vbtyp_v = 'C'
                                         AND document_flow~vbtyp_n = 'M'
      INNER JOIN vbrk AS invoice ON invoice~vbeln = document_flow~vbeln
      INTO TABLE @report
      WHERE sales_order~erdat IN @docdate.

    IF sy-subrc <> 0.
      MESSAGE 'Nenhum registro encontrado' TYPE 'I'.
      LEAVE LIST-PROCESSING.
    ENDIF.

  ENDMETHOD.

  METHOD show_alv.

    TRY.
        cl_salv_table=>factory(
          IMPORTING
            r_salv_table = DATA(salv_table)
          CHANGING
            t_table      = report
        ).
      CATCH cx_salv_msg.
        MESSAGE 'Erro ao instanciar ALV' TYPE 'I'.
        LEAVE LIST-PROCESSING.
    ENDTRY.

    salv_table->get_functions( )->set_all( ).
    salv_table->display( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_main=>main( ).
