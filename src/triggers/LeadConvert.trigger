trigger LeadConvert on Lead (after update) {
List<Account> accList = new List<Account>();
List<Contact> conList = new List<Contact>();
List<Opportunity> oppList = new List<Opportunity>();

//Bulkified
for (Lead lead : Trigger.new) {
if (lead.isConverted == false) //to prevent recursion
{

Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(lead.Id);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);


Database.LeadConvertResult lcr = Database.convertLead(lc);
System.assert(lcr.isSuccess());


Account acc = new Account(id=lcr.AccountId,Roll_No__c=lead.Roll_No__c);
accList.add(acc);

Contact con = new Contact(id=lcr.ContactId,Roll_No__c=lead.Roll_No__c);
conList.add(con);

Opportunity opp = new Opportunity(id=lcr.OpportunityId,Roll_No__c=lead.Roll_No__c);
oppList.add(opp);

}
}

update accList;
update conList;
update oppList;
}