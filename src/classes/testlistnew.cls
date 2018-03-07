Public class testlistnew{

    Public testlistnew(){
       
        //list<account> acc = [select id from account where name startwith (N)];
        //list<account> acc1 = [select id from account where name Endwith (H)]; 
          
    }
    
    
    Public list<account> Kiran(){
        
        List<account> Newacc = new List<account>();
        list<account> acc = [select id from account];
        list<account> acc1 = [select id from account];
        account acc2 = [select id from account];

        If(acc.size()>0){            
            for(account a:acc){
                Newacc.add(a);
            }
        }
        If(acc2!=null){
            for(account a:acc1){
                Newacc.add(a);
            }    
        }
        
        system.debug('<====>'+Newacc);
        return Newacc;
        
    }
    
    

}