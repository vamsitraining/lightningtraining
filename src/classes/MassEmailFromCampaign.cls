public class MassEmailFromCampaign {

/* Constructor Function. The campaign id is captured in this function */
public MassEmailFromCampaign(ApexPages.StandardController controller)
{
 cid=System.currentPageReference().getParameters().get('id');
}
/* Variable declarations */

Public String cid;                                                            // Stroes Campaign Id
public List<cContact> contactList {get; set;}                                 // Wrapper class which stores contact data and a boolean flag.
public Boolean selectAllCheckbox {get; set;}                                  // Stores checkbox data.
public boolean errormsg=false;                                                // Error msg. When no contact has been selected.
String userinput;                                                             // Contact Email
String userinp;                                                               // Contact Name

Public boolean displayboxes;

Public List<Contact> results = new List<Contact>();                                     // Contact search results.
Public List<Contact> selectedContactsstep2 = new List<Contact>();             // Selcted Contacts


/* End of Variable declarations */

/* Getter and setter methods for getting the user input ie. Contact name and email from the UI */

public String getuserinput(){return userinput;}
public void setuserinput(String userinp){this.userinput=userinp;}
public String getuserinp(){return userinp;}
public void setuserinp(String userinp){this.userinp=userinp;}


/*End of Getter and Setter methods */



/* Method to Search the contact database to fetch the query results */
public List<Contact> contactsearch()
{
     errormsg=false;
     contactList = new List<cContact>();
     for(Contact c : [select Account.Name,Name,FirstName,LastName,Email,title,Id from Contact where Email like :userinput+'%' and Name like :userinp+'%'])
     {
         contactList.add(new cContact(c));
     }

 return null;
}
/* End of method */


/* Method for returning the contact search results to the UI */
public List<cContact> getresults()
{

 return contactList;

}
/* End of Method */


/* Wrapper class to contain contact record and a boolean flag */
public class cContact
{
 public Contact con {get; set;}
 public Boolean selected {get; set;}

 /*This is the contructor method. When we create a new cContact object we pass a
 Contact that is set to the con property. We also set the selected value to false*/
 public cContact(Contact c)
 {
     con = c;
     selected = false;
 }
}
/* end of Wrapper class */


/* Method to fetch the selected records and send email to them */
public PageReference processSelected()
{

  List<Contact> selectedContacts = new List<Contact>();
  if (contactList!= null)
  {
     for(cContact cCon : getresults()){
        if(cCon.selected == true){
             selectedContacts.add(cCon.con);
         }
     }

     selectedContactsstep2=selectedContacts;
  }
 /* return error message if no contact is selected */
 if (selectedcontacts.size()==0)
 {
     errormsg=true;
     return null;
 }
 else
 {
     errormsg=false;
     String id=System.currentpagereference().getparameters().get('id');
     Pagereference p=new Pagereference ('/apex/MassEmailFromCampaignStep2');
     return p;
 }

}
public List<SelectOption> getItems()
{
 List<SelectOption> options = new List<SelectOption>();
 options.add(new SelectOption('YES','YES'));
 options.add(new SelectOption('NO','NO'));
 return options;
}


/* return error message if no contact is selected */
public boolean geterrormsg()
{
 return errormsg;
}


/* Method to cancel the entire process */
public Pagereference Cancel()
{
        Pagereference p =new Pagereference('/'+cid);
        return p;
}
       

}