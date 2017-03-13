public class PassengerController {
	@AuraEnabled
    public static Ideabus__Seat__c retrieveSeat(String busId){
        system.debug(busId);
        return [SELECT id, name, Ideabus__Seat_Name__c FROM Ideabus__Seat__c
                WHERE Ideabus__Bus_Registration__c=:busId];
    }
    
    @AuraEnabled
    public static String[] getListofSeats(Ideabus__Seat__c seat){
        system.debug(seat);
        String seatName = seat.Ideabus__Seat_Name__c;
        String[] seats = seatName.split(';');
        return seats;
    }
    
    @AuraEnabled
    public static List<Ideabus__Passenger__c> getPassengers(String[] seats) {
        Ideabus__Passenger__c passenger;
        List<Ideabus__Passenger__c> passengers = new List<Ideabus__Passenger__c>();
            for(string seat : seats) {
            	passenger = new Ideabus__Passenger__c();
                passenger.Name = '';
                passenger.Ideabus__Seat__c = seat;
                passengers.add(passenger);
            }
	    return passengers;
    }
    
    @AuraEnabled
    public static List<Ideabus__Passenger__c> insertAllPassengers(List<Ideabus__Passenger__c> passengers) {
        system.debug(passengers);
        for(Ideabus__Passenger__c passenger : passengers) {
        	insert passenger;    
        }
        return passengers;
    }
}