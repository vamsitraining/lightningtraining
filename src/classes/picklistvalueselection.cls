public class picklistvalueselection {
public list<selectOption> lstnames = new List<selectOption>();
public List<selectOption> getnames(){
lstnames.clear();
lstnames.add(new selectOption('--None--','--None--')); 
for(DataLoad__c objDL : [select Id,personname__c from DataLoad__c]){
lstnames.add(new selectOption(objDL.personname__c,objDL.personname__c)); 
}
return lstnames;
}
public String dcountry{get;set;}
public String dcity{get;set;}
public String dph{get;set;}

public String rName{get;set;}
public void populateData(){
try{
DataLoad__c objDL = [select Id,personname__c,city__c,country__c,phone__c from DataLoad__c where personname__c =: rName limit 1];
if(objDL!=null){
dcity=objDL.city__c;
dcountry=objDL.country__c;  
dph = objDL.phone__c;
}
}
catch(Exception e){
dcity='';
dcountry=''; 
dph = '';
}
}
}