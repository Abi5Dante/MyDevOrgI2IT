public class MyController {

    public List<Vehicle__c> vehicles{get;set;}
    public Vehicle__c vehicle{get;set;}

    public MyController() {
        vehicles = [SELECT Name,License_Plate__c FROM Vehicle__c];
        vehicle = new Vehicle__c();
    }
    
    public PageReference create() {
        insert vehicle;
        return null;
    }
    
    public PageReference save() {
        update vehicles;
        return null;
    }
    
    public PageReference remove() {
        delete vehicles;
        return null;
    }
}