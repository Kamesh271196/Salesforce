@RestResource(urlMapping='/showAccounts/*')
global class testIntegrationRest {
    
    /*
    @Httpget
    global static List<Account> getaccount()
    {
        List<Account> lst;
            try
        {
           lst =[Select Id,name,Rating from account limit 20];
            return lst;
        }
        catch(Exception ex)
        {
            System.debug('error is :'+ ex.getmessage());
        }
        return lst;
    }  */
    
    @Httpget
    global static List<Account> getaccount1()
    {
        RestResponse res =RestContext.response;
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        System.debug(accountId);
        List<Account> result =[Select Id,name,phone from Account where ID=:accountId];
        return result;        
        
    }
    
    @HttpPost
      global static Account setaccount(String name,String phone)
    {
        Account acc = new Account();
        acc.name =name;
        acc.Phone = phone;
        insert acc;
        return acc;
        
    }
     @HttpDelete
      global static void dodelete()
    {
        RestResponse res =RestContext.response;
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        System.debug(accountId);
        List<Account> result =[Select Id,name,phone from Account where ID=:accountId];
        delete result;
    }
    
    
}