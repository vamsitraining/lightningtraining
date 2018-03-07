trigger MailTask1 on Task (before update)
{
    set<String> setownerIds = new set<String>();
    set<ID> TaskId = new Set<Id>();
        if(Trigger.isUpdate && Trigger.isBefore){
            for(Task TaskObj : Trigger.New)
            {
                TaskId.add(TaskObj.Id);       
            }
        Task[] TaskList = [Select Id,Owner.Name,OwnerId,CreatedById,Owner.Email,Subject,ActivityDate,Priority,Status,Description,What.Type,
                                                        What.Name,Who.type,Who.Name from Task where Id in : TaskId];
        System.debug('Tasklist'+TaskList);
        
        Map<Id,Account> AccountMap ;
        Map<Id,Lead> LeadMap ;
        Map<Id,Opportunity> OpportunityMap;
        Map<Id,Contact> ContactMap ;
      
        Set<Id> AccountId = new Set<Id>();
        Set<Id> LeadId = new Set<Id>();
        Set<Id> OpportunityId = new Set<Id>();
        Set<Id> ContactId = new Set<Id>();
   
        if(Trigger.isUpdate && Trigger.isBefore)
        {
            for(Task TaskObj : TaskList)
            {
        
                if(TaskObj.Who.Type == 'Lead')
                {
                    LeadId.add(TaskObj.whoId);
                }
                if(TaskObj.who.Type == 'Contact')
                {
                    ContactId.add(TaskObj.WhoId);
                }
                if(TaskObj.what.Type == 'Account')
                {
                    AccountId.add(TaskObj.WhatId);
                }
                if(TaskObj.what.Type == 'Opportunity')
                {
                    OpportunityId.add(TaskObj.WhatId);
                }
            }   
            AccountMap =  new Map<Id,Account>([Select Id,Name,Owner.Email from Account where Id in : AccountId ]);
            LeadMap = new Map<Id,Lead>([Select Id,Name,Owner.Email from Lead where Id in : LeadId ]);
            OpportunityMap  = new Map<Id,Opportunity>( [Select Id,Name,Owner.Email from Opportunity where Id in : OpportunityId ]);
            system.debug('opportunitymap!!!!!!!!!!!!!'+OpportunityMap);
            ContactMap = new Map<Id,Contact>([Select Id,Owner.Email,Name from Contact where Id in : ContactId ]);
            
            for(Task TskObj : TaskList )
            {
            if(TskObj.OwnerId != TskObj.CreatedById)
              {
                String[] toAddresses ;
                String forName = '';
                if(TskObj.who.Type == 'Contact')
                {
                    toAddresses = new String[] {(ContactMap.get(TskObj.WhoId).Owner.Email)};
                    forName = TskObj.who.Name;
                }
                if(TskObj.Who.Type == 'Lead')
                {
                    toAddresses = new String[] {(LeadMap.get(TskObj.WhoId).Owner.Email)};
                    forName = TskObj.who.Name;
                }
                if(TskObj.what.Type == 'Account')
                {
                    toAddresses = new String[] {(AccountMap.get(TskObj.WhatId).Owner.Email)};
                    forName = TskObj.what.Name;
                }
                if(TskObj.what.Type == 'Opportunity')
                {
                    toAddresses = new String[] {(OpportunityMap.get(TskObj.WhatId).Owner.Email)};
                    system.debug('Address'+ toAddresses);
                    forName = TskObj.what.Name;
                    system.debug('name'+forName);
                }
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                system.debug('ToAddress'+toAddresses);
                mail.setToAddresses(toAddresses);
                system.debug('Mail '+mail);
                mail.setSubject('A task assigned by you has Completed');  
                system.debug('Mail subject'+mail);  // Set the subject
                
                String template = 'Hello, \nYour assigned task has Completed. Here are the details - \n\n';
                template+= 'Subject - {0}\n';
                template+= 'Related to - {1}\n';
                template+= 'Due Date - {2}\n';
                template+= 'Priority - {3}\n';
                template+= 'Comments - {4}\n';
        
                String duedate = '';
                    if (TskObj.ActivityDate==null)
                        duedate = '';
                    else
                        duedate = TskObj.ActivityDate.format();
                        system.debug('Duedate'+duedate);
                    
                List<String> args = new List<String>();
             
                args.add(TskObj.Subject);
                args.add(forName);
                args.add(duedate);
                args.add(TskObj.Priority);
                args.add(TskObj.Description);
                String formattedHtml = String.format(template, args);
       
                mail.setPlainTextBody(formattedHtml);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
          }
       }
        
    }
}