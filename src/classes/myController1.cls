public with sharing class myController1 {

    public PageReference commandLinkAction() {
        return null;
    }


    private final Account account;

      public myController1() {
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