trigger task14 on Account (before insert) {
  if (Trigger.isInsert) {
    triggtask14.accountDeleted(Trigger.new);
    
  }
    
}