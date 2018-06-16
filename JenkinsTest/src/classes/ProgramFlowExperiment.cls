public class ProgramFlowExperiment {

	public static Integer emailCounter=0;
	private void sendEmail()
	{
		emailCounter++;
		system.debug('Queueing email');
	}

	private void sendQueuedEmail()
	{
		system.debug('Sending queued email');
	}
	private static Set<ID> alreadyProcessedList = null;
    public void handleContactUpdateTrigger(List<Contact> newlist, Map<ID,Contact> oldmap)
    {
    	if (alreadyProcessedList==null) alreadyProcessedList = new Set<ID>();
    	for (Contact c : newlist)
    	{
    		if (alreadyProcessedList.contains(c.ID)) continue;
    		if (c.ownerID!=oldmap.get(c.ID).ownerID)
    		{
    			sendEmail();
    			alreadyProcessedList.add(c.ID);
    		}
    	}
    	sendQueuedEmail();

    }
}