public class Sample1
{ 
    public PageReference parseJson() {
        return null;
    }

  
    public String idOfRec {get;set;}
   
    public Sample1()
    {
    }
   
    public void cloneRec()
    {
        List<Contact> cons = new List<Contact>();
        Account acc = [SELECT ID, Name FROM Account WHERE Id = : idOfRec];
        Account accCopy = acc.clone(false,true);
        insert accCopy;
        List<Contact> con = [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = : acc.Id];
        for(Contact c : con)
        {
            Contact conCopy = c.clone(false,true);
            conCopy.AccountId = accCopy.Id;
            cons.add(conCopy);
        }
        insert cons;
    }
}