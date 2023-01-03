trigger task5 on Account (before insert,before update) {
 
    if(Trigger.isInsert || Trigger.isUpdate){
    for(Account o : Trigger.new){
        try {
            o.Ownership = 'Public';
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
}