@AbapCatalog.sqlViewName: 'ZSCPSALESORDERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order'
define view ZBBO_SCP_SALESORDERS as select from vbak {
    //VBAK
    key vbeln as SalesDocument,
    vbtyp as SalesDocumentCategory,
    netwr as NetValue,
    waerk as Currency,
    vkorg as SalesOrg,
    vtweg as DistrChannel,
    spart as Division,
    vkgrp as SalesGroup,
    vkbur as SalesOffice,
    gsber as BusinessArea,
    kunnr as SoldToParty
}
