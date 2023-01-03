trigger task10p1 on Account (after insert) {
    if (Trigger.isInsert) {
       task10p1.aprov(trigger.new);
    }
}