@istest
private class contactHandlerTest {
    @istest
    static void accounttest()
    {
        Account acc = new Account();
        acc.Name='Kamesh';
        insert acc;
        Contact con =new Contact();
        con.LastName = 'Kamesh';
        con.Phone = '9090909' ;
        con.Email='kamesh2711@gmail.com';
        con.AccountId =acc.Id;        
        // Insert book
        insert con;  
        System.assertEquals('9090909', con.Phone);
        
        con=[Select Id,name,Accountid from contact where id=:con.Id];     
        accountTriggerHandlerclass.accountupdate(con.AccountId,'cold');
        accountTriggerHandlerclass.accountupdate(con.AccountId,'Hot');
        con.phone = null;
        update con;
        
    }
    
}