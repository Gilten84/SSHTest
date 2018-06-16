public class ContactSearch {
	public static List<Contact> searchForContacts(String lname, String mail)
	{
		List<Contact> contlist = [SELECT Id, Name FROM Contact WHERE LastName=:lname AND MailingPostalCode=:mail];
		return contlist;
	}
}