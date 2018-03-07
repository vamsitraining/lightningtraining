public class accountInsertCOn {
    ApexPages.StandardController con;
    public accountInsertCOn(ApexPages.StandardController controller) {
    con=controller;
    }
    public pagereference save()
    {
       con.save();
       pagereference ref = new pagereference('/apex/editdelete');
       ref.setRedirect(TRUE);
       return ref;
    }
}