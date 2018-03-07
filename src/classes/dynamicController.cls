public with sharing class dynamicController {

    public PageReference AddRecord() {
        
       //Assign your own data to do this. for testing I just placed the dummy data.
       
       //Test Data
        MyWrapper oWrapp = new MyWrapper();
        oWrapp.sName='vamsi'; 
        oWrapp.isFlag= false; 
        lstWrapper.add(oWrapp);
    
        return null;
    }


     public list<MyWrapper> lstWrapper {get;set;} 
      
     public dynamicController(){
        this.lstWrapper = new list<MyWrapper>();  
        MyWrapper oWrapp = new MyWrapper();
        oWrapp.sName='Test'; 
        oWrapp.isFlag= true; 
        lstWrapper.add(oWrapp);
              
     } 
      public class MyWrapper{
          public string sName{ get;set;}
          public boolean isFlag{get;set;}
      }
      
}