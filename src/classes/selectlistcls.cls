public with sharing class selectlistcls {

public List<selectoption> getitems()
{
List<selectoption> optn=new List<selectoption>();
optn.add(new selectoption('a','a'));

return optn;
}

public String gselected { get; set; }
}