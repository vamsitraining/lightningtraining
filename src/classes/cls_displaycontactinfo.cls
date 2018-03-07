public class cls_displaycontactinfo
{
 
  public final Contact contact;
  public user user1;
    public cls_displaycontactinfo (){
      
         user1= [ select contactid from user where id= :UserInfo.getUserID()];
       //  contact=[select name from contact where id=:user1.contactid];
         list<contact> lstp = [select name from contact where id=:user1.contactid];
        }
        public Contact getContact() {
        return contact;
        }
   
 }