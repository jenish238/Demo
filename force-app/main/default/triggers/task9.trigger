trigger task9 on Contact (after delete) {

    List<ID> contactIDList = new List<ID>();

if(Trigger.isDelete){
    try {
        for(Contact contactToDelete: Trigger.old) {
            contactIDList.add(contactToDelete.AccountId);
        }
      
       
       List<Account> DelAccountRecordList = [select id from Account where Id IN:contactIDList];
    
        if(DelAccountRecordList.size() >0){
           delete DelAccountRecordList ;
         
        }
        
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
}