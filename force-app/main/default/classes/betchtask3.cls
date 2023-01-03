// public with sharing class betchtask3 {
//     public betchtask3() {

//     }
// }
global class betchtask3 implements Database.Batchable<sobject>, Database.stateful{
    public List<String> emailList{set;get;}
    public integer count = 0;
    public void sendmail(Integer a)
    { 
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
       
        email.setSubject(' owner change');
        email.setPlainTextBody('You are the owner of :-'+ a );
        email.setToAddresses(emailList);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }

    global final User currentOwner;
    global final User newOwner;


    
 
    global betchtask3(){
 

        //0055g00000F9sOOAAZ
       currentOwner = [SELECT ID FROM User WHERE Username ='jenish238@gmail.com'];
    // currentOwner = '0055g00000F9sOOAAZ';
      //  System.debug(currentOwner);
       newOwner = [SELECT ID FROM User WHERE Username = 'jenishgangani238@gmail.com' ];
    // newOwner = '0055g00000GSig1AAD';
       System.debug(newOwner);
    }
 
    global Database.QueryLocator start(Database.BatchableContext BC){
    //    String currentOwnerId = currentOwner.Id;
       System.debug( 'this is the start method bro bro');
       return Database.getQueryLocator('SELECT Id, OwnerId FROM Account');
    }
 
    global void execute(Database.BatchableContext BC, List<Account> accts){
       
      for(Account acct : accts){
       acct.OwnerId = newOwner.Id; 
       System.debug('this is the acct.ownerId' +  acct.OwnerId);
       System.debug('this is the newOwner.ID' + newOwner.Id);
      }
      // update accts;
      // System.debug(accts.size());
      count += accts.size();
      System.debug(count);
     }
 
    global void finish(Database.BatchableContext BC){
      System.debug(count);
      emailList=new List<String>();
       List<User> a = new List<User>([SELECT email FROM User WHERE Username ='jenish238@gmail.com']);
       System.debug(a[0].Email);
       emailList.add(a[0].email);
       System.debug(emailList);
      // Integer z = [SELECT COUNT() FROM Account];
       sendmail(count);
        System.debug('finish bro i am good think bro');
    }
 }