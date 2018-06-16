@isTest
private class TestAccountOwnerChange {

    static testMethod void TestOwnerChange() {
	//create test contacts and test user
		List<Contact> newcontactlist = initTestContacts ('c', 5);
		User u = initTestUser('myname','myname');
		System.runAs(u)
		{
			//this contacts will be created with a fake user as owner
			insert newcontactlist;
		}
		Test.StartTest();
		for (Contact c: newcontactlist)
		{
			c.ownerID = UserInfo.getUserID();
			c.email='someone@somethere.com';
		}

		update newcontactlist;
		Test.StopTest();

		System.debug(newcontactlist.size()+' '+ProgramFlowExperiment.emailCounter);
		System.assertEquals(newcontactlist.size(),ProgramFlowExperiment.emailCounter);

    }

    public static List<Contact> initTestContacts (String prefix, Integer count)
    {
    	List<Contact> results = new List<Contact>();
    	for (Integer x=1; x<count; x++)
    	{
    		results.add(new Contact(LastName = prefix + '_'+String.valueOf(x), email = prefix +'_'+String.valueOf(x)+'@apextest.com'));
    	}
    	return results;
    }

    public static User initTestUser(String username, String alias)
    {
		User u = new User(Alias = alias,
		Email = username+'@apextest.com', EmailEncodingKey='UTF-8',
		FirstName='Joe', LastName=username,
		TimeZoneSidKey = 'America/Los_Angeles',
		UserName = username + '@apextest.com',
		UserPermissionsMarketingUser=true,
		LocaleSidKey='en_US',
		LanguageLocaleKey='en_US');
		u.ProfileID = userinfo.getProfileId();
		return u;
    }
}