public with sharing class AccountTriggerHandler extends OnInsertRocket {
  public AccountTriggerHandler(Set<SObject> newSet) {
    super(newSet);
  }
  public void flyOnBefore() {
    for (SObject obj : newSet) {
      Account acct = (Account) obj;
      if (acct.BillingCity == null || acct.BillingCity.trim() == '') {
        acct.BillingCity = 'Sydney';
      }
    }
  }
  public void flyOnAfter() {
    Set<ID> acctIds = new Set<ID>();
    for (SObject obj : newSet) {
      acctIds.add(obj.Id);
    }
    if (Schema.sObjectType.Contact.isAccessible() && Schema.sObjectType.Contact.isCreateable()) {
      List<AggregateResult> results = [SELECT COUNT(Id) total, AccountId FROM Contact WHERE AccountId IN :acctIds GROUP BY AccountId];
      Set<Id> acctIdsWithContacts = accountIdSet(results);
      insert newContactsOfEmptyAccounts(acctIds, acctIdsWithContacts);
    }
  }

  private Set<Id> accountIdSet(List<AggregateResult> results) {
    Set<Id> accountIdSet = new Set<Id>();
    for (AggregateResult res : results) {
      accountIdSet.add((Id)res.get('AccountId'));
    }
    return AccountIdSet;
  }

  private List<Contact> newContactsOfEmptyAccounts(Set<Id> acctIds, Set<Id> subAcctIds) {
    List<Contact> newContacts = new List<Contact>();
    for (Id acctId : acctIds) {
      if (!subAcctIds.contains(acctId)) {
        Contact contact = new Contact(
          AccountId = acctId,
          FirstName = 'Default',
          Lastname = 'Contact'
        );
        newContacts.add(contact);
      }
    }
    return newContacts;
  }
}
