public with sharing class RelatedController 
{
 private ApexPages.StandardController stdCtrl;
  
 public RelatedController(ApexPages.StandardController std)
 {
  stdCtrl=std;
 }
  
 public void AccountPopulated()
 {
  Contact cont=(Contact) stdCtrl.getRecord();
  cont.Account=[select AccountNumber, Site from Account where id=:cont.AccountId];
 }
}