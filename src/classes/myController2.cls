public class myController2 {
  public List<aTableRow> tableRows { get; set; }
  public class aTableRow {
    public Contact theContact { get; set; }
    public Account theAccount { get; set; }
    public Boolean isSelected { get; set; }
    public aTableRow(Contact c,Account a,Boolean b) {
      theContact = c;
      theAccount = a;
      isSelected = b;
    }
  }

  public myController2() {
    tableRows = new List<aTableRow>();
    for(Contact c:[select id,firstname,lastname,account.id,account.name from contact ]) {
      tableRows.add(new aTableRow(c,c.account,false));
    }
  }
}