trigger accountAfterInsert on Account (after insert) {
 
     list<id> accId = new list<id>();
     for(id acc: trigger.newMap.keySet()){
         accId.add(acc);
      }
       
      
}