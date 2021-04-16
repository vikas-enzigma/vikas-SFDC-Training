public class ViewJobController {

    
	public Boolean rend { get; set; }
    public Boolean rend1 { get; set; }
    
    public List<sObject> records{get; set;}
    public List<Candidate_Vikas__c> candidateRecords{get; set;}
    public List<String> fields{get; set;}
    public List<String> candidateFields{get; set;}
    
    public List<Job_Vikas__c> job{get; set;}
    
    
    
    public ViewJobController(){
       
        rend=false;
        rend1=false;
        
       
        Id id= ApexPages.currentPage().getParameters().get('id');
       
        //Id id=selectedJob; //[select id from Job_Vikas__c where Job_Type__c=:selectedJob];
        
       
          
    }
    
    public void getData(){
        rend1=true;
        rend=false;
        
         records=[select Name, Job_Type__c,  Number_of_Positions__c, Qualification_Required__c, Required_Skills__c,
                    Salary_Offered__c, Certification_Required__c, Manager1__c  from Job_Vikas__c where id=:selectedJob];
             
        
       
        fields= new List<String>{'Name', 'Job_Type__c',  'Number_of_Positions__c', 'Qualification_Required__c', 'Required_Skills__c',
                    'Salary_Offered__c', 'Certification_Required__c', 'Manager1__c'};
                        
                       
        
        
    }
    
    public PageReference searchFunction() {
        rend=true;
         job= [select Job_Type__c from Job_Vikas__c where id=:selectedJob ];
        
        candidateRecords=[select First_Name__c, Last_Name__c, Email__c, Status__c, Name__c,Job_Type__c  from Candidate_Vikas__c where Name__c=:job];
        
        return null;
    }
    
            //
    public String selectedJob{get;set;}
    public List<Job_Vikas__c> jt{get; set;}
 
     
    public List<SelectOption> getJobOptions() {
        List<SelectOption> jobOptions = new List<SelectOption>();
        jt=[select Job_Type__c,id from Job_Vikas__c];

        jobOptions.add(new SelectOption('','-None-'));
        for(Job_Vikas__c j:jt)
        {
              jobOptions.add(new SelectOption(j.id, j.Job_Type__c));

        }
 
        return jobOptions;
    }
    
   }