public with sharing class triggtask14 {
    public triggtask14() {

    }
public static void accountDeleted(List<Account> a)
{
    List <Account> deleteAcc = new List<Account>();

    for (Account acc : a) {
        try {
            for (Account old : [select name FROM Account where name = :acc.name]) {
                deleteAcc.add(old);
            }
            delete deleteAcc;
            
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