public class LoginSignUpController {
    public Student__c student{get;set;} //Assume it to be ur custom user
  
  public LoginSignUpController()
  {
      student=new Student__c();
      
  }
      public PageReference login()
      {
         if(student.Student_Phone__c == null)
         {
             return null;
         }
             
             List<Student__c> students= [select Id,Student_Phone__c from Student__c];
          for(Student__c loginStudent:students)
          {
              if((loginStudent.Student_Phone__c == student.Student_Phone__c))
              {
                  PageReference page = new PageReference('/apex/UserStart');
                  page.getParameters().put('studentId', loginStudent.Id);
                  page.setRedirect(true);
                  return page;
              }
          }
                                     
                                     
                                     
          
          return null;
      }
      
      public PageReference signUp()
      {
         insert student;
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
        pageRef.setRedirect(true);
        return pageRef;
  
        
      }
      
      
  }