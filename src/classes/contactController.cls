public class contactController {

   // Return a list of the ten most recently modified contacts&nbsp; 
    
   public List<Contact> getContacts(){
      return [SELECT Id, Name, Account.Name, Phone, Email
              FROM Contact
              ORDER BY LastModifiedDate DESC LIMIT 100];
   }

   // Get the 'id' query parameter from the URL of the page.&nbsp; 
   // If it's not specified, return an empty contact.&nbsp; 
   // Otherwise, issue a SOQL query to return the contact from the&nbsp; 
   // database.&nbsp; 
    
   public Contact getContact(){
      Id id = System.currentPageReference().getParameters().get('id');
      return id == null ? new Contact() : [SELECT Id, Name
                                             FROM Contact
                                            WHERE Id = :id];
   }

}