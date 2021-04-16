public class CandidateRegCustController {

    public Candidate_Vikas__c candidate { get; private set; }
    
    public CandidateRegCustController(){
        
           Id id =ApexPages.currentPage().getParameters().get('id');
           candidate= (id==null)?new Candidate_Vikas__c():[select Salutation__c,DOB__c, Email__c,Expected_Salary__c,First_Name__c, Last_Name__c,Name__c,Name,Country__c,State__c,Status__c,Application_Date__c from Candidate_Vikas__c  where Id=:id];
    }

    public PageReference save() {
        
        try{
                upsert(candidate);
         }
         catch(System.DMLexception e){
         
             ApexPages.addMessages(e);
             return null;
         }
         
         PageReference pr= new ApexPages.standardController(candidate).view();
         return pr;
     }
     }