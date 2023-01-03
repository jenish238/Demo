public with sharing class day1task3copy {
    public day1task3copy() {

    }

    public static void insertcon(List<Contact> ac){
        System.debug('insert');
        for (Contact c : ac) {
            if(c.Amount__c != null){
                List<Account> acc = [Select Id, Max_Amount__c from Account where Id = :c.AccountId];
                if(acc[0].Max_Amount__c != null){
                    if(c.Amount__c > acc[0].Max_Amount__c){
                        Contact con = new Contact();
                        con.LastName = c.LastName;
                        con.AccountId = c.AccountId;
                        con.Amount__c = c.Amount__c - acc[0].Max_Amount__c;
                        System.debug('con.Amount__c'+con.Amount__c);
                        insert con;
                        c.Amount__c = acc[0].Max_Amount__c;
                        System.debug('c.Amount__c'+ c.Amount__c);
                    }
                }
    
            }
        }
    }


    public static void updatecon(List<Contact> up){
        System.debug('update');
        for (Contact c : up) {
            if(c.Amount__c != null){
                List<Account> acc = [Select Id, Max_Amount__c from Account where Id = :c.AccountId];
                if(acc[0].Max_Amount__c != null){
                    if(c.Amount__c > acc[0].Max_Amount__c){
                        Contact con = new Contact();
                        con.LastName = c.LastName;
                        con.AccountId = c.AccountId;
                        con.Amount__c = c.Amount__c - acc[0].Max_Amount__c;
                        System.debug('con.Amount__c'+con.Amount__c);
                        insert con;
                        c.Amount__c = acc[0].Max_Amount__c;
                        System.debug('c.Amount__c'+ c.Amount__c);
                    }
                }
    
            }
        }

    }
}