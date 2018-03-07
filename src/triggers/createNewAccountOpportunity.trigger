trigger createNewAccountOpportunity on Account (after insert) {
List<Opportunity> listOpportunities = new List<Opportunity>();

for (Account o: trigger.new) {
Opportunity oOpportunity = new Opportunity();
oOpportunity.Name = o.Name+o.AccountNumber;
oOpportunity.AccountId = o.Id;
oOpportunity.StageName= 'Proposal';
oOpportunity.CloseDate = System.today() + 30; //Closes 30 days from today

listOpportunities.add(oOpportunity);
}
if (listOpportunities.size()>0) {
    insert listOpportunities;
}
}