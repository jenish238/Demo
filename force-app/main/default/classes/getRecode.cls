public with sharing class getRecode {
    public getRecode() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        try {
           return [SELECT Id,Name,Account_Email__c FROM Account WHERE Account_Email__c != NULL] ;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        try {
            return [SELECT Id,FirstName,LastName,Email FROM Contact WHERE Email != NULL] ;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Lead> GetLead(){
        try {
            return [SELECT Id,Name,Email FROM Lead WHERE Email != NULL] ;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static void sendEmailToController(String body, list<String> toSend, String subject){
        try{
          for (String  a : toSend) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a};
            System.debug('toAddresses:::::' + toAddresses);
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setHtmlBody( body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
          }
           
        }catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }

    

}