global with sharing class DataProcessBatchClass implements Database.Batchable<sObject> {
    List<sObject> objectList;
    public DataProcessBatchClass(List<sObject> l) {
        objectList = l;
    }
    global Iterable<sObject> start(Database.BatchableContext BC) {
        return new CustomIterable(objectList);
    }
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        insert scope;
    }
    global void finish(Database.BatchableContext BC) {
    }
    global class CustomIterable implements Iterable<sObject> {
        List<sObject> innerClassObjectList;
        public CustomIterable(List<sObject> l) {
            innerClassObjectList = l;
        }
        global Iterator<sObject> Iterator() {
            return innerClassObjectList.iterator();
        }
    }
}