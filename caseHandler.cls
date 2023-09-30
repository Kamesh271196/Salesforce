public class caseHandler {
    public static void updateAccount(List<Case> cs)
    {
        
        
        Set<id> accid = new Set<id>();
        for(Case con:cs)
        {
           if(!accid.contains(con.AccountId))
           {
               accid.add(con.AccountId);
           }
            
            
        }
       
        map<id,Account> acc= new map<id,Account>([Select id,name from account where id in:accid]);
        Aggregateresult[] accmap = [select Accountid,count(id),status from case where Accountid in:accid group by status,Accountid ];
      //  Aggregateresult[] agg = [Select count(id),Account.totalopencase__c from case group by Account.totalopencase__c ];
        map<id,Account> acc3 = new map<id,Account>();
        for(Aggregateresult con1:accmap)
        {
            Account acc1 = acc.get((id)con1.get('Accountid'));
            if(con1.get('Status')=='Closed')
            {
                acc1.Totalclosecase__c=(Integer)con1.get('expr0');  
                
            }
            else
            {
                acc1.totalopencases__c=(Integer)con1.get('expr0');
               
            }
            if(acc3.containskey(acc1.id))
            {
                Account acc25 = acc3.get(acc1.id);
                acc25.Totalclosecase__c = (Integer)con1.get('expr0');
                acc25.totalopencases__c = (Integer)con1.get('expr0');
            }
            else
            {
                 acc3.put(acc1.id,acc1);
            }
            
        }
        update acc3.values();
        
        
        
        
    }
    
}