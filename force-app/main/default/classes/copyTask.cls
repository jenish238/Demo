public with sharing class copyTask {
    public copyTask() {

    }
    @AuraEnabled(Cacheable = true)
    public static List<List<SObject>> getAccountData(String textkey) {
        try {
            textkey = '%' + textkey + '%';
        System.debug('ss:::::::::::'+ textkey);
        List<List<SObject>> searchList = [FIND : textkey IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName) ,Lead(Name,Email),Opportunity(Name,StageName),Contract(Name,Status),Pricebook2(Name,Description),Student__c(Student_Name__c,Student_Email__c),School__c(School_Name__c,Total_Student__c)];
        System.debug('serchList:::::' + searchList);
        
        // if(accLst.isEmpty()) {
        //     throw new AuraHandledException('No Record Found..');
        // }
        //
        return searchList; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }

    @AuraEnabled(Cacheable = true)
    public static list<SObject> getAccount(String filed1, String filed2, String filed3 ) {
        try {
            list<SObject> accLst = Database.query('SELECT '+ filed1 + ','+ filed2 + ' FROM ' + filed3 + ' LIMIT 10');
            System.debug(accLst);
            return accLst;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
           
        
    }
}

 

// else if (textkey == 'Contact') {
//     System.debug('con');
//     list<Contact> accLst = [SELECT  Id, FirstName, LastName FROM Contact LIMIT 10];
//     return accLst;
// }else if (textkey == 'Lead') {
//     System.debug('lead');
//     list<Lead> accLst = [SELECT  Id, Name, Email FROM Lead LIMIT 10];
//     return accLst;
// }else if (textkey == 'Opportunity') {
//     System.debug('Opportunity');
//     list<Opportunity> accLst = [SELECT  Id, Name, StageName FROM Opportunity LIMIT 10];
//     return accLst;
// }
// else if (textkey == 'Contract') {
//     System.debug('Contract');
//     list<Contract> accLst = [SELECT  Id, Name, Status FROM Contract LIMIT 10];
//     return accLst;
// }else if (textkey == 'Pricebook2') {
//     System.debug('Pricebook2');
//     list<Pricebook2> accLst = [SELECT  Id, Name, Description FROM Pricebook2 LIMIT 10];
//     return accLst;
// }else if (textkey == 'Student__c') {
//     System.debug('Student__c');
//     list<Student__c> accLst = [SELECT  Id, Student_Name__c, Student_Email__c FROM Student__c LIMIT 10];
//     return accLst;
// }else if (textkey == 'School__c') {
//     System.debug('lead');
//     list<School__c> accLst = [SELECT  Id, School_Name__c, Total_Student__c FROM School__c LIMIT 10];
//     return accLst;
// }