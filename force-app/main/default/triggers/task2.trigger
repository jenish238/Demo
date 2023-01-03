trigger task2 on Lead (before insert) {
    if(Trigger.isInsert){
        try {
            for(Lead eachLead: Trigger.New){
                eachLead.Rating = 'Hot';
            }
            Integer a =1/0;
            
        } catch (Exception e) {
            System.debug(e);
            System.debug(e.getStackTraceString());
                    String stackTrace = e.getStackTraceString().substringBefore('\n');
                    String className = stackTrace.substringAfter('.').substringBefore(':');
                    System.debug(className);
                    // String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
                    String methodName = className;
                    System.debug(methodName);
                    errorclass.ExceptionRecords(className,methodName,e.getMessage(),e.getLineNumber(),e.getTypeName(),e.getStackTraceString());
        }
        
    }
}