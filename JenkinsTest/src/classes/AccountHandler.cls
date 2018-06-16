public class AccountHandler {

	public static Account insertNewAccount(String newName)
	{
		Account acc = new Account(Name=newName);
		try
		{
			insert acc;
            System.debug(acc.ID);
		}
		catch (DMLException e)
		{
			System.debug('Error: '+e.getMessage());
			return null;
		}
		return acc;
	}

}