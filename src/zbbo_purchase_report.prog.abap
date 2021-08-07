*&---------------------------------------------------------------------*
*& Report zbbo_purchase_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbbo_purchase_report.

CLASS main DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA:
        purchase_id TYPE zbbo_purchase-id,
        item_id TYPE zbbo_purch_item-id.
    CLASS-METHODS main.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_report_line,
             header TYPE zbbo_purchase,
             item   TYPE zbbo_purch_item,
           END OF ty_report_line,
           ty_report TYPE TABLE OF ty_report_line.

    CLASS-DATA report TYPE ty_report.

    CLASS-METHODS:
      display_alv,
      select_data.

ENDCLASS.

SELECT-OPTIONS:
    s_purcid FOR main=>purchase_id NO INTERVALS NO-EXTENSION,
    s_itemid FOR main=>item_id NO INTERVALS NO-EXTENSION.

CLASS main IMPLEMENTATION.

  METHOD main.
    display_alv( ).
    select_data( ).
  ENDMETHOD.

  METHOD select_data.
    SELECT *
      FROM zbbo_purchase AS header
      INNER JOIN zbbo_purch_item AS item ON item~id = header~id
      INTO TABLE @report
    WHERE header~id IN @s_purcid
    AND item~item_id IN @s_itemid.

ENDMETHOD.

    METHOD display_alv.
      TRY.
          cl_salv_table=>factory(
            IMPORTING
              r_salv_table = DATA(salv_table)
            CHANGING
              t_table      = report
          ).
          salv_table->get_columns( )->get_column(:
          'HEADER-CLIENT' )->set_technical( ),
          'ITEM-CLIENT' )->set_technical( ).
        CATCH cx_salv_msg cx_salv_not_found.
          LEAVE LIST-PROCESSING.
    ENDTRY.

          salv_table->get_functions( )->set_all( ).
          salv_table->display( ).
        ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  main=>main( ).
