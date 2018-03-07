public with sharing class MyController {

    public String getCurrentGroup() {
        return null;
    }


    public PageReference Previous() {
        return null;
    }


   Account account;

   public Account getAccount() 
   {
      if(account == null) account = new Account();
      return account;
   }

   public PageReference sav() 
   {
      insert account;
    
      PageReference acctPage = new ApexPages.StandardController(account).view();
      acctPage.setRedirect(true);
      return acctPage;
   }

    public String items { get; set; }

    public String names { get; set; }
}