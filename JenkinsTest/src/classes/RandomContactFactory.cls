public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lName)
    {
    	List<Contact> contactList = new List<Contact>();
        for (Integer i=0; i<numOfContacts; i++)
        {
        	contactList.add(new Contact(LastName=lname, FirstName=lname+i));
        }
        return contactList;

    }
}