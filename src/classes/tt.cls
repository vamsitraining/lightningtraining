public class tt
{
    public List<Account> accLst {get; set;}
    public List<Contact> conLst {get; set;}
    public List<MyWrapper> wrapper {get; set;}

    public tt()
    {
        accLst = [select id,name from account limit 10] ;
        conLst = [select id,name from contact limit 10] ;
        wrapper = new List<MyWrapper>() ;
        for(Integer i=0 ; i < 10 ; i++)
            wrapper.add(new MyWrapper(accLst[i] , conLst[i])) ;
    }
    
    public class MyWrapper
    {
        public Account accRec {get; set;}
        public Contact conRec {get; set;}
        
        public MyWrapper(Account acc , Contact con)
        {
            accRec = acc ;
            conRec = con ;
        }
    }
}