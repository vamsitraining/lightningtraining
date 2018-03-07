trigger samplevalidation on sample__c (before insert) {
    for(sample__c sval:trigger.new){
    List<sample__c> mem = new List<sample__c>();
        
    }
}