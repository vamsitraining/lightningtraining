public with sharing class DAtaforPicklist {

    public List<selectOption> options = new List<selectOption>();
    public List<selectOption> getCnames() {
    options.add(new selectOption('--None--','--None--'));
        for(Course__c objCourse : [select Id,name from Course__c])  // foreach loop
        {
            options.add(new selectOption(objCourse.name,objCourse.name));
        }
        return options;
    }

}