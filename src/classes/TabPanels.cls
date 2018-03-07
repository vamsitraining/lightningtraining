public with sharing class TabPanels {

    List<dept__c> lstdept = new List<dept__c>();
    public List<dept__c> getdeptRecords() {
        lstdept = [select name from dept__c];
        if(lstdept.size() == 0)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'List Has no data to display');
            apexpages.addmessage(myMsg);
        }
        return lstdept ;
    }


    List<Employees__c> lstemployee = new List<employees__c>();
    public List<Employees__c> getempRecords() {
        lstemployee = [select name from employees__c];
        return lstemployee ;
    }


    List<student__c> lststudents = new List<student__c>();
    public List<Student__c> getStdRecords() {
        lststudents  = [select name from student__c];
        return lststudents ;
    }


}