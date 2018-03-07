<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>oppname</fullName>
        <field>Name</field>
        <formula>Account.Name &amp; &quot;: &quot; &amp; Name</formula>
        <name>oppname</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_feild</fullName>
        <field>DISCOUNT__c</field>
        <formula>IF( Amount &gt; 1000 &amp;&amp; Amount &lt;2000 , 0.15, 
IF( Amount &gt; 2001, 0.20,0
))</formula>
        <name>update feild</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>naming</fullName>
        <actions>
            <name>oppname</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Enforce opportunity naming convention</description>
        <formula>NOT(CONTAINS( Name, Account.Name ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>update feild</fullName>
        <actions>
            <name>update_feild</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
