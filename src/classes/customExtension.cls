public class customExtension {

    public List<Bus__c> buses{get;set;}

    public customExtension(MyController controller) {
        buses = [SELECT id,name,Ideabus__Route__c,Ideabus__Type__c FROM Ideabus__Bus__c];
    }
}