trigger task7 on Opportunity (after update) {
    List<Task> tasks = new List<Task>();
    try {
        for(Opportunity opp : Trigger.New){
            if(opp.Name != Trigger.oldmap.get(opp.Id).Name){
                 tasks.add(new Task(OwnerId = opp.OwnerId,Subject = 'Follow Up Test Task',WhatId = opp.Id));   
            } 
        }
        if(tasks.size() > 0){
            insert tasks;
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