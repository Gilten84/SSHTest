@isTest
public class AnimalLocatorTest {
    
    @isTest 
    static void testPostCallout() {
        
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    String testName = AnimalLocator.getAnimalNameById(1); 
    System.assertEquals(testName, 'chicken');
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMockFailed()); 
    testName = AnimalLocator.getAnimalNameById(0); 
    System.assertEquals(testName, 'Horrible Error');
  
}
    

}