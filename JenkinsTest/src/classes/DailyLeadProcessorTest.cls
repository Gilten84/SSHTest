@isTest
public class DailyLeadProcessorTest {
    public static String testCRON = '0 0 0 15 1 ? 2019';
    public static List<ID> idsLeads = new List<ID>(); 
    @testSetup
    static void setup()
    {
        List<Lead> testLeads = new List<Lead>();
        for (Integer i=0; i<200; i++)
        {
            Lead l = new Lead(FirstName = 'Tester'+i, LastName = 'Testerman'+i, Company = 'TestComp'+i, MobilePhone='55555555555',
                          Status='Working - Contacted');
            testLeads.add(l);
            idsLeads.add(l.ID);
        }
        insert testLeads;
    }
    static testmethod void testScheduledJob() 
    {
    	Test.startTest();
        String jobID = System.schedule('Creation of default lead source', testCRON, new DailyLeadProcessor());
        List<Task> lt = [SELECT Id 
            FROM Task 
            WHERE WhatId IN :idsLeads];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        Test.stopTest();
        lt = [SELECT Id 
            FROM Task 
            WHERE WhatId IN :idsLeads];
        System.assertEquals(idsLeads.size(), 
            lt.size(), 
            'Tasks were not created');
    }


}