class ZCL_BBO_A_CHANGE_STATUS definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCLASS
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_BBO_A_CHANGE_STATUS IMPLEMENTATION.


  method /BOBF/IF_FRW_ACTION~EXECUTE.
     DATA header_table TYPE zbbo_t_root.

    io_read->retrieve(
      EXPORTING
        iv_node = zif_bbo_purchase_order_c=>sc_node-root
        it_key  = it_key
      IMPORTING
        et_data = header_table
    ).

    DATA(header) = REF zbbo_s_root( header_table[ 1 ] ).
    header->status = SWITCH #( header->status
      WHEN 'N' THEN 'P'
      WHEN 'P' THEN 'F'
      ELSE 'P'
    ).

    io_modify->update(
        iv_node = zif_bbo_purchase_order_c=>sc_node-root
        iv_key  = it_key[ 1 ]-key
        is_data = header
    ).

  endmethod.
ENDCLASS.
