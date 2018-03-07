public with sharing class floatingHeadersController {


    public list<contact> contactList
    {
        get
        {
          if (contactList == null)
          {
              contactList = [select firstname, lastname, email, phone from contact];
          }  
          return contactList;
        }
        set;
    }
}