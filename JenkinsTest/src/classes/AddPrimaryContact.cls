public class AddPrimaryContact implements Queueable {
    private Contact cont;
    private String st;
    public AddPrimaryContact(Contact cont, String st)
    {
        this.cont=cont;
        this.st=st;
    }
    public void execute(QueueableContext context)
    {
     	List<Account> accountList = [Select Id FROM Account WHERE BillingState=:st LIMIT 200];
        List<Contact> updatedContacts = new List<Contact>();
        for (Account acc : accountList)
        {
            Contact newCont = cont.clone(false, true, false, false);
            newCont.AccountID = acc.Id; 
            updatedContacts.add(newCont);
        }
        insert updatedContacts;
        
    }
    //Account acc = new account(Name = 'Acme', Description = 'Acme Account');
    //Account clonedAcc = acc.clone(false, false, false, false);
    //System.assertEquals(acc, clonedAcc);

}