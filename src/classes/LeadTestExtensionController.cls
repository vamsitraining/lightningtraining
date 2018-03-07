public with sharing class LeadTestExtensionController { 
    private Apexpages.StandardController controller; 
    private PageReference page; 
    private string id; 
    private final Lead myLead; 
    public String positions {get; set;}

    public LeadTestExtensionController(ApexPages.StandardController stdController) {
        this.controller = stdController;
        this.myLead = (Lead)stdController.getrecord();
        this.page = ApexPages.currentPage();
        this.id = page.getParameters().get('id');
        List<Lead> myLeads = [select CurrentGenerators__c from lead where id = :id];
        if(myLeads.size() > 0) {
            positions = myLeads[0].CurrentGenerators__c;
        }
    }

    public PageReference save() {
        this.controller.save();
        PageReference newPage = New PageReference('/apex/RCS');
        newPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('id'));
        newPage.setRedirect(true);
        return newPage;
    }
}