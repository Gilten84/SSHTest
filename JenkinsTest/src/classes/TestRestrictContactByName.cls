@isTest
private class TestRestrictContactByName {

    static testMethod void badContactTest() {
		Contact cont = new Contact(LastName='INVALIDNAME');
		Test.startTest();
		Database.SaveResult result = Database.insert(cont,false);
		Test.stopTest();
		System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());

    }

    static testMethod void goodContactTest() {
    	Contact cont = new Contact(LastName='TTTTTTTTTTTTTTT');
		Test.startTest();
		Database.SaveResult result = Database.insert(cont,false);
		Test.stopTest();
		System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);


    }
}