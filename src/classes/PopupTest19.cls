public with sharing class PopupTest19 { 
List<Schema.unit__c> accounttList = new List<Schema.unit__c>();     
    public List<Schema.unit__c> getAccounts()      {  
        
        accounttList = [Select Id, Name from unit__c LIMIT 10];  
        return accounttList ;  
    }  
  
}