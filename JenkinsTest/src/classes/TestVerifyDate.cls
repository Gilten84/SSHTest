@isTest
private class TestVerifyDate {
	private static Date startDate = Date.newInstance(2000,1,1);

    static testMethod void within30daysTest() {
        Date testDate = Date.newInstance(2000,1,15);
        Date resultDate = VerifyDate.CheckDates(startDate,testDate);
        System.assertEquals(testDate, resultDate,'date within 30 days');


    }

    static testMethod void after30daysTest() {
    	Date testDate = Date.newInstance(2000,2,1);
        Date awaitedDate = Date.newInstance(2000,1,31);
        Date resultDate = VerifyDate.CheckDates(startDate, testDate);
        System.assertEquals(awaitedDate, resultDate,'after within 30 days');


    }

    static testMethod void beforeStartDateTest() {
        Date testDate = Date.newInstance(1999,12,1);
        Date awaitedDate = Date.newInstance(2000,1,31);
        Date resultDate = VerifyDate.CheckDates(startDate, testDate);
        System.assertEquals(awaitedDate, resultDate,'after within 30 days');

    }
}