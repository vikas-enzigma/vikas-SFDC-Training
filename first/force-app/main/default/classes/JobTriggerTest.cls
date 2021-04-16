@isTest
private class JobTriggerTest {
    
    static testMethod void checkActiveJobStatus(){
        Test.startTest();
        Job_Vikas__C job = new Job_Vikas__c();
        job.Name='testJob';
        job.Active1__c=true;
        job.Job_Type__c='Developer';
        job.Number_of_Positions__c=4;
        insert job;
        Test.stopTest();
        
        List<Job_Vikas__c> lstJob=[SELECT id,Active1__c FROM Job_Vikas__c where id=:job.Id AND Active1__c=:true];
        system.assertEquals(1, lstJob.size());
        
        /*try{
            //if(job.Active1__c==false){
                delete job;
                system.debug('in try');
            //}
        }catch(DMLException e){
            //e.getStackTraceString();
            //system.assert(job.Active1__c==true, 'cant delete status is active');
            system.debug('in catch');
        }*/
    }
    
}