@AbapCatalog: {
  sqlViewName: 'ZBBO_ACCRECINST',
  compiler.compareFilter: true,
  preserveKey: true
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account receivable installment'
@ObjectModel: {
  semanticKey: ['header_id','installment_id'],
  representativeKey: 'installment_id',
  transactionalProcessingEnabled: true,
  writeActivePersistence: 'ZBBO_INSTALLMENT',
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true
}
define view ZBBO_I_AccRecInstallment
  as select from zbbo_installment as Installment
  association [0..1] to zbbo_I_AccountReceivable as _Header              on  $projection.header_id = _Header.id
  association [0..1] to I_Customer               as _Customer            on  $projection.customer = _Customer.Customer
  association [0..*] to I_CustomerBankDetails    as _CustomerBankDetails on  $projection.customer     = _CustomerBankDetails.Customer
                                                                         and $projection.bank_id      = _CustomerBankDetails.Bank
                                                                         and $projection.bank_account = _CustomerBankDetails.BankAccount
{
  key Installment.header_id,
  key Installment.installment_id,
      Installment.amount,
      Installment.due_date,
      Installment.payment_date,
      Installment.interest_rate,
      Installment.penalty_rate,
      Installment.currency_key,
      @Semantics.amount.currencyCode: 'currency_key'
      Installment.penalty_amount,
      @Semantics.amount.currencyCode: 'currency_key'
      Installment.interest_amount,
      @Semantics.amount.currencyCode: 'currency_key'
      Installment.payment_amount,
      Installment.customer,
      Installment.bank_id,
      Installment.bank_account,
      Installment.status,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
      _Header,
      @ObjectModel.foreignKey.association: '_Customer'
      _Customer,
      @ObjectModel.foreignKey.association: '_CustomerBankDetails'
      _CustomerBankDetails

}
