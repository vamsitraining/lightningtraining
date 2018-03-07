public with sharing class DynaTreeHierarchyController {

    public void IWantToDebug() {
        String para = ApexPages.CurrentPage().getParameters().get('param1');
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING, 'Msg ' + para));
        System.debug('Called from JS without para ' + para);
    }
}