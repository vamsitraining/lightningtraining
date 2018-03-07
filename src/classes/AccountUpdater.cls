public class AccountUpdater {

  //Future annotation to mark the method as async.
  @Future(callout=true)
  public static void updateAccount(String id, String name) {

    //construct an HTTP request
    HttpRequest req = new HttpRequest();
    req.setEndpoint('http://cheenath.com/tutorial/sfdc/sample1/data.txt');
    req.setMethod('GET');

    //send the request
    Http http = new Http();
    HttpResponse res = http.send(req);

    //check the response
    if (res.getStatusCode() == 200) {

      //update account
      Account acc = new Account(Id=id);
      acc.Description = res.getBody();
      update acc;
    } else {
      System.debug('Callout failed: ' + res);
    } 
  }
}