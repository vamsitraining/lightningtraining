public class MemberPopup
{
    public List<Account> memberList {get;set;}
    public List<Account> memberAddList {get;set;}
    public String memberName {get;set;}      
    public MemberPopup()
    {
        String sql = 'SELECT Name,Company__c FROM Account';
        memberList = Database.Query(sql);
        memberAddList = new List<Account>();
        memberAddList.add(new Account());
    }  
    public void AddRow()
    {
        memberAddList.add(new Account());
    }
}