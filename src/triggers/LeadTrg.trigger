trigger LeadTrg on Lead (before insert, before update, after update) {
    
    Lead newVal = trigger.new[0];
    
    if(trigger.isBefore && trigger.isUpdate){
        Lead oldVal = trigger.old[0];
        System.debug('-----Older version-------->'+oldval);
    }
    
    System.debug('-----Newer version-------->'+newval);
    
}