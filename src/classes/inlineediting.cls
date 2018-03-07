public class inlineediting {

public Boolean readonly;
public boolean editmode;
public inlineediting(ApexPages.StandardController controller)
{
readonly=true;
editmode=false;
}
public boolean getreadonlymode(){return readonly;}

public void setreadonlymode(Boolean readonly)
{
this.readonly= readonly;
}
public boolean geteditmode(){return editmode;}

public void seteditmode(Boolean editmode)
{
this.editmode= editmode;
}
public void inlineedit()
{
system.debug('entered here');
readonly = false;
editmode = true;
}   

}