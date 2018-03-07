trigger DuplicateMemberCheck on Contact(before insert) 
{ 
for(Contact memb:trigger.new)
{
List<Contact> mem = new List<Contact>();

String email = memb.Email;

String sql = 'SELECT Email FROM Contact';
mem = Database.Query(sql);

for(Contact tempMember:mem)
{
if(tempMember.Email == email)
{
memb.Email.addError('Duplicate Record'); 
}
} 
}
}