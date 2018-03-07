public class nestedqueryexample
{
  public List<Account> getaccsandtmember()
  {
    // List<Account> accounts = [Select a.Name, a.Id, a.BillingCountry, (Select SystemModstamp, LastActivityDate, Account__c, Program__c From Accounts_in_this_Program__r) From Account a];
     List<Account> accounts =[Select a.Name,(Select LastName, FirstName, Name, OtherCity From Contacts), a.Id, a.BillingCountry From Account a];
            
     return accounts;
  }
  
  
}