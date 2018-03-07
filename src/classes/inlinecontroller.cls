public with sharing class inlinecontroller {
Public contact conRec{get;set;}
Public id accRecId;
Public account accRec{get;set;}
public Boolean AccNoreceError{get; set;} 

    public inlinecontroller(ApexPages.StandardController controller) { 
    try{     
     accRecId = [select id,accountid from contact where id = :ApexPages.currentPage().getParameters().get('id')].accountid;
     }
      catch(exception e){
    // catch exception here
   }
      if(accRecId != null){
         accRec = [select id,name,accountnumber,annualrevenue from account where id =:accRecId];
         } else{
          AccNoreceError =true;
         
         }
    }
}