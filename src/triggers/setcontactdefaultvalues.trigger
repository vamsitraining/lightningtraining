trigger setcontactdefaultvalues on Contact (before insert,before update) {

for(contact con : trigger.new){
 
     if( con.LeadSource == 'Web'){
     
      con.Fax='2525252';
     
     
     }

}

}