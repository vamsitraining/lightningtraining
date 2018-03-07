public with sharing class myController20 {

    private final Account account;

      public myController20() {
            account = [select id, name, site, NumberOfEmployees, Industry from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
      }

      public Account getAccount() {
            return account;
      }

      public PageReference save() {
            update account;
            return null;
      }

      public PageReference cancel() {
            return null;
      }
}