*&---------------------------------------------------------------------*
*& Report ZTESTE_DE_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zteste_de_report.

CLASS main_program DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA document_t TYPE zfornecedor-documento.
    CLASS-DATA material_t TYPE zfornecedor-material.
    CLASS-DATA quantity_t TYPE zfornecedor-quantidade.
    CLASS-DATA uni_price_t TYPE zfornecedor-preco_unitario.
    CLASS-METHODS main_program.


  PRIVATE SECTION.
    CLASS-DATA results TYPE STANDARD TABLE OF zfornecedor.
    CLASS-METHODS:
      select_table,
      display_table.

  ENDCLASS.


SELECTION-SCREEN BEGIN OF BLOCK view_1 WITH FRAME TITLE text-000.
  select-options s_doc_t for main_program=>document_t.
  select-options s_mat_t for main_program=>material_t.
SELECTION-SCREEN END OF BLOCK view_1.

SELECTION-SCREEN BEGIN OF BLOCK view_2 WITH FRAME TITLE text-001.
  select-options s_quan_t for main_program=>quantity_t.
  select-options s_upri_t for main_program=>uni_price_t.
SELECTION-SCREEN END OF BLOCK view_2.

CLASS main_program IMPLEMENTATION.
  METHOD main_program.
    select_table( ).
    display_table( ).

  ENDMETHOD.

  METHOD display_table.
    TRY.
      cl_salv_table=>factory(
        IMPORTING r_salv_table = DATA(salv_table)
        CHANGING t_table = results  ).
      CATCH cx_salv_msg.
        MESSAGE `Não foi possível exibir a lista de valores`  TYPE 'E'.
    ENDTRY.
    salv_table->get_functions( )->set_all( ).
    salv_table->display( ).
  ENDMETHOD.

  METHOD select_table.
    SELECT *
      FROM zfornecedor
      INTO TABLE @results
      WHERE zfornecedor~documento IN @s_doc_t
      AND zfornecedor~material IN @s_mat_t
      AND zfornecedor~quantidade IN @s_quan_t
      AND zfornecedor~quantidade IN @s_upri_t.
  ENDMETHOD.

ENDCLASS.
