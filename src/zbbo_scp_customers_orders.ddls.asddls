@AbapCatalog.sqlViewName: 'ZSCP_CUST_ORDERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customers Orders Data'

@OData.publish: true

define view ZBBO_SCP_CUSTOMERS_ORDERS as select from ZBBO_SCP_CUSTOMERS
association [1] to ZBBO_SCP_SALESORDERS 
    on $projection.Customer = ZBBO_SCP_SALESORDERS.SoldToParty {
    //ZBBO_SCP_CUSTOMERS
    key Customer,
    key ZBBO_SCP_SALESORDERS.SalesDocument,
    Country,
    City,
    PostalCode,
    Region,
    Street,
    Telephone1,
    Address,
    ZBBO_SCP_SALESORDERS.SalesDocumentCategory,
    ZBBO_SCP_SALESORDERS.NetValue,
    ZBBO_SCP_SALESORDERS.Currency,
    ZBBO_SCP_SALESORDERS.SalesOrg,
    ZBBO_SCP_SALESORDERS.DistrChannel,
    ZBBO_SCP_SALESORDERS.Division,
    ZBBO_SCP_SALESORDERS.SalesGroup,
    ZBBO_SCP_SALESORDERS.SalesOffice,
    ZBBO_SCP_SALESORDERS.BusinessArea,
    ZBBO_SCP_SALESORDERS.SoldToParty
}
