trigger UpdateAmount on mvk__Quote__c(after insert, after update) { //You want it on update too, right?
  Map<ID, Opportunity> parentOpps = new Map<ID, Opportunity>(); //Making it a map instead of list for easier lookup
  List<Id> listIds = new List<Id>();

  for (mvk__Quote__c childObj : Trigger.new) {
    listIds.add(childObj.mvk__Opportunity__c);
  }

  //Populate the map. Also make sure you select the field you want to update, amount
  //The child relationship is more likely called Quotes__r (not Quote__r) but check
  //You only need to select the child quotes if you are going to do something for example checking whether the quote in the trigger is the latest
  parentOpps = new Map<Id, Opportunity>([SELECT id, amount,Name,(SELECT ID, mvk__Amount__c FROM mvk__Quotes__r) FROM Opportunity WHERE ID IN :listIds]);

  for (mvk__Quote__c quote: Trigger.new){
     Opportunity myParentOpp = parentOpps.get(quote.Opportunity__c);
     myParentOpp.Amount = quote.mvk__Amount__c ;
  }

  update parentOpps.values();
}