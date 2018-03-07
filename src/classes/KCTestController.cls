public class KCTestController {


private ApexPages.StandardController std;

List<Account> accList;
public String globalID;
public String accTestName;
// the soql without the order and limit
private String soql {get;set;}
// the collection of Accounts to display
public List<Account> accounts {get;set;}

public List<Account> getAccs {get;set;}

// the current sort direction. defaults to asc
public String sortDir {
get { 
if (sortDir == null) { 
sortDir = 'asc'; 
} 
return sortDir; }
set;
}

// the current field to sort by. defaults to Account name
public String sortField {
get { if (sortField == null) {sortField = 'Name'; } return sortField; }
set;
}

// format the soql for display on the visualforce page
public String debugSoql {
get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20'; }
set;
}

// init the controller and display some sample data when the page loads
public KCTestController() {
soql = 'select Id,Name,BillingCity from Account';
//runQuery();

}

// toggles the sorting of query from asc<-->desc
public void toggleSort() {
// simply toggle the direction
sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
// run the query again
runQuery();
}

// runs the actual query
public void runQuery() {

try {
accounts = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20');
} catch (Exception e) {
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
}

}

// runs the search with parameters passed via Javascript
public PageReference runSearch() {

String accName = Apexpages.currentPage().getParameters().get('firstName');
String bCity = Apexpages.currentPage().getParameters().get('bCity');

soql = 'select Id,Name,BillingCity from Account';
if (!accName.equals(''))
soql += ' where Name LIKE \''+String.escapeSingleQuotes(accName)+'%\' or BillingCity LIKE \''+String.escapeSingleQuotes(accName)+'%\'';
if (!bCity.equals(''))
soql += ' and BillingCity LIKE \''+String.escapeSingleQuotes(bCity)+'%\'';


// run the query again
runQuery();

return null;
}
public PageReference getAccounts() {


Account acc = [select Id,Name From Account where Id = :ApexPages.currentPage().getParameters().get('accId')];
//system.debug('************************************************'+acc);
return null;
}

public Account[] getAccs() {


accList = [select Id,Name,Phone,Fax,Website,BillingCity,BillingState,BillingPostalCode From Account where Id = :ApexPages.currentPage().getParameters().get('accId')];

return accList;
}

//Account Block
public pagereference save() {
try {
system.debug('********************************'+ApexPages.currentPage().getParameters().get('accId'));
update accList;
return null;
} catch(exception e) { apexpages.addmessages(e); }
return null;
}
public KCTestController(ApexPages.StandardController controller) {
}

}