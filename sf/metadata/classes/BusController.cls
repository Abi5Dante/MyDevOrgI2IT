public class BusController{
	@AuraEnabled
    public static List<Ideabus__Route__c> retrieveRoutes(){
        return [SELECT Id, Name, Ideabus__Stops__c FROM Ideabus__Route__c];
    }
    
    @AuraEnabled
    public static List<Ideabus__Bus__c> retrieveBuses(String route){
        return [SELECT Id, Name, Ideabus__Bus_Name__c, Ideabus__Coach__c, Ideabus__Status__c, Ideabus__Type__c
                FROM Ideabus__Bus__c WHERE Ideabus__Route__c=:route];
    }

    @AuraEnabled
    public static List<Ideabus__Ticket__c> retrieveTickets(Ideabus__Customer__c customer){
        return [SELECT id, name, Ideabus__Bus__r.Ideabus__Bus_Name__c,Ideabus__Bus__r.Ideabus__Type__c,
                	   Ideabus__Bus__r.Ideabus__Coach__c, Ideabus__Bus__r.Ideabus__Route__r.name,
                       (SELECT id, Name, Ideabus__Seat__c FROM Ideabus__Ticket__c.Ideabus__Passengers__r)
                FROM Ideabus__Ticket__c WHERE Ideabus__Customer__c=:customer.Id];
    }
}