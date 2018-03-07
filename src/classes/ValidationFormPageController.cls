public class ValidationFormPageController {
private string textAreaStyle = '';
private string selected_Value = 'Value1';
private string inputTextValue = '';
public string getSelectedValue()
{
return selected_Value;
}
public void setSelectedValue(String value)
{
selected_Value = value;
}
public string getInputTextValue()
{
return inputTextValue;
}
public void setInputTextValue(string Value)
{
inputTextValue = Value;
}
public string getTextAreaStyle()
{
return textAreaStyle ;
}
public PageReference Run() {
if (!isValid())
{
//what to show when the data is not valid:
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Validation Failed: Comments are required.'));
textAreaStyle = 'border-size:2px; border-color:red;border-style:solid;';
return null;
}
else
{
// things to do when data is valid.
textAreaStyle = '';
}
//The rest of your logic
return null;
}
private Boolean isValid()
{
// this method is called to validate the data entered by user.
if (selected_Value != 'Value3')
{
if (inputTextValue == '')
return false;
else
return true;
}
else
return true;
}
}