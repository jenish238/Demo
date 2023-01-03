public with sharing class task13 {
    public task13() {

    }
    public static void eventman(List<Contact> a){

        List<Event> events = new List<Event>();

        for (Contact con : a) {
          try {
            Event e   = new Event();
            e.StartDateTime     = date.today();
            e.EndDateTime       = Date.today() +10;
            e.Subject           = 'call';
            e.WhoId             = con.Id;
            e.OwnerId           = con.OwnerId;
            events.add(e);
            insert events;
            
          } catch (Exception ex) {
            System.debug(ex);
            String stackTrace = ex.getStackTraceString().substringBefore('\n');
            String className = stackTrace.substringAfter('.').substringBefore('.');	
            System.debug(className);
            String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
            System.debug(methodName);
            errorclass.ExceptionRecords(className,methodName,ex.getMessage(),ex.getLineNumber(),ex.getTypeName(),ex.getStackTraceString());
          }
             
        }
   
    }
}