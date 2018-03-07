Public with sharing class ListErrorDemoController {


Public account acc{get;set;}
 //public list<account> acc = new list<account>();
  Public ListErrorDemoController(){
 
  } 
  Public void ErrorMethod(){
   acc = [select id,name from account limit 1 ];
 
  }
  
}