public with sharing class PopupTest1 {    
    public List<account> getAccounts()  
    {  
        List<account> accounttList = new List<account>();  
        accounttList = [Select Id, Name from Account ];  
        return accounttList ;  
        
    }  
  
}