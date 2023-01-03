trigger day1task1 on Contact (after insert,after update,before delete)
 {
    public static Decimal b=0;
if (trigger.isInsert || trigger.isUpdate ) 
{
    for (Contact con : trigger.new) 
    {
        if (con.LastName != null && con.Amount__c != null && con.AccountId != null)
        {
            List<AggregateResult> l   = [select SUM(Amount__c)  FROM Contact WHERE AccountId =: con.AccountId];
        //     System.debug(a);
        //     for (Decimal i =0; i<a.size(); i++) {
        //         b = b + a[i].Amount__c;
        //         System.debug(b);
        // }
        System.debug(l);
        System.debug(l);
        // Decimal d = Decimal.valueOf(l);
       
        // c.Total_Amount_look_up__c = l;
        List<Account> a = [select Id FROM account WHERE ID =: con.AccountId ];
        System.debug(a);
        for (Account acc : a) {
        acc.Total_Amount_look_up__c = 3070;
        System.debug(acc);
        update acc;
    }
    }


   
}
}


else {
    if (trigger.isDelete) {
        for (Contact con : trigger.new) {
            List<AggregateResult> l   = [select SUM(Amount__c)  FROM Contact WHERE AccountId =: con.AccountId];
            List<Account> a = [select Id FROM account WHERE ID =: con.AccountId ];
        System.debug(a);
        for (Account acc : a) {
        acc.Total_Amount_look_up__c = 2030;
        System.debug(acc);
        update acc;
        }
    }
}
}

}

// Total_Amount_look_up__c