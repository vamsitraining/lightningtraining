public class accountlist {
public list<Account> accs {get;set;}
    public accountlist() {

    }


    public accountlist(ApexPages.StandardController controller) {
 
           accs = [Select Name From Account];
           system.debug('///////////////'+accs);
 
    }

}