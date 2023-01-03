public with sharing class loginController {
    public String userName {get; set;}
    public Boolean getInput{get;set;}
    public List<Contact> customerObjList {get; set;}
    public loginController() {
        getInput = True;
        customerObjList = new List<Contact>();
    }
    public void searchUserName() {
        getInput = False;
        customerObjList = [SELECT Id, LastName FROM Contact WHERE LastName =: userName];
    }
}