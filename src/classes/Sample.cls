public class Sample
{
    public String getText1() {
        return null;
    }


    public PageReference parseJson() {
        return null;
    }


    public String getIdOfRec() {
        return null;
    }


    public Boolean pbs1cb1 {get;set;}
    public Boolean pbs1cb2 {get;set;}
    public Boolean pbs1cb3 {get;set;}
    
    public Boolean pbs2cb1 {get;set;}
    public Boolean pbs2cb2 {get;set;}
    public Boolean pbs2cb3 {get;set;}
    
    public Boolean pbs3cb1 {get;set;}
    public Boolean pbs3cb2 {get;set;}
    public Boolean pbs3cb3 {get;set;}    
    
    public Boolean pbs1 {get;set;}
    public Boolean pbs2 {get;set;}    
    public Boolean pbs3 {get;set;}   
    
    public sample()
    {
        pbs1 = true;
        pbs2 = false;
        pbs3 = false;
    } 

    public void check()
    {
        if(pbs1cb1 == true && pbs1cb2 == true && pbs1cb3 == true)
        {
            pbs2 = true;
            
            if(pbs2cb1 == true && pbs2cb2 == true && pbs2cb3 == true)
            {
                pbs3 = true;
            }
            else
            {
                pbs3 = false;
            }
        }
        else
        {
            pbs2 = false;
            pbs3 = false;
        }
    }
}