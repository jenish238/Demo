// i am cretae a contactList for aura componect that using part


public with sharing class contactList {
    public contactList() {

    }
    @AuraEnabled
    public static List<Contact> getContacts(Id recodeID){
            return [Select Id, FirstName,LastName,Email,phone
            from Contact WHERE AccountId =: recodeID];
            
    
    }
   
}