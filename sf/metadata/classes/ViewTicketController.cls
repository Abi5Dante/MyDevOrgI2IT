public class ViewTicketController {

    @AuraEnabled
    public static void deleteTicket(String ticketId) {
        system.debug('deleteTicket');
        system.debug(ticketId);
        Ideabus__Ticket__c ticket = [SELECT id,Name FROM Ideabus__Ticket__c
                                     WHERE id=:ticketId];
		delete ticket;
    }
    
    @AuraEnabled
    public static void deletePassenger(String passengerId) {
        system.debug('deleteTicket');
        system.debug(passengerId);
        Ideabus__Passenger__c passenger = [SELECT id,Name FROM Ideabus__Passenger__c
                                           WHERE id=:passengerId];
        delete passenger;
    }
    
    @AuraEnabled
    public static List<Ideabus__Ticket__c> retrieveTickets(Ideabus__Customer__c customer){
        return [SELECT id, name, Ideabus__Bus__r.Ideabus__Bus_Name__c,Ideabus__Bus__r.Ideabus__Type__c,
                	   Ideabus__Bus__r.Ideabus__Coach__c, Ideabus__Bus__r.Ideabus__Route__r.name,
                       (SELECT id, Name, Ideabus__Seat__c FROM Ideabus__Ticket__c.Ideabus__Passengers__r)
                FROM Ideabus__Ticket__c WHERE Ideabus__Customer__c=:customer.Id];
    }
}