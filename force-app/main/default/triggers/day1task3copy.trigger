trigger day1task3copy on Contact (before insert,before update) {


    if (trigger.isInsert) {
        System.debug('insert 1');
        day1task3copy.insertcon(trigger.new);
    }
    if (trigger.isUpdate) {
        System.debug('good');
        day1task3copy.updatecon(trigger.new);
    }
       
    }
    

    // for (Contact c : Trigger.new) {
    //     if(c.Amount__c != null){
    //         List<Account> acc = [Select Id, Max_Amount__c from Account where Id = :c.AccountId];
    //         if(acc[0].Max_Amount__c != null){
    //             if(c.Amount__c > acc[0].Max_Amount__c){
    //                 //add maximum possible amount to Amount2__c field and create a new contact record where Amount2__c = Amount2__c - Max_Amount__c
    //                 Contact con = new Contact();
    //                 //add last name to the contact
    //                 con.LastName = c.LastName;
    //                 con.AccountId = c.AccountId;
    //                 con.Amount__c = c.Amount__c - acc[0].Max_Amount__c;
    //                 insert con;
    //                 c.Amount__c = acc[0].Max_Amount__c;
    //             }
    //         }

    //     }
    // }

// }