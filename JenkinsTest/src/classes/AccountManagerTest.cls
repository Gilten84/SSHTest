@isTest
private class AccountManagerTest 
{
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na59.lightning.force.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('TestRecord', thisAccount.Name);
        System.assertEquals('TestCont', thisAccount.contacts[0].LastName);
    }
    
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(
            Name='TestRecord');  
        insert accountTest;
        Contact contactTest = new Contact(LastName='TestCont', AccountId=accountTest.id);
        insert contactTest;
        return accountTest.Id;
    }     
	
}