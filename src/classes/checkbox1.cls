public class checkbox1 {
public List<DataLoad__c> lst1 = new List<DataLoad__c>();
public List<DataLoad__c> getrecord1(){
lst1=[select Id,name,personname__c,city__c,country__c,phone__c from DataLoad__c where personname__c= 'vamsi11'];
return lst1;
} 
public boolean chk1 = true;
public boolean getchk1(){
if(lst1.size()==0){
chk1=false;
}
return chk1;
}
public void setchk1(boolean chk1){
this.chk1=chk1;
}





public List<DataLoad__c> lst2 = new List<DataLoad__c>();
public List<DataLoad__c> getrecord2(){
lst2=[select Id,name,personname__c,city__c,country__c,phone__c from DataLoad__c where personname__c= 'Rahul'];
return lst2;
} 
public boolean chk2 = true;
public boolean getchk2(){
if(lst2.size()==0){
chk2=false;
}
return chk2;
}
public void setchk2(boolean chk2){
this.chk2=chk2;
}
}