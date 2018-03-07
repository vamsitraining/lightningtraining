public class Displayprodsinopprtunity
{

 //This is where we have defined the Wrapper Class. 
    public class OpportunityLineItemwrapper
    {
        public OpportunityLineItem prd{get; set;}
        public Boolean selected {get; set;}
        public OpportunityLineItemwrapper(OpportunityLineItem a)
        {
            prd = a;
            selected = false;
        }
    }
 // This is the Wrapper Name for the object Opportunity Line Items
    List<OpportunityLineItemwrapper> OppList = new List<OpportunityLineItemwrapper>();
    List<OpportunityLineItem> selectedProducts = new List<OpportunityLineItem>();

 //Defines a Map to store all items selected based on the ID from the  ID from the URl.
    Map<Id,OpportunityLineItem> selectedProductsMap = new Map<Id,OpportunityLineItem>();
   

    public Displayprodsinopprtunity(ApexPages.StandardController controller) {

    }
        
    public List<OpportunityLineItemwrapper> getProducts() {
        ID str = ApexPages.currentPage().getParameters().get('ID');         
        OppList.clear();
        
        for(OpportunityLineItem a : [Select Id,Quantity,
ListPrice,PricebookEntry.Product2Id,
 PricebookEntry.Name From OpportunityLineItem
 where Opportunity.id=:str]){
            
            OpportunityLineItemwrapper opplineItem = new OpportunityLineItemwrapper(a);            
            if (selectedProductsMap.get(a.Id) != null)
                opplineItem.selected = true;

            OppList.add(opplineItem);        
        }
        return OppList;
    }
    
    public PageReference getSelected() {
        selectedProducts.clear();
        for(OpportunityLineItemwrapper accwrapper : OppList)
        if(accwrapper.selected == true) {
            selectedProducts.add(accwrapper.prd);
            selectedProductsMap.put(accwrapper.prd.id, accwrapper.prd);
        }
        return null;    
        
    }
    
    public List<OpportunityLineItem> GetSelectedProducts()  {
        if(selectedProducts.size()>0)
   return selectedProducts;
        else
   return null;
    }    

    public void updateQuantity() {
        List<Id> SelectedIds = new List<Id>();
       
        for(OpportunityLineItem litem: selectedProducts) {            
             OpportunityLineItem updateQuantity = new OpportunityLineItem (Id=litem.Id,Quantity=22); 
             Update updateQuantity ;            
        }      
    }
    
    
     public PageReference SendMail() {
     
  Set<Id> SelectedIds = new Set<Id>();
  List<Product2> ContactMailID = new List<Product2> ();

  for(OpportunityLineItem litem: selectedProducts) {        
   SelectedIds.add(litem.PricebookEntry.Product2Id);
  }
  
  ContactMailID =[Select ID,Product_Mail__c,productcode 
  from Product2 where ID in:SelectedIds];

  Set<String> EmailID = new Set<String>();
  For(Integer i=0; i < ContactMailID.size(); i++) 
  {  
   EmailID.add(ContactMailID[i].Product_Mail__c);   
  }       
  
  List<contact> SendMail = new List<contact> ();
  SendMail= [Select Email from Contact where ID in:EmailID];
  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
  String[] toaddress = new String[]{};        
  For(Integer i=0; i < SendMail.size(); i++) { 
   toaddress.add(SendMail[i].Email);
  }       
  mail.setToAddresses(toaddress);
  mail.setsubject('You have got a mail');
  mail.setPlainTextBody('Please check'+ String.valueOf(SelectedIds));
  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
  return null;
    }
}