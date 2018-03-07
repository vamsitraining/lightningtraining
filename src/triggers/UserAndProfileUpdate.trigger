trigger UserAndProfileUpdate on Case (after update) {
    
    
    set<Id> UserIds = new Set<Id>();    
    List<String> ProfileName = New List<String>() ;
    
    for(Case cs : Trigger.new){
        UserIds.add(cs.User_To_Modify__c);
        ProfileName.add(cs.Profile_to_assign__c);
    }
    List<User> usrlist = [Select id, ProfileId from User where id =: UserIds];
    list<profile> ProfileIds = [Select id from Profile where Name =: ProfileName];
    
   
     System.debug('*******casetoUpdate.owner.Profile.Name  ***'+usrlist );
      System.debug('*******casetoUpdate.owner.Profile.Name  ***'+ProfileIds );
    
}