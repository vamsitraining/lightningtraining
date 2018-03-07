public with sharing class newvf1 
 {
    

 
     
  
   public newvf1(ApexPages.StandardController controller)
    {
    }
   
  //Optional to Mandatory
  
   public list<doctor__c> lstacc{get;set;}
   public list<doctor__c> selectedacc{get;set;}
   public list<wrapper> lstwrapper{get;set;}
   public boolean noacc{get;set;}
  
   public list<wrapper> getconres1()
   {
   doctor__c d=new doctor__c();
   lstWrapper = new list<Wrapper>();
   lstacc=[select id,name from doctor__c where Status__c='optional'];
   system.debug(+lstacc);
   lstWrapper = new list<Wrapper>();
   noacc=false;
   wrapper objwrap;
    for(doctor__c obja:lstacc)
    {
    objwrap=new wrapper();
    objwrap.acc =obja;
    lstwrapper.add(objwrap);
    }
   
    integer i=lstwrapper.size();
     return lstwrapper;
   }
   public void showselected1()
   {
   selectedacc=new list<doctor__c>();
   selectedacc.clear();
   for(wrapper objwrap:lstwrapper)
     {
     if(objwrap.selected) 
       {
       noacc=true;
       selectedacc.add(objwrap.acc);
       }
   }
   for(doctor__c doc:selectedacc)
   {
   doc.Status__c='Mandatory';
   update doc;
   }
  }
  
  //Mandatory to optional
   public list<doctor__c> lstacc1{get;set;}
   public list<doctor__c> selectedacc1{get;set;}
   public list<wrapper> lstwrapper1{get;set;}
   public boolean noacc1{get;set;}
  // public newvf1(ApexPages.StandardController controller)
   // {
    //}
   public list<wrapper> getconres()
   {
   doctor__c d=new doctor__c();
   lstWrapper1 = new list<Wrapper>();
   lstacc1=[select id,name from doctor__c where Status__c='Mandatory'];
   system.debug(+lstacc1);
   lstWrapper1 = new list<Wrapper>();
   noacc1=false;
   wrapper objwrap;
    for(doctor__c obja:lstacc1)
    {
    objwrap=new wrapper();
    objwrap.acc =obja;
    lstwrapper1.add(objwrap);
    }
   
    integer i=lstwrapper1.size();
     return lstwrapper1;
   }
   public void showselected()
   {
   selectedacc1=new list<doctor__c>();
   selectedacc1.clear();
   for(wrapper objwrap:lstwrapper1)
     {
     if(objwrap.selected) 
       {
       noacc1=true;
       selectedacc1.add(objwrap.acc);
       }
   }
   for(doctor__c doc:selectedacc1)
   {
   doc.Status__c='optional';
   update doc;
   }
  }
  
  
  
  
  
   public class wrapper
   {
   public boolean selected{get;set;}
   public doctor__c acc{get;set;}
   
   }
   
   
 }