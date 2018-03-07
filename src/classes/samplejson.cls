public class samplejson
{    
    public String text1 {get;set;}
      
    public samplejson()
    {
         
    }    
    public void parseJson()
    {
        String soql = 'SELECT Name,Phone FROM Account LIMIT 1';
        List<Account> acct = Database.Query(soql); 
        text1 = JSON.serialize(acct);
    }    
}