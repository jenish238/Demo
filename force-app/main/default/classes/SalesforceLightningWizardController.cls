public class SalesforceLightningWizardController {
    @AuraEnabled
    public static string save(Account accountData ,Contact contactData, Event e){
        try{
            System.debug('accountData::::'+accountData);
            System.debug('contactData::::'+contactData);
            System.debug('opportunityData::::'+e);
            
            insert accountData;
            System.debug('accountData.ID::::::::'+accountData.Id);
            contactData.AccountId = accountData.id;
            insert contactData;
            System.debug('contactData.ID'+contactData.Id);
            e.WhoId             = contactData.Id;
            e.OwnerId           = '0055g00000F9sOOAAZ';
            insert e;
        }
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }
}