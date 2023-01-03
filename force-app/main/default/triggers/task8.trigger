trigger task8 on Account  (before insert) {
    try {
        for (Account a : trigger.New) {
            a.Name = 'Mr.' + a.Name;
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