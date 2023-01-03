public class Registerpage {
    public String fieldValue {get; set;}
    public Integer a;
    public Contact con {get;set;}
    public Registerpage() {
        con = new Contact();
       
    }

    public PageReference signUp()
    {
        insert con;
        System.debug(con.Id);
        con = new Contact();
       
      PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
      pageRef.setRedirect(true);
      return pageRef; 
    }
}