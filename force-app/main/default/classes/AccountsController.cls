public class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, Type, Phone FROM Account ORDER BY createdDate ASC LIMIT 10];
    }    
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name ='%' + searchKey + '%';
        return [SELECT Id, name, phone,type FROM Account WHERE name LIKE :name LIMIT 10];
    }
    @AuraEnabled
    public static List<Contact> conList(Id AccName){
        return [SELECT Id,FirstName,LastName,Email FROM Contact WHERE AccountId =: AccName];
    }
    @AuraEnabled
    public static Integer conList1(Id AccName){
            return [SELECT COUNT() FROM Contact WHERE AccountId =: AccName];
    }
   
}