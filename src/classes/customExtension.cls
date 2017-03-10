public class customExtension {

    public List<Bus__c> buses{get;set;}

    public customExtension(MyController controller) {
        buses = [SELECT id,name,route__c,type__c FROM bus__c];
    }

}