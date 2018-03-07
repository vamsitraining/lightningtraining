trigger triggerCandidate on Candidate__c(before update,after update)
{
      
          for(Candidate__c candidate : Trigger.new)
          {
              Candidate__c oldLastName = Trigger.oldMap.get(candidate.id);
              System.Debug('lastName old Value ' +oldLastName.Last_Name__c);             
              System.Debug('EMail old Value ' +oldLastName.Email__c);
          
      if(Trigger.isBefore && Trigger.isUpdate)
        {         
             if(candidate.Last_Name__c !=oldLastName.Last_Name__c)
               {
                 System.Debug('lastName New Value ' +candidate.Last_Name__c);
                 candidate.Email__c = candidate.Last_Name__c+ 'goyal0027@gmail.com';
                 candidate.Phone__c = '423342334';
                 System.debug('--*Candidate has been Updated**--');
               }
             else{
                System.debug('--*Candidate Email has not been Updated**--');
            
                }
           }
            if(Trigger.isBefore && Trigger.isUpdate)
        {         
             if(candidate.Email__c !=oldLastName.Email__c)
               {
               System.Debug('lastName old Value ' +oldLastName.Last_Name__c);             
               System.Debug('EMail old Value ' +oldLastName.Email__c);
                 System.Debug('Email New Value ' +candidate.Email__c);
                                  System.Debug('Email old Value ' +oldLastName.Email__c);
                 candidate.State__c = candidate.Last_Name__c+ 'newAddress';
                 System.debug('--*Candidate has been Updated**--');
               }

             else{
                System.debug('--*Candidate Email has not been Updated**--');
            
                }
              
           }
          }
       
   
}