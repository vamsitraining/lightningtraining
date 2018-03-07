@istest(seealldata=true)
public  class testaccountmethod {
static testmethod void testaccountmethod(){
account acc1=new account();
acc1.Name='string';
acc1.AccountNumber='123456';
insert acc1;
accountmethod acc=new accountmethod();
acc.data();
acc.delrecord();


}

}