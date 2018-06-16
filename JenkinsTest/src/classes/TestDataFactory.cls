@isTest
public class TestDataFactory {
	//test utility class example
    public static List<Id> createAccountsWithConts(Integer numAccts, Integer numConsPerAcct) {
        List<Account> accts = new List<Account>();

        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;

        List<Contact> cons = new List<Contact>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add contacts
            for (Integer k=0;k<numConsPerAcct;k++) {
                cons.add(new Contact(FirstName=acct.Name + ' Contact ' + k, LastName = acct.Name + ' Surn ' + k,
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        
        insert cons;
        
        List<ID> ids = new List<ID>();
        for (Account acc : accts)
        {
            ids.add(acc.Id);
        }

        return ids;
    }
}