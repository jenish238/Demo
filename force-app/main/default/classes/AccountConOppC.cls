public class AccountConOppC {

    public string recid{get;set;}    
    public list<Account> Acclst{get;set;}
    public List<Contact> contacts {get; set;}
    
    public AccountConOppC(){
        Acclst = [SELECT Id, Name, Phone, BillingCountry, BillingPostalCode, BillingState, BillingCity, BillingStreet FROM Account LIMIT 10];
        contacts=null;
    }
    
    public void showDetails() {
        contacts=[SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId=:recId];
    }
}