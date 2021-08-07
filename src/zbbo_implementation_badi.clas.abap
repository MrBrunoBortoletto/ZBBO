class ZBBO_IMPLEMENTATION_BADI definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZIF_ALV_BADI .
protected section.
private section.
ENDCLASS.



CLASS ZBBO_IMPLEMENTATION_BADI IMPLEMENTATION.


  METHOD zif_alv_badi~select_data.

    SELECT *
      FROM bkpf
      INTO TABLE @ch_table
      WHERE bldat IN @im_docdat_range.

  ENDMETHOD.
ENDCLASS.
