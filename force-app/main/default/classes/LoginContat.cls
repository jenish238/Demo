public class LoginContat {

    public Contact reg { set; get;}
    public List<Contact> gmailuser{get; set;}
    public Boolean Match{get; set;}
    public Boolean NoMatch{get; set;}

    public LoginContat() {
        reg = new Contact();
    }

    Public PageReference timecardsignin(){
        gmailuser =new List<Contact>();
        Match=false;
        NoMatch=false;
        
        gmailuser=[select Email,password__c from Contact where Email =:reg.Email AND password__c =:reg.password__c];
        
        if(gmailuser.size()>0)
        {
            Match=true;
            PageReference pageRef = new PageReference('https://mvclouds-c-dev-ed--c.develop.vf.force.com/apex/day2task3');
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