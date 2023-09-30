@isTest
public class accountTriggerHandlerclassTest {
    static testMethod void accounttest()
    {
      Account acc=new Account();
    acc.Name ='Kamesh';
    insert acc;  
        acc.Name='Kamesh1';
        update acc;
        acc.Phone ='1234';
        update acc;
        Account acnt=new Account();
        acnt.Phone ='1234567';
        acnt.Name ='Lavanya';
        insert acnt;
    }  
    

}