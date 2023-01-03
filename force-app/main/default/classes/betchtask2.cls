// public with sharing class betchtask2 {
//     public betchtask2() {

//     }
// }


global class betchtask2 implements Database.Batchable <sObject> {
    
    // List<contact> lstCon = new List<Contact>();
    List<opportunity> opplist = new List<opportunity>();
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id,Name FROM Account';
        System.debug(query);
        // String query = 'SELECT Id, Name,Number_of_contactsss__c,Number_of_opps__c FROM Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> batch) {
        System.debug('aa batch che bro'+batch);
        for (Account a : batch) {
            Opportunity c =  new Opportunity();
            c.AccountId = a.Id;
            c.Name ='opp'+ a.Name +'new';
            c.CloseDate = System.today();
            c.StageName ='Closed Lost';
            System.debug('aa aek opp ni che bro' + c);
            opplist.add(c);
        }
        INSERT opplist;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug('finish bro');
//   AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
      
//         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//         String[] toAddresses = new String[] {a.CreatedBy.Email};
//         mail.setToAddresses(toAddresses);
//         mail.setSubject('Match Merge Batch ' + a.Status);
//         mail.setPlainTextBody('records processed ' + a.TotalJobItems +   'with '+ a.NumberOfErrors + ' failures.');
//         Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
        
    }