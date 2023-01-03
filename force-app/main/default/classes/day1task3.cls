public with sharing class day1task3 {
    public day1task3() {

    }    
    public static void aa(List<Contact> cs){

     Set<Id> accountIds = new Set<Id>();
     System.debug('first 1 ' + accountIds);
     List<Contact> contacts=new List<Contact>();
     System.debug('secound 2'+ contacts);

     List<Contact> contactList = cs;

    System.debug('contactlist st3'+ contactList);
    for (Contact c : contactList) {
        System.debug(' c is the st4' + c);
        System.debug('c.Amount__c' + c.Amount__c);
        if (Trigger.isInsert) {
            
            System.debug('if in st5');
            accountIds.add(c.AccountId);
            System.debug('add account in ID st6' + accountIds);
        }
    }

    List<Account> accountToUpdate = [SELECT Id,Max_Amount__c,Name FROM Account WHERE Id IN :accountIds];
    System.debug('account update st7'+ accountToUpdate);

    for (Contact con  : cs) 
    
    {
        System.debug('con st9'+con);
        System.debug( con.Amount__c);
      
        

        if ( con.Amount__c!=null && con.Amount__c >=accountToUpdate[0].Max_Amount__c && con.AccountId!=null ) 
        {
            System.debug('if condition in st12');
            decimal total = con.Amount__c;
            System.debug('for loop contact object st13');
                Contact con1=new Contact();
                con1.LastName=accountToUpdate[0].Name ;
                con1.AccountId = accountToUpdate[0].Id;
                con1.Amount__c = con.Amount__c- accountToUpdate[0].Max_Amount__c;
                contacts.add(con1);
                insert contacts;
             con.Amount__c = accountToUpdate[0].Max_Amount__c;
            }
            System.debug('list of contacts' + contacts);
           
            contacts.clear();
            
        
    }
// }
    
   
    System.debug('have insert thase' );
}



public static void updatcon(List<Contact> xx){

    Set<Id> accountIds = new Set<Id>();
    System.debug('method update');
    System.debug('first 1 ' + accountIds);
    List<Contact> contacts=new List<Contact>();
    System.debug('secound 2'+ contacts);

    List<Contact> contactList = xx;

   System.debug('contactlist st3'+ contactList);
   for (Contact c : contactList) {
       System.debug(' c is the st4' + c);
       System.debug('c.Amount__c' + c.Amount__c);
       if (Trigger.isUpdate || Trigger.isInsert) {
           
           System.debug('if in st5');
           accountIds.add(c.AccountId);
           System.debug('add account in ID st6' + accountIds);
       }
   }

   List<Account> accountToUpdate = [SELECT Id,Max_Amount__c,Name FROM Account WHERE Id IN :accountIds];
   System.debug('account update st7'+ accountToUpdate);

   for (Contact con  : xx) 
   
   {
       System.debug('con st9'+con);
       System.debug( con.Amount__c);
     
       

       if ( con.Amount__c!=null && con.Amount__c >=accountToUpdate[0].Max_Amount__c && con.AccountId!=null ) 
       {
           System.debug('if condition in st12');
           System.debug('for loop contact object st13');
               Contact con1=new Contact();
               con1.LastName=accountToUpdate[0].Name ;
               con1.AccountId = accountToUpdate[0].Id;
               con1.Amount__c = con.Amount__c- accountToUpdate[0].Max_Amount__c;
               contacts.add(con1);
               insert contacts;
            con.Amount__c = accountToUpdate[0].Max_Amount__c;
            System.debug('list of contacts' + contacts); 
           }
        
       
   }
// }
   
  
   System.debug('have insert thase' );
}
}   
    





















// public static void task(List<Contact> contactlist){
       
//     Set<Id> accid = new Set<Id>();
//     List<Contact> ww = new list<contact>();
//     Contact a = new Contact();
//      for (Contact con : contactlist) {
//        accid.add(con.AccountId);
//      }
//      System.debug('st1'+accid);
//      List<Account> dsa = [SELECT Id,Max_Amount__c,Name FROM Account WHERE Id IN :accid]; 
//      System.debug('st2'+ dsa);
//      for(Account ac : dsa)
//      {
       
//         Integer i =0;
//      while (i<1)
//       {
//         a.LastName = 'new open' + i;
//         a.AccountId =ac.Id;
//          ww.add(a);
//          i++; 
//      } 
    
//     }
//     System.debug(ww);
//     insert ww;
// }