global class remotecls {
    @RemoteAction
    public static string getData(string accId){
        Account acc=[Select id, name from Account where Id =:accId];
        return acc.name;
    }
}