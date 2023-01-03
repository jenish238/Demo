public with sharing class ContactController {
   public contact c{get;set;}


   public ContactController(){
      c = new Contact();
   }
   
public void saveContact(){
   insert c;
   c = new Contact();

}
}

// public with sharing class ContactController {

//     public Contact c { get; set; }

//     public List<Contact> samepage { get; set; }
    
//     public ContactController(){
//        c=new Contact();
//     }
    

//     public PageReference save() {
//        insert c;  

//       samepage= [select id,FirstName,LastName,Email,Birthdate from Contact where id=:c.id];
      
//         return null;
//     }


//    }