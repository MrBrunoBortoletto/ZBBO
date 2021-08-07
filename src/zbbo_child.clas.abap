class ZBBO_CHILD definition
  public
  inheriting from ZBBO_HELLO_WOLRD
  final
  create public .

public section.

  methods GET_CHILD_AREA
    returning
      value(RE_AREA) type F .

  methods SET_RADIUS
    redefinition .
protected section.

  methods GET_AREA
    redefinition .
private section.

  methods SET_AREA .
ENDCLASS.



CLASS ZBBO_CHILD IMPLEMENTATION.


  METHOD get_area.
    re_area = 2 * get_pi( ) * ( radius ** 2 ).
  ENDMETHOD.


  method GET_CHILD_AREA.
    re_area = me->get_area( ).

  endmethod.


  method SET_AREA.
  endmethod.


  method SET_RADIUS.
*CALL METHOD SUPER->SET_RADIUS
*  EXPORTING
*    IM_RADIUS =
*  RECEIVING
*    RETURNING =
*    .
  endmethod.
ENDCLASS.
