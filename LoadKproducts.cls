public with sharing class LoadKproducts {
    @AuraEnabled(cacheable=true)
    public static List<KProduct__c> LoadKproducts(string searchKey) {
        String search = searchKey + '%';
        if(searchKey==null)
        {
            return [
                SELECT Id, Name 
                FROM KProduct__c ORDER BY name ASC
            ];
        }
        else {
            return [
            SELECT Id, Name 
            FROM KProduct__c
            WHERE Name LIKE: search
        ]; 
        }
      
    }
}