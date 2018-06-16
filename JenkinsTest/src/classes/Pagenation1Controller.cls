public with sharing class Pagenation1Controller {

    public Integer recordsPerPage { get; set; }
    public Integer totalRecords { get; set; }
    public Id currentAccId;
    public Account currentAcc;
    public Integer counter = 0;
    public List<Contact> contacts = new List<Contact>();
    public ApexPages.StandardSetController setCon {
        get {
                
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Title, Email, HasOptedOutOfEmail, Birthdate FROM Contact Where AccountId=:currentAccId]));           
            setCon.setPageSize(recordsPerPage);
            return setCon;
        }
        set;
    }
    
    public Pagenation1Controller (ApexPages.StandardSetController controller) {
        
        currentAccId = apexpages.currentpage().getparameters().get('id');
        recordsPerPage=10;
        setCon = controller;
        setCon.setPageSize(recordsPerPage);
        
        
    }
    
   
	public List<Contact> getContacts() {
       return (List<Contact>) setCon.getRecords();
    }

    public PageReference updatePage() {
        
        return null;
    }
    
    
}