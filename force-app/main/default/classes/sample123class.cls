public with sharing class sample123class {
    public string passInput{get;set;}
    public Contact con {get;set;}
    public sample123class() {
        con = new Contact();
       
       
    }
// comment open brpoooooo
    // passInput = con.password__c
    // System.debug(passInput);
    
    public PageReference loginmethod() {
       if(Pattern.matches('[[0-9][a-z][A-Z]]*',passInput)){  
        insert con;
        System.debug('hello good morning');
        con = new Contact();
       
      PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
      pageRef.setRedirect(true);
      return pageRef; 
        }
        else{
            apexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'Your password code must have a mix of letters and numbers'));    
            return null;  
        }     
    }
}