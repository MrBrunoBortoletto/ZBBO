*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/12/2020 at 16:06:51
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZBBO_PURCHASE...................................*
DATA:  BEGIN OF STATUS_ZBBO_PURCHASE                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBBO_PURCHASE                 .
CONTROLS: TCTRL_ZBBO_PURCHASE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBBO_PURCHASE                 .
TABLES: ZBBO_PURCHASE                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
