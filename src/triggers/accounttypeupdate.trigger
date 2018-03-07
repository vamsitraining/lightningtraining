trigger accounttypeupdate on Opportunity (after insert) {
Opportunity TheOpportunity = trigger.new[0];
if(TheOpportunity.amount>50000){
Account theAccount= [Select id,Type, name from Account where id=:theOpportunity.id];
theAccount.type='Other';

update theAccount;
}

}