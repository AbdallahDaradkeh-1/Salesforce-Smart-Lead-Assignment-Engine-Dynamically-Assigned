public with sharing class RepSelector {
   
   
   
    public static Id  findRepWithLowestLoad(String queueName) {
        // 1. get queue members
        List<GroupMember> members = [SELECT Id, UserOrGroupId FROM GroupMember WHERE Group.DeveloperName = :queueName];

        // Step 2: track who has the lowest load
        Id lowestRep = null;
        Integer lowestCount = 999999;

        // Step 3: loop and count

        for(GroupMember member : members) {
    Integer leadCount = [
        SELECT COUNT() 
        FROM Lead 
        WHERE OwnerId = :member.UserOrGroupId
    ];

     if(leadCount < lowestCount) {
                lowestCount = leadCount;
                lowestRep = member.UserOrGroupId;
            }
}
        // 3. return rep with minimum

        return lowestRep;
    }
}

