trigger createanaccount on Contact (after insert) {
List<account> acc = new List<account>();
for (contact newcontact: Trigger.New)
         if (newcontact.lastname != null){
                 acc.add (new account(
                     Name = newcontact.lastname,
                     AccountNumber = newcontact.MobilePhone));   
         }
   insert acc;


}