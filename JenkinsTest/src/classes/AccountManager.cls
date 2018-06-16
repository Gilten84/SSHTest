@RestResource(urlMapping='/Account/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String[] splitURI = request.requestURI.split('/');
        String accountID = splitURI[splitURI.size()-2];
       	System.debug(accountId);
        Account acc = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts) FROM Account WHERE Id = :accountId];
        return acc;
    }

}