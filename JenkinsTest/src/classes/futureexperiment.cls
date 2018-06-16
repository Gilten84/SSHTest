public with sharing class futureexperiment {
	@future
	public static void test1 ()
	{
		system.debug('in future call');
	}
	public static Boolean futuresent=false;

	public static void test2 ()
	{
		if (system.isFuture()||system.isBatch()) { test2sync(); return;}
		if (futuresent) return;
		futuresent=true;
		test2future();
	}

	@future
	public static void test2future ()
	{
		test2sync();
	}

	public static void test2sync()
	{
		system.debug('in sync call');
	}

}