public class AccountProcessor {
    /* 
     * Create a field on the Account object called 'Number_of_Contacts__c' of type Number. 
     * This field will hold the total number of Contacts for the Account. 
     * Create an Apex class called 'AccountProcessor' that contains a 'countContacts'
     *  method that accepts a List of Account IDs. 
     * This method must use the @future annotation.
     * For each Account ID passed to the method, count the number of Contact records 
     * associated to it and update the 'Number_of_Contacts__c' field with this value.
     * Create an Apex test class called 'AccountProcessorTest'.
     * The unit tests must cover all lines of code included in the 
     * AccountProcessor class, resulting in 100% code coverage.
     * Run your test class at least once (via 'Run All' tests the Developer Console) 
before attempting to verify this challenge. */
    @future 
    public static void countContacts (List<ID> ids)
    {
    	   List<Account> accsWithContacts = [SELECT Id, (SELECT Id FROM Contacts)
                                          FROM Account WHERE Id IN :ids];
        	List<Account> updatedAccounts = new List<Account>();
        	for (Account acc : accsWithContacts)
            {
                Account accForUpdate = acc;
                accForUpdate.Number_of_Contacts__c=acc.Contacts.size();
                updatedAccounts.add(accForUpdate);
            }
        	update updatedAccounts;
		
        
        	
     
			
        
    }

}