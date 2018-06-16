global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext ctx)
	{
		List<Lead> leadList = [SELECT Id, LeadSource FROM Lead WHERE LeadSource='' LIMIT 200];
		List<Lead> updatedLeads = new List<Lead>();
		for (Lead l : leadList)
		{
			l.LeadSource='Dreamforce';
			updatedLeads.add(l);
		}
	}

}