trigger RollUpTrg on Contact (after delete, after insert, after undelete,after update) {
    
    if(Trigger.isInsert || Trigger.isUpdate || trigger.isUnDelete){
        //Contact con = trigger.new[0];
        set<String> acclist = new Set<String>();
        List<Account> accnewlist = new List<Account>();
        
        For(Contact C:trigger.new){
            acclist.add(C.AccountId);
        }
        If(acclist.size()>0){
            List<Account> acc1 = [Select id, No_Of_contacts__c from Account where id in:(acclist)];
        
            if(acc1.size()>0){
                for(Account acc:acc1){
                
                    if(acc.No_Of_contacts__c != null){
                        Account accnew = new Account();
                        accnew.id = acc.id;
                        accnew.No_Of_contacts__c = acc.No_Of_contacts__c+1;
                        accnewlist.add(accnew);
                    }
                    else {
                        Account accnew1 = new Account();
                        accnew1.id = acc.id;
                        accnew1.No_Of_contacts__c = 1;
                        accnewlist.add(accnew1);
                    }
                
                }
                if(accnewlist.size()>0){
                    Update accnewlist;
                } 
            
            }
        }
           
        
        /*
        if(con.AccountId != null){
            Account acc = [Select id, No_Of_contacts__c from Account where id=:con.AccountId];
            if(acc.No_Of_contacts__c != null)
                acc.No_Of_contacts__c = acc.No_Of_contacts__c+1;
            else
                acc.No_Of_contacts__c = 1;
            update acc;
        }
        */
    
    }
    /*
    if(trigger.isDelete){
        Contact oldRec = trigger.old[0];
        if(oldRec.AccountId != null){
            Account acc = [Select id, No_Of_contacts__c from Account where id=:oldrec.AccountId];
            if(acc.No_Of_contacts__c != null)
                acc.No_Of_contacts__c = acc.No_Of_contacts__c-1;
            update acc;
        }
    }
    */
    
}