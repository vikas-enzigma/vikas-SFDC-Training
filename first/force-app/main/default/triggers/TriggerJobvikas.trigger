trigger TriggerJobvikas on Job_Vikas__c (before delete,after update, before update) {

    if(Trigger.isBefore)
    {
        if(Trigger.isDelete)
        {
            JobTriggerHandler.checkActive(Trigger.old);
        }
        if(Trigger.isUpdate)
        {
            JobTriggerHandler.deActivateJob(Trigger.new);
            JobTriggerHandler.updateStausOnNoOfPositionUpdate(Trigger.new);

        }
    }
    
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
        {
                  
            JobTriggerHandler.sendEmail(Trigger.new);

        }
    }
}