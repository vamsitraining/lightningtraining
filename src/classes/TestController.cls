public with sharing class TestController {

    // Data for the first example
    public List<Account> accounts {get; set;}
    public List<Product2> products {get; set;}

    // Data for the second example
    public List<GridRow> gridRows {get; set;}

    public TestController() {
        accounts = new List<Account>();
        accounts.add(new Account(Name='One'));
        accounts.add(new Account(Name='Two'));
        accounts.add(new Account(Name='Three'));

        products = new List<Product2>();
        products.add(new Product2(Name='Product One'));
        products.add(new Product2(Name='Product Two'));
        products.add(new Product2(Name='Product Three'));

        gridRows = new List<GridRow>();

        for(Integer cust = 0; cust < 3; cust++) {
            GridRow row = new GridRow();
            row.acc = new Account(Name='Customer '+cust);
            List<Product2> prods = new List<Product2>();
            for(Integer p = 0; p < 3; p++) {
                prods.add(new Product2(Name='Product '+p));
            }
            row.products = prods;
            gridRows.add(row);
        }
    }

    public class GridRow {

        public Account acc {get; set;}
        public List<Product2> products = new List<Product2>();

        public List<Product2> getProducts() {
            return products;
        }       

    }
}