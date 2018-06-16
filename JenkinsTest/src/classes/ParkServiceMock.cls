@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
           List<String> japanparks= new List<String> {'Shiretoko National Park', 'Oze National Park', 'Hakusan National Park'}; 
        ParkService.byCountryResponse response_x = 
            new ParkService.byCountryResponse();
               response_x.return_x=japanparks;
        // end
        response.put('response_x', response_x); 
   }
}