Public with sharing class TimeCardController{

    public login__c reg { set; get;}
    public List<login__c> Loginuser{get; set;} 
    public String passcode{get; set;}
    public Boolean Match{get; set;}
    public Boolean NoMatch{get; set;}
   
    Public TimeCardController(){
        reg = new login__c();
    }
   
   Public PageReference Login(){
       Loginuser =new List<login__c>();
       Match=false;
       NoMatch=false;
       
       Loginuser=[select Name, password__c from login__c where Name =:reg.Name AND password__c =:reg.password__c];
       
       if(Loginuser.size()>0)
       {
           Match=true;
       }
       else
       {
           NoMatch=true;
       }

    PageReference pageRef = new PageReference('/apex/timecardpage');
        pageRef.setRedirect(true);
        return pageRef;
   }
    
    public PageReference doCancel()
    {
        PageReference pageRef = new PageReference('/apex/timecardpage');
        pageRef.setRedirect(true);
        return pageRef;
    }

  }