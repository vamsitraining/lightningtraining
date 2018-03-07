public class newvsold
{

public newvsold(ApexPages.StandardController controller)
{

}
public Pagereference pageredir()
{
    Pagereference newpage = new Pagereference ('/001/e?retURL=/001/');
    return newpage;
}
}