@AbapCatalog.sqlViewName: 'ZBBO_CUST_APP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customers Data'

@OData.publish: true

@UI.headerInfo:{
    typeName: 'Customer',
    typeNamePlural: 'Customers'
}

define view ZBBO_SCP_CUSTOMERS_APP as select from kna1 {
    //KNA1
    @UI: {lineItem: {position: 10, importance: #HIGH, label: 'Customer'}, identification: {position: 10, importance: #HIGH}}
    key kunnr as Customer,
    @UI: {lineItem: {position: 20, importance: #HIGH, label: 'Country'}, selectionField.position: 10, identification: {position: 20, importance: #HIGH}}
    land1 as Country,
    @UI: {lineItem: {position: 30, importance: #HIGH, label: 'City'}, selectionField.position: 20, identification: {position: 30, importance: #HIGH}}
    ort01 as City,
    @UI: {lineItem: {position: 40, importance: #HIGH, label: 'Postal Code'}, identification: {position: 40, importance: #HIGH}}
    pstlz as PostalCode,
    @UI: {lineItem: {position: 50, importance: #HIGH, label: 'Region'}, identification: {position: 50, importance: #HIGH}}
    regio as Region,
    @UI: {lineItem: {position: 60, importance: #HIGH, label: 'Street'}, identification: {position: 60, importance: #HIGH}}
    stras as Street,
    @UI: {lineItem: {position: 70, importance: #HIGH, label: 'Address'}, identification: {position: 70, importance: #HIGH}}
    adrnr as Address
}
