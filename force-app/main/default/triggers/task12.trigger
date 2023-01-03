trigger task12 on Account (after  insert) {
    list<Contact> lstCon = new list<Contact>();
    try {
        for(Account Acc: trigger.new){
            Contact con = new Contact ();
            Con.FirstName = 'test';
            Con.AccountId = Acc.Id;
            Con.LastName = Acc.Name;
            lstCon.Add(Con);
            
        }
    insert lstCon;
        
    } catch (Exception e) {
        System.debug(e);
        String stackTrace = e.getStackTraceString().substringBefore('\n');
        String className = stackTrace.substringAfter('.').substringBefore(':');
        System.debug(className);
        String methodName = className;
        System.debug(methodName);
            errorclass.ExceptionRecords(className,methodName,e.getMessage(),e.getLineNumber(),e.getTypeName(),e.getStackTraceString()); 
    }
    
}