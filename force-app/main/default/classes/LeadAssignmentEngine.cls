public with sharing class LeadAssignmentEngine {
    
     public static void assignLeads(List<Lead> leads) {
        for(Lead lead : leads) {
            if(lead.Score__c != null && lead.Score__c > 80) {
                // → Senior Reps Round Robin
                lead.OwnerId = RepSelector.findRepWithLowestLoad('Senior_Reps_Queue');

            } else if(lead.Country == 'Jordan') {
                // → Jordan Queue Round Robin
                lead.OwnerId = RepSelector.findRepWithLowestLoad('Jordan_Queue');

            } else if(lead.Country == 'United Arab Emirates') {
                // → UAE Queue Round Robin
                lead.OwnerId = RepSelector.findRepWithLowestLoad('UAE_Queue');

            } else{
                lead.OwnerId = RepSelector.findRepWithLowestLoad('Fallback_Queue');
            }
        }
    }
}