public with sharing class avoidduplicatevalues{ 
  public List<selectOption> Coptions = new List<selectOption>();
  public set<String> setCountries = new set<String>();
  public List<selectOption> getrecords(){
Coptions.add(new selectOption('--None--','--None--')); 
  for(Country__c objC : [select Id,name from Country__c]){
  if(!setCountries.contains(objC.name)){ 
  setCountries.add(objC.name);
  Coptions.add(new selectOption(objC.name,objC.name));
  }
  }
  return Coptions;
  }
}