trigger day1task1copy on Contact(after insert, after update, before delete) {
    Set<Id> accountIds = new Set<Id>();

    List<Contact> contactList = Trigger.isDelete ? Trigger.Old : Trigger.New;
    for (Contact c : contactList) {
        if (Trigger.isDelete || Trigger.isInsert || (c.Amount__c != Trigger.oldMap.get(c.Id).Amount__c)) {
            accountIds.add(c.AccountId);
        }
    }

    List<Account> accountToUpdate = [SELECT Id, (SELECT Amount__c FROM Contacts WHERE Amount__c != null) FROM Account WHERE Id IN :accountIds];
    for (Account acc : accountToUpdate) {
        Decimal total = 0;
        for (Contact c : acc.Contacts) {
            if (Trigger.isAfter || !Trigger.oldMap.containsKey(c.Id)) {
                total += c.Amount__c;
            }
        }
        acc.Total_Amount_look_up__c = total; 
    }
    
    update accountToUpdate;
}