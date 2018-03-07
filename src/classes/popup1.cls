public with sharing class popup1 {

    public popup1(ApexPages.StandardController controller) {

    }

  
    public boolean displayPopup {get; set;}    
   
    public void closePopup()
    {       
        displayPopup = false;   
    }    
    public void showPopup()
    {       
        displayPopup = true;   
    }   
  }