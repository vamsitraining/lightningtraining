trigger OptyTrigger on Opportunity(after delete, after insert,after update) {
   Opportunity[] cons;
    if (Trigger.isDelete) 
        cons = Trigger.old;
    else
        cons = Trigger.new;

    // get list of opty
    Set<ID> optyIds = new Set<ID>();
    for (Opportunity con : cons) {
            optyIds.add(con.Framework_Agreement__c);
    }
    
        Map<ID, Opportunity> childopty= new Map<ID, Opportunity>([select Id,Framework_Agreement__c from Opportunity where Framework_Agreement__c in :optyIds]);

        Map<ID, Opportunity> parentToUpdate= new Map<ID, Opportunity>([select Id,Number_of_Opportunities__c,Total_Sales__c,Total_Opportunity_Sum__c from Opportunity where Id in :optyIds]);

     //Use aggregate soql to get total sum of all opportunity
          AggregateResult[] groupedResults=[select Framework_Agreement__c ,sum(Amount)fm from Opportunity where Framework_Agreement__c in :optyIds group by Framework_Agreement__c];                                         

     //Use aggregate soql to get total sum of all Won opportunity

         AggregateResult[] groupedResults1=[select Framework_Agreement__c ,sum(Amount)ar from Opportunity where Framework_Agreement__c in :optyIds and StageName='Closed Won' group by Framework_Agreement__c];    
   
         for (Opportunity o: parentToUpdate.values()) {
             Set<ID> opId= new Set<ID>();
             for (Opportunity con : childopty.values()) {
               if (con.Framework_Agreement__c== o.Id)
                  opId.add(con.Id);
                }
  
            if (o.Number_of_Opportunities__c != opId.size())
                o.Number_of_Opportunities__c = opId.size();
        
         for(integer i=0;i<groupedResults.size();i++){   
             o.Total_Opportunity_Sum__c =(Decimal)groupedResults[i].get('fm');}
          
          for(integer j=0;j<groupedResults1.size();j++){
          o.Total_Sales__c = (Decimal)groupedResults1[j].get('ar');} 
      }
 
 //update parent opportunity 
 update parentToUpdate.values();
 }