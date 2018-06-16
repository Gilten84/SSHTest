@isTest
public class ParkLocatorTest {
     @isTest static void testCallout() 
     { 
		List<String> japanparks= new List<String> {'Shiretoko National Park', 'Oze National Park', 'Hakusan National Park'};
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
       	String country = 'Japan';
        List<String> result = ParkLocator.country(country);
        System.assertEquals(japanparks, result); 
     }
}