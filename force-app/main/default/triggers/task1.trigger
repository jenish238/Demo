
trigger task1 on Account(before delete, before insert, before update, 
                                    after delete, after insert, after update) {
if (Trigger.isBefore) {
    System.debug('isBefore run');
    if (Trigger.isDelete) {
    System.debug('isDelete run');
        for (Account a : Trigger.old) {
            System.debug('old trigger run');
            if (a.name != 'okToDelete') {
                a.addError('You can\'t delete this record!');
                System.debug('not delete a recode');
            } 
        }
    } else {
        for (Account a : Trigger.new) {
            if (a.name == 'bad') {
                a.name.addError('Bad name');
            }
    }
    if (Trigger.isInsert) {
        System.debug('isInsert working');
        for (Account a : Trigger.new) {
            System.assertEquals('xxx', a.accountNumber); 
            System.assertEquals('industry', a.industry); 
            System.assertEquals(100, a.numberofemployees);
            System.assertEquals(100.0, a.annualrevenue);
            a.accountNumber = 'yyy';
        }

// If the trigger is not a before trigger, it must be an after trigger.
} else {
    if (Trigger.isInsert) {
        List<Contact> contacts = new List<Contact>();
        for (Account a : Trigger.new) {        
            if(a.Name == 'makeContact') {
                contacts.add(new Contact (LastName = a.Name,
                                          AccountId = a.Id));
            }
        } 
      insert contacts;
    }
  }
}}

if(trigger.isUpdate) {
       
    mail.setSubject( 'Updates in your details' );
    messageBody = 'Hi ' + member.Name + ', Changes have been made to your details. Contact administrator if you are not responisble.';
    mail.setHtmlBody(messageBody);
    System.debug('isUpdate is run');
}
}