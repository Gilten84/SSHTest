@isTest
public class LeadProcessorTest {
    
    @testSetup
    static void setup()
    {
        List<Lead> testLeads = new List<Lead>();
        for (Integer i=0; i<200; i++)
        {
            testLeads.add(new Lead(FirstName = 'Tester'+i, LastName = 'Testerman'+i, Company = 'TestComp'+i, MobilePhone='55555555555',
                          Status='Working - Contacted'));
        }
        insert testLeads;
    }
    
    @isTest
    static void test()
    {
        Test.startTest();
        LeadProcessor lp = new Leadprocessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();
        System.assertEquals(200, [select count() from lead where MobilePhone = '55555555555']);
    }

}