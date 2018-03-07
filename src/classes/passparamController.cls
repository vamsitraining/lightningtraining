Public with sharing class passparamController {
  Public string myInput{get;set;}
  Public string myoutput{get;set;}
 
  Public pagereference callvfpage(){
    PageReference openvfpage = New Pagereference('/apex'+'/demovfpage');
    openvfpage.getParameters().put('id', [select id from account limit 1].id);
    openvfpage.setRedirect(false);
    return openvfpage ;
  }
}