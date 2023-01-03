public with sharing class task10p1 {
    public task10p1() {

    }
    public static void aprov(List<Account> a){
        for (Account con : a) {
            if (con.Name!=null && con.Active__c=='Yes') {
                try {
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            req.setObjectId(con.Id);
            Approval.ProcessResult result = Approval.process(req);
            // display if the reqeust was successful
            System.debug('Submitted for approval successfully: '+result.isSuccess());
                    
                } catch (Exception e) {

                    System.debug(e);
                    String stackTrace = e.getStackTraceString().substringBefore('\n');
                    String className = stackTrace.substringAfter('.').substringBefore('.');	
                    System.debug(className);
                    String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
                    System.debug(methodName);
                    errorclass.ExceptionRecords(className,methodName,e.getMessage(),e.getLineNumber(),e.getTypeName(),e.getStackTraceString());
                    
                }
            
}
        }
    }
}