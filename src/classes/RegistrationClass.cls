public with sharing class RegistrationClass {
    public Registration__c objR{get;set;}
    
    public RegistrationClass(){
        objR = new Registration__c();
    }
    public pagereference doSave(){ 
            
            objR.PersonName__c = objR.PersonName__c;
            objR.City__c = objR.City__c;
            objR.Country__c = objR.Country__c;
            objR.ContactNo__c = objR.ContactNo__c;
            insert objR;
        return (new pagereference('/apex/registrationpage').setredirect(true));
    }
}