@isTest
private class CandidateTriggerTest {
    static List<Candidate_Vikas__c> lstTestCandidate = new List<Candidate_Vikas__c>();
    // Create  Candidates data for test class
    @testSetup static void setup() {
        
        // insert multiple candiates to test
        
        for(Integer i=0;i<20;i++) {
            lstTestCandidate.add(new Candidate_Vikas__c(Name = 'testCandidate'+i, First_Name__c='testFirst'+i,
                                                        Last_Name__c='testLast'+i,Status__c='Applied',Expected_Salary__c=0,
                                                        Name__c='a035g000000yGII'));
        }
        insert lstTestCandidate;        
        
    }
    
    // test method to check Expected Salary field
    static testMethod void testExpectedSalary(){
        
        
        try{
            List<Candidate_Vikas__c> candList= [SELECT Expected_Salary__c FROM Candidate_Vikas__c Where Expected_Salary__c=0];
            
            System.assertEquals(20,candList.size());
        }
        catch(Exception e)
        {
            String message = e.getMessage();
            System.assert(message.contains('Insert failed.'));
            System.assert(message.contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
            system.assert(message.contains('Expected Salary field is missing'));
        }
        
        
        
    }
    //test method to check weather job is active or not before applying
    static testMethod void testActiveJobToApply(){
        
        
        Job_Vikas__c job = new Job_Vikas__c();
        job.Name='testJob';
        job.Active1__c=true;
        job.Job_Type__c='Developer';
        job.Number_of_Positions__c=4;
        // insert jn;
        Candidate_Vikas__c cn1=new Candidate_Vikas__c();
        List<Candidate_Vikas__c> cnList1 =new List<Candidate_Vikas__c>();
        cn1.name='Paresh';
        cn1.Name__c=job.id;
        cnList1.add(cn1);
        
        Test.startTest();
        Database.SaveResult[] sr = Database.insert(cnList1,false);
        Test.stopTest();
        try{
            System.assertEquals(1,sr.size());
        }
        catch(DmlException e)
        {
            String message = e.getMessage();
            System.assert(message.contains('Insert failed.'));
            System.assert(message.contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
            system.assert(message.contains('This Job is not active. You can not apply for this job'));
        }
    }
    
    /*static testMethod void checkApplicationDateForUpdate(){

Candidate_Vikas__c candidate = new Candidate_Vikas__c();
candidate.Name='testCandidate';
candidate.First_Name__c='testFirst';
candidate.Last_Name__c='testLast';
candidate.Status__c='Applied';
candidate.Expected_Salary__c=676;
candidate.Name__c='a035g000000yFBy';
candidate.Application_Date__c=system.today();   

Test.startTest();
candidate.Application_Date__c=candidate.CreatedDate.date();   
update candidate;
Test.stopTest();
List<Candidate_Vikas__c> lstCandidate = [SELECT id,Name,First_Name__c,Last_Name__c ,CreatedDate, Status__c,Expected_Salary__c,Application_Date__c
FROM Candidate_Vikas__c WHERE id = :candidate.id AND Application_Date__c=:candidate.CreatedDate.date()];
system.assertEquals(1,lstCandidate.size());
}

static testMethod void checkApplicationDate(){
Test.startTest();
Candidate_Vikas__c candidate = new Candidate_Vikas__c();
candidate.Name='testCandidate';
candidate.First_Name__c='testFirst';
candidate.Last_Name__c='testLast';
candidate.Status__c='Applied';
candidate.Expected_Salary__c=676;
candidate.Name__c='a035g000000yFBy';
candidate.Application_Date__c=system.today();

insert candidate;
Test.stopTest();
List<Candidate_Vikas__c> lstCandidate = [SELECT id,Name,First_Name__c,Last_Name__c ,CreatedDate, Status__c,Expected_Salary__c,Application_Date__c
FROM Candidate_Vikas__c WHERE id = :candidate.id AND Application_Date__c=:system.today() ];
system.assertEquals(1,lstCandidate.size());
}*/
}