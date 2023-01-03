public with sharing class catchAccount {
    public catchAccount() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        try {
            return [SELECT Id, Name FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @auraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accountId)
    {
        System.debug('naem'+ accountId);
        List<Contact> conList=[SELECT Id,FirstName,LastName FROM Contact WHERE AccountId=:accountId LIMIT 10000];
        System.debug('conlist:::::'+conList);
        if (conList.isEmpty()) {
            return null;
        }
        return conList;
    }
    @auraEnabled(cacheable=true)
    public static List<Opportunity> fetchOpportunity(String accountId)
    {
        System.debug('naem'+ accountId);
        List<Opportunity> oppList=[SELECT Id,Name,AccountId FROM Opportunity WHERE AccountId=:accountId LIMIT 10000];
        System.debug('opplist:::'+ oppList);
        if (oppList.isEmpty()) {
            return null;
        }
        return oppList;
    }  
   
}