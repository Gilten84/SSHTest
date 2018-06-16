public class StringArrayTest
{

	public static List<String> generateStringArray(Integer num)
	{
		List<String> testlist = new List<String>();
		for (Integer i=0; i<num; i++)
		{
			testlist.add('Test '+i);
		}
		return testlist;
	}

}