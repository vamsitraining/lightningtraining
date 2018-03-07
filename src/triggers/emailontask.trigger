trigger emailontask on Task (before update) {
 set<string>setownerids=new set<string>();
 if(trigger.isupdate&&trigger.isbefore){
 	for(task objT:trigger.new){
 		 if(objT.OwnerId != objT.CreatedByID){
 		 	 if(objT.Status == 'Completed'){
 		 	 	setownerIds.add(objT.CreatedById);
 		 	 	 List<User> lstU = [select id,email from User where Id in : setownerIds];  // limit 1      
       List<String> lstEmails = new List<String>();
       
       for(User objU : lstU){
           lstEmails.add(objU.email);
 		 	 }
 		 	  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>();
        toAddresses.addall(lstEmails);
        mail.setToAddresses(toAddresses);
        List<String> bccAddresses = new List<String>();
        bccAddresses.add('emailtosalesforce@c-omtk30b5itoiy8p5jidhchr31s5a91vpq2o1yo2rilyhf7aoz.9-gwfjeau.9.le.salesforce.com');
        mail.setBccAddresses(bccAddresses);
        mail.setSubject('A task assigned by you has Completed');    // Set the subject
                
        String template = 'Hello, \nYour assigned task has Completed. Here are the details - \n\n';
        template+= 'Subject - {0}\n';
        template+= 'Opportunity - {1}\n';
        template+= 'Due Date - {2}\n';
        template+= 'Priority - {3}\n';
        template+= 'Comments - {4}\n';
        
        String duedate = '';
        if (objT.ActivityDate==null)
            duedate = '';
        else
            duedate = objT.ActivityDate.format();
            
        List<String> args = new List<String>();
        
        args.add(objT.Subject);
        args.add(objT.What.Name);
        args.add(duedate);
        args.add(objT.Priority);
        args.add(objT.Description);
       
        String formattedHtml = String.format(template, args);
       
        mail.setPlainTextBody(formattedHtml);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 		 }
 	}
 }
}
}