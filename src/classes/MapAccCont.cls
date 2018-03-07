public with sharing class MapAccCont {

    Map<Integer, Account> mapToAccount = new Map<Integer, Account>();

    public MapAccCont() {
        Integer i = 0;
        for (Account a : [SELECT Id, Name FROM Account LIMIT 10]) {
            mapToAccount.put(i, a);
            i++;
        }
    }

    public Map<Integer, Account> getMapToAccount() {
        return mapToAccount;
    }
}