public with sharing class Deshbord {
    public list<Contact> displaycon {get; set;}
    public List<Opportunity> displayopp {get; set;}
    public Deshbord() {
        displaycon = [select id,Name,AccountId,Age__c,Birthdate,Email,Languages__c,Level__c from Contact];
        displayopp = [select id,Name,CloseDate,StageName from Opportunity];
    }
}






// public class Deshbord {

//     public string recid{get;set;}    
//     public list<Account> Acclst{get;set;}
//     public List<Contact> contacts {get; set;}
//     public List<Opportunity> opportunities {get; set;}
    
//     public Deshbord(){
//         Acclst = [SELECT Id, Name, Phone, BillingCountry, BillingPostalCode, BillingState, BillingCity, BillingStreet FROM Account LIMIT 10];
//         contacts=null;
//         opportunities=null;
//     }
    
//     public void showDetails() {
//         contacts=[SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId=:recId];
//         opportunities=[SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE AccountId=:recId];
//     }
// }