trigger day1task3 on Contact(before insert,before update) {


        
 if (trigger.isInsert) {
    day1task3.aa(trigger.new);
 }
 if (trigger.isUpdate) {
    System.debug('update');
    day1task3.updatcon(trigger.new);
 }
}

//      Set<Id> accountIds = new Set<Id>();
//      System.debug('first 1 ' + accountIds);
//      List<Contact> contacts=new List<Contact>();
//      System.debug('secound 2'+ contacts);


//      // List<Contact> contactList = Trigger.isUpdate ? Trigger.Old : Trigger.New;
//      List<Contact> contactList = Trigger.new;

//     System.debug('contactlist st3'+ contactList);
//     for (Contact c : contactList) {
//         System.debug(' c is the st4' + c);
//         System.debug('c.Amount__c' + c.Amount__c);
//         // System.debug('Trigger.oldMap.get(c.Id).Amount__c'+ Trigger.oldMap.get(c.Id).Amount__c);
//         // (c.Amount__c != Trigger.oldMap.get(c.Id).Amount__c)
//         if (Trigger.isInsert  || Trigger.isUpdate) {
            
//             System.debug('if in st5');
//             accountIds.add(c.AccountId);
//             System.debug('add account in ID st6' + accountIds);
//         }
//     }

//     List<Account> accountToUpdate = [SELECT Id,Max_Amount__c,Name FROM Account WHERE Id IN :accountIds];
//     System.debug('account update st7'+ accountToUpdate);
//     public Decimal count =0;
// for (Account acc : accountToUpdate)
// {
//     System.debug('acc is st8'+acc);
    
//     System.debug(acc.Max_Amount__c);
    
 
    
//     for (Contact con  : trigger.new) 
    
//     {
        
//         if ( con.Amount__c!=null && con.Amount__c >=acc.Max_Amount__c && con.AccountId!=null ) 
//         {
//             System.debug('if condition in st12');
        
           
//             System.debug('for loop contact object st13');
//                 Contact con1=new Contact();
//                 con1.LastName=acc.Name ;
//                 con1.AccountId = acc.Id;
//                 con1.Amount__c =  con.Amount__c- acc.Max_Amount__c;  
//                 contacts.add(con1);
//             System.debug('list of contacts' + contacts);
            
//             con.Amount__c = acc.Max_Amount__c;
//     }
// }
    
// insert contacts;
//     System.debug('have insert thase' );
// }
// }   
// }




















// Set<Id> accountIds = new Set<Id>();
//     System.debug(accountIds);

//     List<Contact> contactList = Trigger.isDelete ? Trigger.Old : Trigger.New;
//     System.debug(contactList);
//     for (Contact c : contactList) {
//         if (Trigger.isDelete || Trigger.isInsert || (c.Amount__c != Trigger.oldMap.get(c.Id).Amount__c)) {
//             accountIds.add(c.AccountId);
//             System.debug('accountIds ma jay che' +accountIds.add(c.AccountId));
//         }
//     }
//     Decimal total = 0;
//     List<Account> accountToUpdate = [SELECT Id, (SELECT Amount__c FROM Contacts WHERE Amount__c != null) FROM Account WHERE Id IN :accountIds];
//     System.debug('account list to update '+accountToUpdate);
//     for (Account acc : accountToUpdate) {
//         System.debug('hello acc bro' + acc);
     
//         for (Contact c : acc.Contacts) {

//             System.debug('hello c bro ' + c);
//             // System.debug('trigeer old map valu bro'+Trigger.oldMap.containsKey(c.Id));
//             if (Trigger.isAfter || !Trigger.oldMap.containsKey(c.Id)) {
                
//                 if (total<c.Amount__c) {
//                     total = c.Amount__c;
//                     System.debug('total'+total);
//                 }
//             }
//         }
//         acc.Total_Amount_look_up__c = total; 
//     }
    
//     update accountToUpdate;