/*
wrapper classes:
1. wrapper class is nothing but an inner class
2. To return more than one list to the pageblocktable.
*/
public with sharing class wrappertodisplayIntandStringclass {

public List<wrapper> lstw = new List<wrapper>();
List<TrainingTest__c> lstTrain =new List<TrainingTest__c>();
List<Employees__c> lstemp = new List<Employees__c>();
public List<wrapper> getlstwrapper(){
lstTrain = [select Id,name,city__c,country__c from TrainingTest__c];
lstemp = [select Id,name,salary__c,deptno__c from Employees__c];
for(Integer i=0;i<lstTrain.size();i++){
lstw.add(new wrapper(lstTrain[i].name,lstTrain[i].city__c,lstTrain[i].Country__c,lstemp[i].name,lstemp[i].Salary__c,lstemp[i].deptno__c));
}
return lstw;
}

public class wrapper{ // wrapper class
public String tname{get;set;}
public String tcity{get;set;}
public String tcountry{get;set;}
public String ename{get;set;}
public decimal esalary{get;set;}
public decimal edeptno{get;set;}    
public wrapper(String tname,String tcity,String tcountry,String ename,decimal esalary,decimal edeptno){
this.tname=tname;
this.tcity=tcity;
this.tcountry=tcountry;
this.ename=ename;
this.esalary=esalary;
this.edeptno=edeptno;
}
}
}