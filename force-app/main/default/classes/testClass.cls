@isTest
public with sharing class testClass {
    public testClass() {

    }
  @TestSetup
  static void makeData(){
    
  }
  @IsTest
    static void methodName1(){
    
    Test.startTest();
        AccountsController.getAccounts();
    Test.stopTest();
    
  }
  @IsTest
  static void methodName2(){
    
    Test.startTest();
    AccountsController.findByName('a');

    Test.stopTest();
    
  }
  @IsTest
  static void methodName3(){
    
    Test.startTest();
    catchAccount.getAccount();

    Test.stopTest();
    
  }
  @IsTest
  static void methodName4(){
    
    Test.startTest();
    catchAccount.getContacts('0015g000013R8TGAA0');

    Test.stopTest();
    
  }
  @IsTest
  static void methodName5(){
    
    Test.startTest();
    copyTask.getAccountData('a');

    Test.stopTest();
    
  }
  @IsTest
  static void methodName6(){
    
    Test.startTest();
    errorclass.ExceptionRecords('className', 'MethodName', 'Message', 3, 'TypeName', 'Detail');
    Test.stopTest();
    
  }
  @IsTest
  static void methodName7(){
    
    Test.startTest();
    AccountsController.findByName('a');

    Test.stopTest();
    
  }
  @IsTest
  static void methodName8(){
    
    Test.startTest();
    AccountsController.findByName('a');

    Test.stopTest();
    
  }
}
