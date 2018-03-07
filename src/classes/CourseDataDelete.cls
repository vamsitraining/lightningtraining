public with sharing class CourseDataDelete {

    public String RID{get;set;}
    public PageReference doDelete() {
        Course__c objDelete = [select Id,fee__c from Course__c where fee__c = 10000];
        delete objDelete;
        return null;
    }

    public List<Course__c> lstcourse = new List<Course__c>();
    public List<Course__c> getRecords() {
        lstcourse = [select Id,name,fee__c from Course__c];
        return lstcourse;
    }
}