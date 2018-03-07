public class columnclasses {
public List<DataLoad__c> lstDL = new List<DataLoad__c>();
public List<DataLoad__c> getrecords(){
lstDL = [select Id,name,personname__c,city__c,phone__c,country__c from DataLoad__c];
return lstDL;
}
}