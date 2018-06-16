public class AnimalLocator {
    
    public static String getAnimalNameById(Integer num)
    {
        HTTP http = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
     	if (response.getStatusCode() == 200) {
            
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           Map<String,Object> animal = (Map<String, Object>) results.get('animal');
           String name = (String) animal.get('name');  
           System.debug(name);
           return name;
           
        } else
        {
            return 'Horrible Error';
                
        }
         
    }

}