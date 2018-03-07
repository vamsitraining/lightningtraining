trigger OpptyTrigger on Opportunity (before insert, before update) {
    Map<id,string> unitDetails = new Map<id,string> ();
    for(Opportunity O : Trigger.New) {
        if(O.Set_the_UnitStatus__c != null) {
            if(O.Set_the_UnitStatus__c.equals('Blocked'))
                unitDetails.put(O.Unit__c,'Blocked');
            else if(O.Set_the_UnitStatus__c.equals('Available'))
                unitDetails.put(O.Unit__c,'Available');
         }
    }
    System.debug('#### unitDetails: ' + unitDetails);
    List<Unit__c> lstUnits = [select UnitStatus__c from Unit__c where 
                        Id IN: unitDetails.keySet() ];
    System.debug('#### lstUnits(before): ' + lstUnits);
    for(Unit__c U : lstUnits) {
        U.UnitStatus__c = unitDetails.get(u.Id);
    }
    System.debug('#### lstUnits(after): ' + lstUnits);
    update lstUnits;
}