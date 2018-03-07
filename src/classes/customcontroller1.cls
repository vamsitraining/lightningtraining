public class customcontroller1 {

    public String EmployeeName3 { get; set; }

    public String EmployeeName2 { get; set; }

    public PageReference next() {
     System.debug('123------');    
        //PageReference nextpage = new PageReference('/apex/Page4?EN='+EmployeeName+'&EN2='+EmployeeName2);
        PageReference nextpage = new PageReference('/apex/open_new_window');
        nextpage.getParameters().put('En',EmployeeName);
        nextpage.getParameters().put('En2',EmployeeName2);
        nextpage.getParameters().put('En3',EmployeeName3);
        System.debug('VALUES'+nextpage); 
        return nextpage.setRedirect(True); //Note that setRedirect method is used here
    }


    public String EmployeeName { get; set; }
}