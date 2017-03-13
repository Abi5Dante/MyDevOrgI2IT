public class TicketController {
	@AuraEnabled
    public static Ideabus__Bus__c retrieveBusById(String busId) {
        return [SELECT Name, Ideabus__Bus_Name__c,
                       Ideabus__Coach__c, Ideabus__Type__c,
                	   Ideabus__Route__r.Name
                FROM Ideabus__Bus__c WHERE id=:busId];
    }
    
    @AuraEnabled
    public static Ideabus__Ticket__c insertTicket(Ideabus__Bus__c bus, String email,
                                                  Ideabus__Customer__c customer) {
        System.debug('insertTicket');
        Ideabus__Ticket__c ticket = new Ideabus__Ticket__c();
        ticket.Ideabus__Bus__c = bus.Id;
        ticket.Ideabus__Email_Address__c = email;
		ticket.Ideabus__Customer__c = customer.id;
        insert ticket;
		system.debug(ticket);
        return ticket;
    }
    
    @AuraEnabled
    public static void updateAllPassengers(Ideabus__Ticket__c ticket,
                                           List<Ideabus__Passenger__c> passengers) {
        System.debug('updateAllPassengers');
        System.debug(ticket);
		System.debug(passengers);
        for(Ideabus__Passenger__c passenger : passengers) {
            passenger.Ideabus__Ticket__c = ticket.Id;
        	update passenger;
        }
    }
}