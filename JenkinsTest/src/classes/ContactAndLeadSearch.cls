public class ContactAndLeadSearch {

	public static List<List< SObject>> searchContactsAndLeads(String toFind)
	{
		List<List< SObject>> searchResults = [FIND :toFind IN NAME FIELDS RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
		return searchResults;
	}

}