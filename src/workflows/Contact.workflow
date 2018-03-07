<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>text</fullName>
        <description>text</description>
        <protected>false</protected>
        <recipients>
            <recipient>marketing_officer</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/send_email_to_marketing_officer</template>
    </alerts>
    <rules>
        <fullName>send email to marketing officer</fullName>
        <actions>
            <name>text</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.status__c</field>
            <operation>equals</operation>
            <value>Aware-Neutral or Champion</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
