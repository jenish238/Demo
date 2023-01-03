public with sharing class ContactsVisualforceController {
    public list<Account> displayAccounts {get; set;}
    public ContactsVisualforceController() {
        displayAccounts = [select id,name,(select id,LastName from Contacts) from Account];
    }
}