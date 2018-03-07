public class wrappertodisplayIntandStringclass2 {
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

public pagereference doDelete(){
List<String> lsttrainnames = new List<STring>();
List<String> lstempnames =new List<String>();
for(wrapper w : lstw){
if(w.ischecked==true){
lsttrainnames.add(w.tname);
lstempnames.add(w.ename);
}
}
system.debug('****lstTnames***'+lsttrainnames);
system.debug('****lstEnames***'+lstempnames);
List<TrainingTest__c> lstTdel = [select Id,name from TrainingTest__c where name in : lsttrainnames];
delete lstTdel;

List<Employees__c> lstEdel = [select Id,name from Employees__c where name in : lstempnames];
delete lstEdel;
pagereference ref = new pagereference('/apex/wrappertoDisplayIntegerandString');
ref.setredirect(true);
return ref;
}
public class wrapper{ // wrapper class
public String tname{get;set;}
public String tcity{get;set;}
public String tcountry{get;set;}
public String ename{get;set;}
public decimal esalary{get;set;}
public decimal edeptno{get;set;}    
public boolean ischecked{get;set;}
public wrapper(String tname,String tcity,String tcountry,String ename,decimal esalary,decimal edeptno){
this.tname=tname;
this.tcity=tcity;
this.tcountry=tcountry;
this.ename=ename;
this.esalary=esalary;
this.edeptno=edeptno;
ischecked=false;
}
}
}