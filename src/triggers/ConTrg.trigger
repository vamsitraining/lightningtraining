Trigger ConTrg on Contact (before insert, before update) {
    //no_Of_Days_lived__c
    
    /*
        Step 1: Get the newly insrted record
        Step 2: check whether DOB is given
        Step 3: calculate the diff b/w today - DOB
        Step 4: Assign this to the new custom field
    */
    
    Contact con = trigger.new[0];
    
    if(con.Birthdate != null){
        if(con.birthdate > System.Today())
        con.addError('Please provide correct DOB');
        
        Date todDate = System.Today();
        Date conBDate = con.Birthdate;
    
        con.no_Of_Days_lived__c = conBDate.DaysBetween(todDate);
    }
    
    
}