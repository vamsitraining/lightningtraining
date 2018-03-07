trigger setDefaultAccountValues on Account (Before insert, Before update) {
   
        for (Account oAccount : trigger.new) {
            
            if(oAccount.rating=='Cold'){
               
                oAccount.Industry = 'Cloud Computing';
                oAccount.Phone= '020103055';
                oAccount.Fax= oAccount.Phone;
            }
            else
            {
               
                oAccount.Industry = 'Cloud Computing';
                oAccount.Phone= '000000000';
                oAccount.Fax= oAccount.Phone;
            }
        }
    
}