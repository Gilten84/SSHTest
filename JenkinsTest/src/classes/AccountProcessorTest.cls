@isTest
private class AccountProcessorTest {
    
    @isTest private static void countContacts()
    {
        
        List<Id> ids = TestDataFactory.createAccountsWithConts(3,3);
        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();
        
    }

}