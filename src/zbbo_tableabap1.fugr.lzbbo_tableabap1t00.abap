*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 03/06/2020 at 17:15:02
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZFORNECEDOR.....................................*
DATA:  BEGIN OF STATUS_ZFORNECEDOR                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFORNECEDOR                   .
CONTROLS: TCTRL_ZFORNECEDOR
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFORNECEDOR                   .
TABLES: ZFORNECEDOR                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
