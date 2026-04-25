trigger LeadTrigger on Lead (before insert, before update) {
    LeadAssignmentEngine.assignLeads(Trigger.new);
}