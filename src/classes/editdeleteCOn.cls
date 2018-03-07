public class editdeleteCOn {
 //global declarations
   public String ecid{get;set;} // commandlink edit property
   public String dcid{get;set;} // commandlink delete property
   public String ccid{get;set;} // commandlink clone property
   list<Account> lstacc = new list<Account>();
   list<Account> lstacc1 = new list<Account>();
   // Displaying accounts on vfpage
    public list<Account> getlstacc () {
      lstacc =[select Name,phone,website from Account];
      return lstacc;
    }
    // To redirect to editpage.
     public PageReference editCon() {
       pagereference ref = new pagereference('/apex/dataedit?id='+ecid);
       ref.setRedirect(False);
       return ref;   
    }
    // to delete the selected record
       public pagereference deleteCon() {
        lstacc1 =[Select id,Name from Account where id=:dcid];
        delete lstacc1;
        pagereference ref = new pagereference('/apex/editdelete');
        ref.setredirect(True);
        return ref;   
    }
     // to redirect to insert page.
    public PageReference insertNew() {
    pagereference ref = new pagereference('/apex/accountinsert');
    ref.setRedirect(True);
    return ref; 
    }
    // for cloning the records.
    public PageReference cloneCon() {
    account c =  [Select id,Name From account where id =:ccid];
    account cloneaccount = c.clone(false);
    insert cloneaccount;
    pagereference ref = new pagereference('/apex/editdelete');
    ref.setRedirect(True);
    return ref; 
    }
}