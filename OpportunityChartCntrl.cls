public class OpportunityChartCntrl {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Amount,Name,StageName FROM Opportunity WHERE CloseDate >= LAST_N_DAYS:365 AND StageName = 'Closed Won'];
    }
}