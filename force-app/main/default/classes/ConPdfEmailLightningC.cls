public class ConPdfEmailLightningC {
    
    public Contact con{get;set;}
    
    public ConPdfEmailLightningC(){
        Id conId = apexpages.currentpage().getparameters().get('id');
        con = [SELECT Id, FirstName, LastName, Phone, Email FROM Contact WHERE Id=: conId];
    }
}