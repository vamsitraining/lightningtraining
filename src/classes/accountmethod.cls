public class accountmethod {
list<account> acclist=new list<account>();
public accountmethod(){
data();
}
public void data(){
acclist=[select id,name,accountnumber from account limit 1000];
}
public list<account> getacclist(){
return acclist;
}
public void delrecord()
{
id accid=apexpages.currentpage().getparameters().get('accid');
account acc=[select id from account where id=:accid];
delete acc;
data();
}
}