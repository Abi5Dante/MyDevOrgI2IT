public class customExtension {

    public List<Bus__c> buses{get;set;}

    public customExtension(MyController controller) {
        buses = [SELECT id,name,route__c,type__c FROM bus__c];
    }

	public bus__c getBuses(){
		buses = [SELECT id,name,route__c,type__c FROM bus__c];
		return buses;
	}
}