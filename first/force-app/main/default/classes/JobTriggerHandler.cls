public class JobTriggerHandler {
    
    public static void checkActive(List<Job_Vikas__c> lstJob) {
        for(Job_Vikas__c job:lstJob) {
            if(job.Active1__c) {
                job.addError('This Job is active and can not be deleted');
            }
        }
    }
    
    public static void deActivateJob(List<Job_Vikas__c> lstJob) {       
		for(Job_Vikas__c job : lstJob) {
            if(job.Hired_Applicants__c >= job.Number_of_Positions__c ) {
            		job.Active1__c= false;                	
            }           
        }      
    }

    
    public static void sendEmail(List<Job_Vikas__c> lstJob) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for(Job_Vikas__c job : lstJob) {
            if(job.Hired_Applicants__c == job.Number_of_Positions__c) {
                
                            
               Contact con = [SELECT Manager_Email__c,id,Name FROM Contact 
                               WHERE id=:job.Manager1__c];                
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
      			sendTo.add(con.Manager_Email__c);
                mail.setToAddresses(sendTo);
                //mail.setReplyTo('vmgabhane.vg@gmail.com');
                mail.setSubject('Reached Vaccancy Limit!..');
      			String body = 'All required candidate has been hired for this job on '+ job.LastModifiedDate;     
      			mail.setHtmlBody(body);
                mails.add(mail);	
            }
            Messaging.sendEmail(mails);

        }
    }
    
    public static void updateStausOnNoOfPositionUpdate(List<Job_Vikas__c> lstJob) {
        
        for(Job_Vikas__c job : lstJob) {
            if(job.Hired_Applicants__c < job.Number_of_Positions__c) {
                job.Active1__c = true;
                
            }
        }
        
    }

}