*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZBBO_TABLEABAP1
*   generation date: 03/06/2020 at 17:15:01
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZBBO_TABLEABAP1    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
