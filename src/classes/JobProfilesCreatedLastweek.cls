public with sharing class JobProfilesCreatedLastweek {
 public List<AggregateResult> getData() {
        return
            [SELECT COUNT(Name) Jobprofiles,  CreatedBy.LastName  Creator
                     FROM Opportunity
                     GROUP BY  CreatedBy.LastName ];
    }
}