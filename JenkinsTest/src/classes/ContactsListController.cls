public class ContactsListController {

	private String sortorder = 'LastName';

	public List<Contact> getContacts() {
		List<Contact> results = Database.query('SELECT Id, FirstName, LastName, Title, Email '+
		'FROM Contact ' +
		'ORDER BY ' +sortorder+' ASC ' +
		'LIMIT 10');
		return results;
	}
	public void sortByLastName() {
    this.sortOrder = 'LastName';
	}

	public void sortByFirstName() {
	    this.sortOrder = 'FirstName';
	}


}