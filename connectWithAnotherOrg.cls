public class connectWithAnotherOrg {
    
    public static String getaccount()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SfdcB/services/apexrest/getAccount');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200)
        {
            
            List<object> result = (List<object>)Json.deserializeUntyped(response.getBody());
            for(object acc:result)
            {
                Map<String,Object> accprop = (Map<String,Object>) acc;
                System.debug(accprop.get('Name')+'Rating'+accprop.get('Rating')); 
            }
            System.debug(response.getBody());
            return response.getBody();
        }
        return response.getBody();
    }
    
    
    public static void createAccountinOrgB()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SfdcB/services/apexrest/getAccount');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset-UTF-8');
        request.setBody('{"Name": "Account from salesforce org A","Rating":"Cold"}');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200)
        {
            
            System.debug(response.getBody());
        }
        
    }
    
    
}