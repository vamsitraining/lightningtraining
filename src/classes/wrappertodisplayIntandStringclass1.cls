/*
wrapper classes:
1. wrapper class is nothing but an inner class
2. To return more than one list to the pageblocktable.
*/
public with sharing class wrappertodisplayIntandStringclass1 {

public List<wrapper> lstw = new List<wrapper>();
public List<wrapper> getlstwrapper(){
lstw.add(new wrapper(10,'A'));
lstw.add(new wrapper(20,'B'));
lstw.add(new wrapper(30,'C'));
lstw.add(new wrapper(40,'D'));
lstw.add(new wrapper(50,'E'));
return lstw;
}

public class wrapper{ // wrapper class
public Integer i{get;set;}
public String s{get;set;}
public wrapper(Integer i,String s){
this.i=i;
this.s=s;
}   
}
}