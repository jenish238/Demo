trigger task11 on Account (after update) {
public String a; 
  if (trigger.isUpdate) {
    task11.main1(trigger.new);
    // example.ExcTest(trigger.new);
  }
}