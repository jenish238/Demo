public with sharing class task11 {
    public task11() {

    }
    public static void main1(List<Account> a){
      
        for (Account acc : a) {
            if(acc.Rating == 'hot'){

                try {
                    AccountShare accShare = new AccountShare();
                    accShare.AccountId = acc.Id;
                    accShare.UserOrGroupId = '0055g00000GSig1AAD';
                    accShare.AccountAccessLevel = 'Read';
                    accShare.OpportunityAccessLevel = 'Read';
                    insert accShare;
                    
                } catch (Exception e) {
                    
                    System.debug(e);
                    String stackTrace = e.getStackTraceString().substringBefore('\n');
                    String className = stackTrace.substringAfter('.').substringBefore('.');	
                    System.debug(className);
                    String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
                    System.debug(methodName);
                    errorclass.ExceptionRecords(className,methodName,e.getMessage(),e.getLineNumber(),e.getTypeName(),e.getStackTraceString());
                    //  Error_log__c c = new Error_log__c();
                    //  List<Error_log__c> er = new List<Error_log__c>();
                    //  c.Name = className;
                    //  c.Method_Name__c = methodName;
                    //  c.Line_Number__c = e.getLineNumber();
                    //  c.Exception_Message__c = e.getMessage();
                    //  c.Exception_Type__c =e.getTypeName();
                    //  c.More_Details__c =e.getStackTraceString();
                    //  System.debug('ok');
                     
                    //  er.add(c);
                    //  System.debug('ok1');
                    //  insert er;
                    //  System.debug('ok2');
                    // //  insert c;
                    //  System.debug('ok3');

                }
          
               
               
    
   
            }
        } 
    }
}





            
    // accShare.setAccountId(acc.getId());
    // accShare.setUserOrGroupId(userId);
    // accShare.setAccountAccessLevel('Edit');
    // accShare.setOpportunityAccessLevel('Read');
    // accShare.setCaseAccessLevel('Edit');
    // accShares.add(retingAcc);



     // accShare.AccessLevel = 'Edit';
                // accShare.setAccountAccessLevel('Read');
                // accShare.setOpportunityAccessLevel('Read');
                // accShare.setCaseAccessLevel('Edit');
                // accShares.add(retingAcc);
                // Database.SaveResult sr = Database.insert(sc,false);



                      // sc.parentId	 = acc.ParentId;
                // // sc.AccountId =
                // '0015g000013O3rQAAS'
                // accShare.ParentId =acc.recordId;
                // accShare.AccountId = ass[0].id;





                  //   acc.name =  acc.Name + 'mr';
            //    a = acc.name; 
                // List<Account> ass = [Select Id from Account WHERE Name = 'Mr.Hello'];
    
                // AccountShare sc = new AccountShare();