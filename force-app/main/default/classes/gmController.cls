Public class gmController{

    public login__c reg { set; get;}
    public List<login__c> gmailuser{get; set;}
    public Boolean Match{get; set;}
    public Boolean NoMatch{get; set;}
   
    Public gmController(){
        reg = new login__c();
    }
   
   Public PageReference timecardsignin(){
       gmailuser =new List<login__c>();
       Match=false;
       NoMatch=false;
       
       gmailuser=[select Name, password__c from login__c where Name =:reg.Name AND password__c =:reg.password__c];
       
       if(gmailuser.size()>0)
       {
           Match=true;
           PageReference pageRef = new PageReference('https://mvclouds-c-dev-ed.develop.lightning.force.com/lightning/o/Account/list?filterName=Recent');
           pageRef.setRedirect(true);
           return pageRef;
       }
       else
       {
           NoMatch=true;
           return null;
       }
    
   }
    
  
  }