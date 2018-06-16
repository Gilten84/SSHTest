@isTest 
public class MassUpdateTest {
    
   @isTest
   static void testMassUpdateController() {
     
       Account testAccount = new Account();
       testAccount.Name='Test Account';
       insert testAccount;
       List<Contact> testContacts = new List<Contact>();
       for (Integer i=0; i<102; i++) {
           Contact c = new Contact(FirstName='TestName' + i, LastName = 'S', AccountId = testAccount.Id);
           testContacts.add(c);
       }
     
       insert testContacts;
     
       Test.StartTest();
       
       PageReference pageRef = Page.PaginationSample;
       pageRef.getParameters().put('id', String.valueOf(testAccount.Id));
       Test.setCurrentPage(pageRef);
       ApexPages.StandardController standardController = new ApexPages.StandardController(testAccount);
       System.debug(testAccount.id);
       Pagenation1Controller extensionController = new Pagenation1Controller(standardController);
       System.assertEquals(10, extensionController.getContacts().size());
       pageRef.getParameters().put('recordsPerPage', '20');
       extensionController.recordsPerPage = 20;
       extensionController.updatePage();
       System.assertEquals(20, extensionController.getContacts().size());
       System.assert(!extensionController.getNext());
       System.assert(extensionController.getPrevious());
       extensionController.toNextPage();
       System.assertEquals('TestName20 S', extensionController.getContacts()[0].Name);
       extensionController.toPreviousPage();
       System.assertEquals('TestName0 S', extensionController.getContacts()[0].Name);
       extensionController.toLastPage();
       System.assertEquals(2, extensionController.getContacts().size());
       System.assert(extensionController.getNext());
       System.assert(!extensionController.getPrevious());
       extensionController.toFirstPage();
       System.assertEquals(20, extensionController.getContacts().size());
       extensionController.contacts[0].Title = 'HR';
       extensionController.saveContacts();
       extensionController.contacts[0].FirstName = null;
       extensionController.contacts[0].LastName = null;
       extensionController.saveContacts();
       List<Contact> con = [Select Id, Title FROM Contact Where Title='HR'];
       System.assertEquals(1, con.size());
       System.assertNotEquals(pageRef, extensionController.cancel());
       
       Test.StopTest();
   }
}