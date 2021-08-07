*&---------------------------------------------------------------------*
*& Report ZBBO_CREATE_NOTIF_BAPI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBBO_CREATE_NOTIF_BAPI.

TABLES: bapi2080_notitemi.

DATA: s_notif_type TYPE bapi2080-notif_type,
      s_notifheader TYPE bapi2080_nothdri,
      s_notifheader_save TYPE bapi2080_nothdre,
      notifnumber_message TYPE bapi2080_nothdre,
      t_return TYPE TABLE OF bapiret2 WITH HEADER LINE,
      t_item_list TYPE TABLE OF bapi2080_notitemi WITH HEADER LINE,
      s_item_list TYPE bapi2080_notitemi.

PARAMETERS: not_type TYPE bapi2080-notif_type OBLIGATORY,
            shor_txt TYPE bapi2080_nothdri-short_text,
            rprtd_by TYPE bapi2080_nothdri-reportedby,
            data_end TYPE bapi2080_nothdri-desenddate,
            priority TYPE bapi2080_nothdri-priority,
            hour_end TYPE bapi2080_nothdri-desendtm.

SELECT-OPTIONS: teste FOR bapi2080_notitemi-dl_code NO INTERVALS.

START-OF-SELECTION.

LOOP AT teste.
  s_item_list-dl_code = teste.
  s_item_list-item_sort_no = sy-tabix.
  APPEND s_item_list TO t_item_list.
  clear s_item_list.
ENDLOOP.

*s_notifheader-short_text = shor_txt.
*s_notifheader-priority   = priority.
*s_notifheader-reportedby = rprtd_by.
*s_notifheader-desenddate = data_end.
*s_notifheader-desendtm   = hour_end.
*
*CALL FUNCTION 'BAPI_ALM_NOTIF_CREATE'
*  EXPORTING
*    notif_type = not_type
*    notifheader = s_notifheader
*  IMPORTING
*    notifheader_export = s_notifheader_save
*  TABLES
**    notitem = t_item_list
*    return = t_return.
*
*IF t_return-type EQ 'E' AND sy-subrc EQ 0.
*  MESSAGE | ERRO: { t_return-message } | TYPE 'I'.
*ELSE.
*    CALL FUNCTION 'BAPI_ALM_NOTIF_SAVE'
*      EXPORTING
*        number = s_notifheader_save-notif_no
*      IMPORTING
*        notifheader = notifnumber_message
*      TABLES
*        return = t_return.
*
*    IF sy-subrc EQ 0.
*      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*        IMPORTING
*          return = t_return.
**      MESSAGE |Notificação { notifnumber_message-notif_no } criada com sucesso!| TYPE 'S'. *>>> O tipo "Sucesso" é muito sem graça para usar
*      MESSAGE |Notificação { notifnumber_message-notif_no } criada com sucesso!| TYPE 'I'.
*    ELSE.
*      MESSAGE | ERRO: { t_return-message } | TYPE 'I'.
*    ENDIF.
*ENDIF.
