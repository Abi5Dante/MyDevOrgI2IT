global class ScheduleCls implements Schedulable{
    global void execute(SchedulableContext sc){
        //execute code
        BatchApex ba = new BatchApex();
        Database.executeBatch(ba);
    }
}