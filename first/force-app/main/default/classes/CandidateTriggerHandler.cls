public class CandidateTriggerHandler {
    
        
    public static void checkExpectedSalary(List<Candidate_Vikas__c> lstCandidate) {
        
       for(Candidate_Vikas__c candidate : lstCandidate)
        {
            if(candidate.Expected_Salary__c==null)
            {
                candidate.addError('Expected Salary field is missing');
                //return 'Expected Salary field is missing';
            }
        }     	   
    }
    
    
    public static void checkJobActive(List<Candidate_Vikas__c> lstCandidate){
       
     
         Map <Id, Job_Vikas__c> JobActive= new Map<Id, Job_Vikas__c>([SELECT id,Active1__c FROM Job_Vikas__c WHERE Active1__c=false]);

        for(Candidate_Vikas__c candidate : lstCandidate) {
            
            if(JobActive.get(candidate.Name__c) != null) {
                
				candidate.addError('This Job is not active. You can not apply for this job.');                
            }
        }     
        
        
    }
    
    
    public static void set_Application_Date(List<Candidate_Vikas__c> lstCandidate) 
    {
        
        for(Candidate_Vikas__c candidate : lstCandidate)
        {
            system.debug(candidate.Application_Date__c);
           	 candidate.Application_Date__c=candidate.CreatedDate.date();
            upsert candidate;
            system.debug('insert 2');
        }
    }
    
    public static void set_Application_Date_on_Insert(List<Candidate_Vikas__c> lstCandidate) 
    {
        //List<Candidate_Vikas__c> lstcan1=new List<Candidate_Vikas__c>();
        for(Candidate_Vikas__c candidate : lstCandidate)
        {
            system.debug(candidate.Application_Date__c);
           	 //candidate.Application_Date__c=candidate.CreatedDate.date();
            candidate.Application_Date__c=system.today();
            
        }
    }
      
   
    
}