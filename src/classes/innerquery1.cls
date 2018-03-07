public with sharing class innerquery1 {
  public List<Country__c> lstC = new List<Country__c>();
  public List<Country__c> getrecords(){
  lstC=[select Id,name,(select Id,name from State__r) from Country__c];
  return lstC;  
  }
}