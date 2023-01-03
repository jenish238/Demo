trigger task13 on Contact (after insert) {
   if (trigger.isInsert) {
    task13.eventman(trigger.new);
   }
    
}