public class customcontroller2 {

    public String EmployeeName { get; set; }
    public String EmployeeName2 { get; set; }
    public String EmployeeName3 { get; set; }
    //Constructor
  public customcontroller2()
  {
    EmployeeName = ApexPages.currentPage().getParameters().get('EN');
    EmployeeName2 = ApexPages.currentPage().getParameters().get('EN2');
    EmployeeName3 = ApexPages.currentPage().getParameters().get('EN3');
  }
}