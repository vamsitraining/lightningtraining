public with sharing class listcls {
    
    public void m1(){
        /*
            Allows Indexing
            Allows Duplciates
            Elemets are in ordered but not sorted
        */
        List<String> lst = new List<String>();
        string s= 'Ctrla';
        System.debug('------5---->'+s.length());
        lst.add('1248');
        lst.add('ABC');
        lst.add('Def');
        lst.add('GHI');
        lst.add('JKL');
        
        System.debug('----No of elmenets in list-----5--->'+lst.size());
        System.debug('----Elements in the list are -------->'+lst);
        
        System.debug('-------Frist element in list ---1248---'+lst[0]);
        System.debug('-------Last element in list ---JKL---'+lst[lst.size()-1]);
        
        lst.remove(2);
        System.debug('----Elements in the list after removing DEF are -------->'+lst);
        
        lst.add('def');
        lst.add('JkL');
        lst.add('JKL');
        lst.add('$123');
        lst.add('GHI');
        
        System.debug('----No of elmenets in list after adding dups-----9--->'+lst.size());
        
        lst.sort();
        System.debug('----No of elmenets in list after sorting--->'+lst);
        
        list<String> newlst = lst.clone();
        
        System.debug('----No of elmenets in new list--->'+newlst);
        
        lst.clear();
        System.debug('--------0------->'+lst.size());
        System.debug('--------9------->'+newlst.size());
        
        System.debug('----true--------->'+lst.isEmpty()); 
        System.debug('----false--------->'+newlst.isEmpty());
    }
    
}