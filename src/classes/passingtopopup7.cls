public class passingtopopup7{
     public String EmployeeName { get; set; }
      
    public String EmployeeName3 { get; set; }

    public String EmployeeName2 { get; set; }

    public PageReference next() {
        //PageReference nextpage = new PageReference('/apex/Page4?EN='+EmployeeName+'&EN2='+EmployeeName2);
        PageReference nextpage = new PageReference('/apex/popup7');
        nextpage.getParameters().put('En',EmployeeName);
        nextpage.getParameters().put('En2',EmployeeName2);
        nextpage.getParameters().put('En3',EmployeeName3);
        return null;
        //return nextpage.setRedirect(True); //Note that setRedirect method is used here
    }


   
}