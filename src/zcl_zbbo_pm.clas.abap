class ZCL_ZBBO_PM definition
  public
  final
  create public .

public section.

  methods CREATENOTIFICATION
    importing
      value(NOTIFICATION_TYPE) type BAPI2080-NOTIF_TYPE
      value(SHORT_TEXT) type BAPI2080_NOTHDRI-SHORT_TEXT optional
      value(REPORTED_BY) type BAPI2080_NOTHDRI-REPORTEDBY optional
      value(EXPECTED_DATE) type BAPI2080_NOTHDRI-DESENDDATE optional
      value(PRIORITY) type BAPI2080_NOTHDRI-PRIORITY optional
      value(EXPECTED_HOUR) type BAPI2080_NOTHDRI-DESENDTM optional
    changing
      value(RETURN_TABLE) type ZS_ZBBO_CLASS_PM .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZBBO_PM IMPLEMENTATION.


method CREATENOTIFICATION.

  DATA: s_notifheader TYPE bapi2080_nothdri,
        s_notifheader_save TYPE bapi2080_nothdre,
        notifnumber_message TYPE bapi2080_nothdre.

*  TYPES: BEGIN OF t_return,
*          type    TYPE BAPI_MTYPE,
*          message TYPE BAPI_MSG,
*  END OF t_return.
*
  DATA: it_return TYPE TABLE OF bapiret2,
        wa_return LIKE LINE OF it_return.

  s_notifheader-short_text = short_text.
  s_notifheader-priority   = priority.
  s_notifheader-reportedby = reported_by.
  s_notifheader-desenddate = expected_date.
  s_notifheader-desendtm   = expected_hour.

  CALL FUNCTION 'BAPI_ALM_NOTIF_CREATE'
    EXPORTING
      notif_type = notification_type
      notifheader = s_notifheader
    IMPORTING
      notifheader_export = s_notifheader_save
    TABLES
      return = it_return.

*  IF return_table-type EQ 'E' AND sy-subrc EQ 0.
*    MESSAGE | ERRO: { return_table-message } | TYPE 'I'.
*  ELSE.
*      CALL FUNCTION 'BAPI_ALM_NOTIF_SAVE'
*        EXPORTING
*          number = s_notifheader_save-notif_no
*        IMPORTING
*          notifheader = notifnumber_message
*        TABLES
*          return = return_table.
*
*      IF sy-subrc EQ 0.
*        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*          IMPORTING
*            return = return_table.
**        MESSAGE |Notificação { notifnumber_message-notif_no } criada com sucesso!| TYPE 'S'. *>>> O tipo "Sucesso" é muito sem graça para usar
*        MESSAGE |Notificação { notifnumber_message-notif_no } criada com sucesso!| TYPE 'I'.
*      ELSE.
*        MESSAGE | ERRO: { return_table-message } | TYPE 'I'.
*      ENDIF.
*  ENDIF.
endmethod.
ENDCLASS.
