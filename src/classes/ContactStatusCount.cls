global with sharing class ContactStatusCount {
global string accid{get;set;}
global Integer sum{get; set;}
global Integer awarepositive{get; set;}
global Integer awareNegative{get; set;}
global Integer awareChampion{get; set;}
    global ContactStatusCount(ApexPages.StandardController controller) {
    string accid = apexpages.currentpage().getparameters().get('id'); 
    sum= [SELECT count() FROM Contact WHERE AccountId =:accid AND status__c ='Unaware'];  
    awarepositive = [SELECT count() FROM Contact WHERE AccountId =:accid AND status__c ='Aware-Positive'];
    awareNegative = [SELECT count() FROM Contact WHERE AccountId =:accid AND status__c ='Aware-Negative'];
    awareChampion = [SELECT count() FROM Contact WHERE AccountId =:accid AND status__c ='Aware-Neutral or Champion'];
    } 
    @RemoteAction   
   global  static List<AggregateResult> getData() {
   string acid = apexpages.currentpage().getparameters().get('id');
        return [select Count(id) total, status__c  stg
                                    FROM Contact where AccountId =:acid
                                    GROUP BY status__c];
       } 
}