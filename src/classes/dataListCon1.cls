public class dataListCon1 {

List<contact> contacts;

        public List<contact> getcontacts() {
                if(contacts == null) contacts = [SELECT Name,Account.Name,Account.AccountNumber,Account.AnnualRevenue FROM contact LIMIT 10];
                return contacts;
        }
}