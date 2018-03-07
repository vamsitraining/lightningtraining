public class MassLogACallController_Contacts {
    public List<contact> lstContacts {get; set;}
    public String accountId {get; set; }
     
    public MassLogACallController_Contacts(ApexPages.StandardController controller) {
        accountId = ApexPages.CurrentPage().getParameters().get('id');
        lstContacts = [select Name, Log_a_call__c from Contact where AccountId =: accountId];
    }
     
    public PageReference createCall() {
        update lstContacts;
        PageReference pg=new PageReference('/apex/MassCreateCall?accId=' + accountId);
        pg.setRedirect(true);
        return pg;
    }
}