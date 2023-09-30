public class Contacthandler {
    
     public static void insertaccount(List<Contact> con)
    {
        map<id,Account> acc=new map<id,Account>();
        for(contact con1:con)
        {
            acc.put(con1.id,new Account(name=con1.LastName,phone=con1.Phone));
        }
        insert acc.values();
        for(Contact con2:con)
        {
           con2.Accountid= acc.get(con2.id).id;
        }
    }
    public static void updateaccount1(List<Contact> con)
    {
        Set<id> ids = new set<id>();
        List<Account> accnt = new List<Account>();
        
        for(contact con1:con)
        {
           ids.add(con1.AccountId); 
        }
        
        List<account> acclist = [Select id,name,(select id from contacts) from account where id in :ids];
        List<Aggregateresult> acclist1 = [select count(id) from contact where Accountid in :ids group by Accountid];
        for(Account acc:acclist)
        {
            acc.total_contacts__c=acc.contacts.size();
            accnt.add(acc);
        }
        
        
        update accnt;
    }
    public static void updateafter(List<Contact> con)
    { 
        Set<String> conAcc=new Set<String>();
        List<Account> accnt = new List<Account>();
        
        for(Contact con1:con)
        {  
            conAcc.add(con1.AccountId); 
            
        }
        
        Map<Id,Account> mapAccount = new Map<Id,Account>([ select id,name,Rating from Account where id in :conAcc ] ); 
        
        
        for(Contact con1: con) 
        {
            Account acc = mapAccount.get(con1.AccountId); 
            if( con1.AccountId != null && mapAccount.containsKey(con1.AccountId) && con1.Phone == null ) 
            {		
                acc.Rating='Cold'; 
                Email(con1.Email,con1.Id);
            }
            else
            {
                acc.rating='Hot';
            }
            accnt.add(acc);
        }
        database.SaveResult[] sr = database.update(accnt, false);
        for(Database.SaveResult var:sr)
        {
            System.debug(var.isSuccess());
        }
    }  
    
    Public static void Email(String emailid,Id rid)  
    {
        
        Messaging.SingleEmailMessage singlemail =new Messaging.SingleEmailMessage();
        Singlemail.setTargetObjectId(rid);
        singlemail.setHtmlBody('Hey Kamesh');
        Singlemail.setTreatTargetObjectAsRecipient(true);
        List<String> emailid1 =new List<String>();
        emailid1.add(emailid);
        Singlemail.setToAddresses(emailid1);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {singlemail});
        
    }
    
    public static void updateaccount(List<contact> con)
    {
        
        Set<String> accid = new Set<String>();
        for(Contact con1:con)
        {
            accid.add(con1.AccountId);
        }
        List<Account> acnt = new List<Account>();
        Map<Id,Account> Mapaccount = new Map<Id,Account>([Select Id,Name,Rating from Account where Id in:accid]);
        for(Contact con1:con)
        {
            Account acc = mapAccount.get(con1.AccountId);
            if(con1.AccountId != null && mapAccount.containsKey(con1.AccountId) && con1.Phone == null && con1.Email!=null)
            {
               // accountTriggerHandlerclass.accountupdate(acc.Id,'cold');
               acc.rating='cold';
                acnt.add(acc);
                System.assert(con1.Email!=null, 'msg');
               // con1.clear();
               //con1.adderror('error kamesh',true);
                Email(con1.Email,con1.Id);
            }
            else if(con1.AccountId != null && mapAccount.containsKey(con1.AccountId) && con1.Phone != null && con1.Email!=null)
            {
                //accountTriggerHandlerclass.accountupdate(acc.ID,'Hot');
                acc.rating='Hot';
                acnt.add(acc);
            }
        }
        update acnt;
    }
    
}