public with sharing class lifecycle20 {
    public lifecycle20(myController20 controller) {

    }



    private final Account acct;
    Integer EmpAdd;

    public lifecycle20(myController controller) {
        this.acct = (Account)controller.getAccount();
    }

    public String getGreeting() {
        return acct.name + ' Current Information';
    }
    
    public void resetEmp() {
        acct.numberofemployees = 10;
        update acct;
    }
}