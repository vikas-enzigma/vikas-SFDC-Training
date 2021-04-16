trigger TriggerCandidateVikas on Candidate_Vikas__c (before insert, after insert, before update) {
               
     //CSforTriggerCandidate__c tc = CSforTriggerCandidate__c.getValues('00e5g000002UhcV');
     //if(tc.ActiveStatus__c ){
        
        if(Trigger.isBefore && Trigger.isInsert){
            CandidateTriggerHandler.checkJobActive(Trigger.new);
            CandidateTriggerHandler.checkExpectedSalary(Trigger.new);
            CandidateTriggerHandler.set_Application_Date_on_Insert(Trigger.new);

        }
        
        if(Trigger.isBefore && Trigger.isUpdate)
        {
            CandidateTriggerHandler.set_Application_Date(Trigger.new);
        }
    
    
        if(Trigger.isAfter && Trigger.isInsert)
        {
            
            
        }
   //}
        
}