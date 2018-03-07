public with sharing class Insertclass {

    public String tCountry { get; set; }
    public String tCity { get; set; }
    public String tName { get; set; }

    public PageReference doInsert() {
        TrainingTest__c objTrain = new TrainingTest__c(name=tName,city__c=tCity,country__c=tCountry);
        insert objTrain;
        pagereference ref = new pagereference('/apex/insertingrecords');
        ref.setredirect(true);
        return ref;
    }

   
    
}