public with sharing class mycontoller {
    public String getSection2() {
        return null;
    }


    public String getSection1() {
        return null;
    }


    public PageReference updateData() {
        return null;
    }


    public String someList { get; set; }

    public String selectedValue { get; set; }


 public class MyController {
          public Boolean section1 {get; set;}
          public Boolean section2 {get; set;}
          public List<Selectoption> someList {get; set;}
          public String selectedValue {get; set;}

          public MyController() {
            section1 = false;
            section2 = false;
            someList = new List<SelectOption>{new Selectoption ('value1', 'label1'),
                                              new Selectoption ('value2', 'label2')};
          }

          public void updateData() {
             if(selectedValue == 'label1') {
                  section1 = true;
                  section2 = false;
             } else if(selectedValue == 'label2') {
                  section1 = false;
                  section2 = true;
             }
          }
      }
}