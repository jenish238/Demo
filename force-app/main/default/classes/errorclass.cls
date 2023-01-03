//Create on Error log class which should contain the method that creates theException records.
// this code create a recode in error_log object




public with sharing class errorclass {
    public errorclass() {

    }
    public static void ExceptionRecords(String className,String MethodName,String Message,Integer lineNumber,String TypeName,String Detail){
        Error_log__c c = new Error_log__c();
        List<Error_log__c> er = new List<Error_log__c>();
        c.Name = className;
        c.Method_Name__c = MethodName;
        c.Line_Number__c = lineNumber;
        c.Exception_Message__c = Message;
        c.Exception_Type__c =TypeName;
        c.More_Details__c =Detail;
        er.add(c);
        insert er;
    }
}