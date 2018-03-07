@isTest 

private class UpdateAmounttest {

static testMethod void testUpdateAmount (){

 // Set up the Account record.
    mvk__Quote__c Q = new mvk__Quote__c (Name='Test Account');
    insert Q;
    
 // Verify that the initial state is as expected.
    Q = [SELECT Name, mvk__Amount__c 
         FROM mvk__Quote__c 
         WHERE Id =:Q.Id];  
         
 System.assertEquals(null, Q.mvk__Amount__c );
 
 
 
  
}



}