global class batchApex implements Database.Batchable<Sobject>,Database.Stateful{
    
    private integer magicnumber=0;
    global database.QueryLocator start(database.BatchableContext sc)
    {
        return database.getQueryLocator('Select id,name from Account');
    }
    
    global void execute(database.BatchableContext bc,List<Account> Scope){
        for(integer i=0;i<5;i++)
        {
            magicnumber++;
        }
        System.debug(scope.size());
    }
    
    global void finish(database.BatchableContext bc)
    {
        System.debug(magicnumber+'Finish');
    }

}