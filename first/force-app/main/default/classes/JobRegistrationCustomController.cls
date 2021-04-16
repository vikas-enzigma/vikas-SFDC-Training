public class JobRegistrationCustomController {

    public Job_Vikas__c job { get; private set; }
    
    public JobRegistrationCustomController (){
    
        Id id =ApexPages.currentPage().getParameters().get('id');
        job= (id==null)?new Job_Vikas__c():[select Name, Job_Type__c, Manager1__c, Number_of_Positions__c, Required_Skills__c, Salary_Offered__c, Certification_Required__c, Qualification_Required__c from Job_Vikas__c  where Id=:id];
    }

    public PageReference save() {
        
        try{
                upsert(job);
         }
         catch(System.DMLexception e){
         
             ApexPages.addMessages(e);
             return null;
         }
         
         PageReference pr= new ApexPages.standardController(job).view();
         return pr;

    }

}