trigger descriptionUpdater on Account (after insert) {

  System.debug('Making future call to update account');
  for (Account acc : Trigger.New) {
    //Call future method to update account
    //with data from external server.
    //This is a async calls, it returns right away, after
    //enqueuing the request.

    AccountUpdater.updateAccount(acc.Id, acc.Name);
  }

}