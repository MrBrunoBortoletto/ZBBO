@AbapCatalog.sqlViewName: 'ZSCPCUSTOMERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customers Data'
define view ZBBO_SCP_CUSTOMERS as select from kna1 {
    //kna1
    key kunnr as Customer,
    land1 as Country,
    name1 as Name,
    name2 as Name2,
    ort01 as City,
    pstlz as PostalCode,
    regio as Region,
    sortl as SearchTerm,
    stras as Street,
    telf1 as Telephone1,
    telfx as Fax,
    xcpdk as OneTimeAccount,
    adrnr as Address,
    mcod1 as Name3,
    mcod2 as Name4,
    mcod3 as City2,
    anred as Title,
    aufsd as OrderBlock
}
