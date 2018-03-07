public with sharing class TestAddContact {

    public TestAddContact(ApexPages.StandardController controller) {

    }


    public boolean displayPopup {get; set;}
    public string applicationId  {get; set;}
    public List<Application__c> lstApplication{get;set;}

    public TestAddContact(){
        lstApplication = [SELECT Id, Name
                          FROM Application__c 
                          ];
    } 

    public void closePopup(){        
        displayPopup = false;    
    } 

    public void showPopup(){        
        displayPopup = true;
        applicationId = applicationId;
        if(applicationId != null){  

        }     
    } 
}