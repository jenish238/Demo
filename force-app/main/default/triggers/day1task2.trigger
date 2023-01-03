trigger day1task2 on Contact (after update) {
  
List<Contact> contactList = new list<contact>();


for (Contact con : Trigger.new) {
    

    if (con.AccountId != trigger.oldmap.get(con.Id).AccountId && con.AccountId !=null) {
        contactList = [select Id from contact where AccountId =: trigger.oldmap.get(con.Id).AccountId];
        System.debug(contactList);

        for (Contact ass : contactList) {
            ass.AccountId = con.AccountId;
            update ass;
        }

    }
}






}