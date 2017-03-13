global class BatchApex implements Database.Batchable<sObject>{
    global Database.queryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT id,name,phone FROM Account]);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> accounts) {
        for (Account acc : accounts) {
            acc.phone = '7736299424';
        }
        update accounts;
    }
    
    global void finish(Database.BatchableContext bc) {
    }
}