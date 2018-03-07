public with sharing class DisplayRecClass {


    List<TrainingTest__c> lstdata = new List<TrainingTest__c>();
    public List<TrainingTest__c> getRecords() {
        lstdata =[select name,city__c,country__c from trainingTest__c];
        System.debug('=====lstdata==='+lstdata);
        return lstdata;
        
    }
    
    

}