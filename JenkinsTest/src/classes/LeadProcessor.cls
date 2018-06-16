global class LeadProcessor implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
 	
    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
        List<Lead> updatedLeads = new List<Lead>();
        for(Lead l : scope)
        {
            l.LeadSource='Dreamforce';
         	updatedLeads.add(l);
        }
        update updatedLeads;
    }
    
    global void finish(Database.BatchableContext bc)
    {
    }

}