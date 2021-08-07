class ZBBO_CALCULATOR definition
  public
  create public .

public section.

  types:
    TY_FIBONACCI type SORTED TABLE OF i WITH NON-UNIQUE KEY table_line .

  methods ADDITION
    importing
      !OPERATOR_1 type F
      !OPERATOR_2 type F
    returning
      value(RESULT) type F .
  methods SUBTRACTION
    importing
      !OPERATOR_1 type F
      !OPERATOR_2 type F
    returning
      value(RESULT) type F .
  methods MULTIPLICATION
    importing
      !OPERATOR_1 type F
      !OPERATOR_2 type F
    returning
      value(RESULT) type F .
  methods DIVISION
    importing
      !OPERATOR_1 type F
      !OPERATOR_2 type F
    returning
      value(RESULT) type F .
  methods FIBONACCI
    importing
      !IM_QUANTITY type I
    returning
      value(RE_RESULT) type TY_FIBONACCI .
protected section.
private section.
ENDCLASS.



CLASS ZBBO_CALCULATOR IMPLEMENTATION.


  METHOD addition.
    result = operator_1 + operator_2.
    WRITE result.

  ENDMETHOD.


  method DIVISION.
*    IF
*      operator_01 EQ 0 OR operator_02 EQ 0.
*      result = 0.
*    ELSE.
*      result = operator_01 / operator_02.
*    ENDIF.

    TRY.
        result = operator_1 / operator_2.
        WRITE result.
      CATCH cx_sy_zerodivide INTO DATA(error).
        MESSAGE e000(zbbo) DISPLAY LIKE 'I'.
    ENDTRY.
  endmethod.


  method FIBONACCI.
    DATA: current  TYPE i VALUE 1,
          previous TYPE i,
          SUM TYPE I.
    RE_RESULT = VALUE #( ( 1 ) ).
    DO im_quantity - 1 TIMES.
      SUM = PREVIOUS + CURRENT.

      APPEND SUM TO re_result.
      previous = current.
      current = SUM.
    ENDDO.
  endmethod.


  method MULTIPLICATION.
    result = operator_1 * operator_2.
  endmethod.


  method SUBTRACTION.
    result = operator_1 - operator_2.
  endmethod.
ENDCLASS.
