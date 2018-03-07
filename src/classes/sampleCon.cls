public class sampleCon {
public List<Wrapper> wrap1{get;set;}
public Integer size{get;set;}

public sampleCon(){
wrap1=new List<Wrapper>();
wrap1.add(new wrapper(0));
 size=wrap1.size();

}

public PageReference addElement(){
size=wrap1.size();


System.debug('Hello ji'+Apexpages.currentPage().getParameters().get('fieldName')+'size is'+size);
Integer i=Integer.valueOf(ApexPages.currentPage().getParameters().get('fieldName'));

if(i == size-1)
{
wrap1.add(new wrapper(size));

size++;
}

return null;

}


    public class wrapper{
    public integer i{get;set;}
    public String x{get;set;}
    public wrapper(Integer p){
i=p;
    }}
    }