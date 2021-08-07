@AbapCatalog: {
  sqlViewName: 'ZBBO_ACCREC',
  compiler.compareFilter: true,
  preserveKey: true
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account receivable'
@ObjectModel: {
  modelCategory: #BUSINESS_OBJECT,
  compositionRoot: true,
  semanticKey: ['id'],
  representativeKey: 'id',  
  transactionalProcessingEnabled: true,
  writeActivePersistence: 'ZBBO_ACC_REC',
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true
}
define view ZBBO_I_AccountReceivable
  as select from zbbo_acc_rec as Header
  association [0..*] to ZBBO_I_AccRecInstallment as _Installments on $projection.id = _Installments.header_id
{
  key Header.id,
      Header.nf,
      Header.issuing_date,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Installments
}
