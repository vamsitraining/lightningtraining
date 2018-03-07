public class testsetnew{
   
   public  testsetnew(){
    
      kiran();
   }
   
   private void kiran(){
   
      set<id> ids = new  set<id>();
      set<string> ids1 = new  set<string>();
      set<account> ids2 = new  set<account>();
      List<contact> con3 = new List<contact>();
      List<contact>  con = [select id from contact];
      List<contact>  con1 = [select id from contact];
       
       
       
      for(contact c: con){
      
          con3.add(c);
          ids.add(c.id);
      
      } 
      for(contact c: con1){
      
          con3.add(c);
          ids.add(c.id);
      
      }  
   
      list<contact> accNew = [select id from contact where id in:(ids)];
      
      delete accNew;
   
   }


}