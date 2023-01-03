public with sharing class SearchInVFController {

    // public list <Account> acc {get;set;}
    // public List<Contact> a1 {get;set;}

    public list <Contact> acc {get;set;}
    public String searchKey {get;set;}
    public Integer countTotalRecords{get;set;}

    public Integer a1{get;set;}
    public Integer a2{get;set;}
    Integer recordLimit = 10;
    Integer offSetLimit = 10;
    public SearchInVFController() {
        countTotalRecords   = [select COUNT() from Contact ];
        a1=10;
        a2=1;
    }
    
    public void search(){
        string searchquery='select FirstName,LastName,id from contact where name like \'%'+searchKey+'%\'  Limit :recordLimit OFFSET :offSetLimit';
        acc= Database.query(searchquery);
    }
    public void clear(){
        acc.clear();
    }
    Public pagereference Next(){
        if (offSetLimit + recordLimit < CountTotalRecords) {
            offSetLimit = offSetLimit + 10;
            a1=offSetLimit;
            a2=offSetLimit-10 +1;
            search();  
        }
       
        return null;
    }
    
    Public pagereference Previous(){
        if(offSetLimit > 0){
            offSetLimit = offSetLimit - 10;
            a1=offSetLimit;
            a2 = offSetLimit-10 +1;
             search();
            }
        return null;
    }
   
}