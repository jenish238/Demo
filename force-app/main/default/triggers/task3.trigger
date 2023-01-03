trigger task3 on Opportunity (before insert,before update) {
 
    if(Trigger.isInsert || Trigger.isUpdate){
    for(Opportunity o : Trigger.new){
        try {
            o.StageName = 'Prospecting';
            o.CloseDate = Date.Today()+15;  
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