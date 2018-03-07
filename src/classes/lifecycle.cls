public with sharing class lifecycle {
    public lifecycle(myController20 controller) {

    }


    public lifecycle(MyController10 controller) {

    }



    public lifecycle(MyController controller) {

    }


    private final Account acct;
    Integer EmpAdd;

    public lifecycle(myController1 controller) {
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