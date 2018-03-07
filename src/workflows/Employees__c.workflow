<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Employee update</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Employees__c.Country__c</field>
            <operation>equals</operation>
            <value>India</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
