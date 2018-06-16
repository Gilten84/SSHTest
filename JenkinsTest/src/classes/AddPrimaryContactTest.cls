@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup()
    {
        
        List<Account> testAccList = new List<Account>();
        for (Integer i = 0; i<50; i++)
        {
            testAccList.add(new Account(Name='Tester'+i, BillingState='NY'));
        }
        
        for (Integer i = 0; i<50; i++)
        {
            testAccList.add(new Account(Name='Tester'+i+'a', BillingState='CA'));
        }
        insert testAccList;
    }
    
    static testmethod void testQueueable()
    {
        Contact primary = new Contact(LastName='PrimaryContact');
   		AddPrimaryContact apc = new AddPrimaryContact(primary, 'NY'); 
        AddPrimaryContact apc2 = new AddPrimaryContact(primary, 'CA');
        Test.startTest();
        System.enqueueJob(apc);
        System.enqueueJob(apc2);
        Test.stopTest();
        System.assertEquals(50, [SELECT count() from contact where LastName='PrimaryContact' AND Account.BillingState='NY' ]);
        System.assertEquals(50, [SELECT count() from contact where LastName='PrimaryContact' AND Account.BillingState='CA']);
    }

}