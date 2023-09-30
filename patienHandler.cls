public class patienHandler {
    public static void patienthandler1(map<id,patient__c> newmap,map<id,patient__c> oldmap)
    {
        Set<id> Arid=new Set<id>();
        List<Area__c> ar = new List<Area__c>();
        List<Patient__c> pt = new List<Patient__c>();
        Set<integer> Curdays=new Set<integer>();
        Map<id,List<Patient__c>> mapfinal = new Map<id,List<Patient__c>>();
        List<Area__c> acclist = [Select id,name,(select id from patients__r) from Area__c where id in :ar];
        for(Patient__c objpatient:newmap.values())
        {
            if(objpatient.Status__c!= oldmap.get(objpatient.id).Status__c && oldmap.get(objpatient.id).Status__c=='mild')
            {
                Arid.add(objpatient.Area__c);
                objpatient.Cured_date__c=datetime.now();
                pt.add(objpatient);
                
            }
        }
        update pt;
        
        AggregateResult[] lstpatient =[Select Area__c,count(id)  from Patient__c where Area__c In:Arid group by Area__c ];
        System.debug(lstpatient);
        map<object,object> mapcount = new map<object,object>();       
        
        for(AggregateResult agg:lstpatient)
        {
          
            mapcount.put(agg.get('Area__c'), agg.get('expr0'));
        }
        System.debug(mapCount);
        for(Patient__c pt1:pt)
        {
           
            if(pt1.Cured_date__c!= null)
            {
                  Integer diff = pt1.Cured_date__c.Date().daysBetween(pt1.CreatedDate.Date());
               // Curdays.add();
            }
        }
        
    }
}