public class multiAccountInsert1
{ 
  public integer num { get; set; }
  public List<Account> accts {get; set;} 
  public multiAccountInsert1()
  {
     accts = new List<Account>(); 
     accts.add(new Account());    
  }
   public PageReference add_rows() {
    for(integer i=0;i<num ;i++)
        {
          accts.add(new Account());    
        }
        
        return null;
     }
  public PageReference save_close()
  {       insert accts;
     PageReference home = new PageReference('/home/home.jsp');
     home.setRedirect(true);
     return home;
  }
}