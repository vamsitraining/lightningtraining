public class bhadraPieChartController {
 

  public List<BhadraPieWedgeData> getPieData() {

       List<BhadraPieWedgeData> namedata = new List<BhadraPieWedgeData>();  
   

    namedata.add(new BhadraPieWedgeData('Jan', 30));
      
    namedata.add(new BhadraPieWedgeData('Feb', 15));
       
    namedata.add(new BhadraPieWedgeData('Mar', 10));
       
    namedata.add(new BhadraPieWedgeData('Apr', 20));
       
    namedata.add(new BhadraPieWedgeData('May', 20));
       
    namedata.add(new BhadraPieWedgeData('Jun', 5));
       
    return namedata;
   
  } 
   
  
   
   
    public class BhadraPieWedgeData {

       
        public String name { get; set; }
       
        public Integer data { get; set; }
       
        public BhadraPieWedgeData(String name1, Integer data1) {
               this.name = name1;           
               this.data = data1;
        }

  
    }

}