Trigger AccBeforeTrg on Account (before insert, before update) {
    
    //Generally used for Field mappings and Data validations
    
    Account acc = trigger.new[0];
    
    System.debug('--------Newly insrted Rec--------------->'+acc);
    
    if(acc.phone == null)
    acc.phone.addError('Please enter phone value.....');
    
    if(acc.fax == null && acc.Phone != null)
    acc.Fax = acc.Phone;
    
    acc.Rating = 'Hot';
    
    if(acc.Type != null && acc.Industry == null)
    acc.addError('If type given, please provide industry also...');
}