public class accountTriggerHandlerclass {
    
    public static void updatetotalcontacts(Map<Id,Account> newmap,Map<Id,Account> oldmap)
    {
        Set<id> Acid = new Set<id>();
        List<task> tsk = new List<task>();
        for(Account acnt:newmap.values() )
        {
             System.debug('Accountbayata unna');
            if(acnt.AccountSource!=oldmap.get(acnt.Id).AccountSource && acnt.AccountSource=='Phone Inquiry')
            {
                Acid.add(acnt.id);
                System.debug('Accountlo unna');
            }
        }
        
        for(id aid:acid)
        {
            task tt= new task();
            tt.WhatId=aid;
            tt.Subject='call';
            tsk.add(tt);
            System.debug('tasklo unna');
        }
        if(tsk.size()>0)
        {
           insert tsk; 
        }
        
    }
    
     public class Request {
        @InvocableVariable
        public List<string> acc;

    }
     @invocableMethod
    public static List<string> Convertstringtocollection()
    {
       Request rq = new Request();
        List<string> acc1= new List<string>();
        acc1.add('Kamesh');
        acc1.add('Kartik');
        rq.acc=acc1;
       
        return rq.acc;
    }
    public static void insertAccount(List<Account> acc)
    {
        for(Account acnt:acc)
        {
           if(acnt.Phone!=null)
           {
               acnt.Rating='Hot';
           }
            else
            {
                acnt.Rating='Warm';
            }
            
        }
        
    }
    public static void updateaccount(List<Account> ant)
    {
        for(Account acc:ant)
        {
            if(acc.Phone!=null)
            {
                acc.Rating='Cold';
            }
            else
            {
                acc.Rating='';
            }
        }
        
    }
    public static void accountupdate(ID rid,string rating)
    {
        List<Account> acc2=new List<Account>();
       List<account> acc = new List<account>([Select Id,name,Rating from account where id =:rid]);
        for(Account acc1:acc)
        {
            acc1.Rating=rating;
            acc2.add(acc1);
        }
        update acc2;
    }
    public static void accountmap()
    {
        List<Account> acc=new List<Account>();
        Map<id,Account> accmap = new map<id,Account>();
        
        for(Account aa:[Select id,name from Account limit 5])
        {
            accmap.put(aa.id,aa);
        }
        
        for(id aaa:accmap.keyset())
        {
            System.debug(accmap.get(aaa));
            System.debug(aaa);
        }
    } 
     public static void accountmap2()
    {
        List<Account> acc=new List<Account>([Select id,name,(Select id,name from contacts) from Account limit 5]);
        Map<id,Account> accmap = new map<id,Account>([Select id,name from Account limit 5]);
        List<Account> acc1= [Select id,name from account];
        Set<id> idset=new Set<id>();
       
        for(Account anc:acc)
        {
            if(acc1.contains(anc))
            {
                
            }
            System.debug(anc.name+'Contact size is'+anc.Contacts.size());
        }
        
       
        for(id aaa:accmap.keyset())
        {
            System.debug(accmap.get(aaa));
        }
        
        for(Account aid:acc)
        {
            idset.add(aid.id);
        }
        
        for(id i: idset)
        {
            if(idset.contains(i))
            {
                System.debug(i+' is present');
            }
        }
            
    }
    public static void accountdup(List<Account> lst)
    {
        
    }

}