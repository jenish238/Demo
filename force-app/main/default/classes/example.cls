// check the exception exmple

public class example {
    public  void ExcTest() {
            try{
                Integer b = 1/0;
            }catch(Exception e){
                
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