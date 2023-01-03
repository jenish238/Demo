public class ContactDetailOnClickofAccount{
    public List<Account> accountList{get;set;}
    public Id accountId{get;set;}
    public list<Contact> contactList{get;set;}
    public ContactDetailOnClickofAccount(){
        accountList= new List<Account>();
        // contactList= new List<Conatct>();
        accountList = [SELECT  Id,Name FROM Account LIMIT 500];
    }
    public void getRelatedContact(){
        contactList = [SELECT Id,firstName,LastName FROM Contact WHERE AccountId =:accountId LIMIT 1000];
   }
}