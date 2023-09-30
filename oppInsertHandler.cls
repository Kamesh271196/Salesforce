public class oppInsertHandler {
    public static void DuplicateoppHandler(List<Opportunity> listOpportunity){        
        Set<String> Oppname = new Set<String>();
        for(Opportunity accVar : listOpportunity){
            Oppname.add(accVar.Name);
        }
        List<Opportunity> duplicateopp = [SELECT Id, Name 
                                           FROM Opportunity 
                                           WHERE Name IN :Oppname and Name !='X']; 
        
        for(Opportunity acc : listOpportunity){
            if(duplicateopp.size()!=0){
                acc.Name.addError('Account cannot be inserted');
            }
        }
    }
}