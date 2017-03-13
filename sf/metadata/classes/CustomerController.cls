public class CustomerController {
	@AuraEnabled
    public static Ideabus__Customer__c retrieveCustomer(Ideabus__Customer__c customer) {
        system.debug('CustomerController');
        return [SELECT Id, Name, Ideabus__Email_Address__c, Ideabus__Password__c
                FROM Ideabus__Customer__c WHERE Ideabus__Email_Address__c=:customer.Ideabus__Email_Address__c
                AND Ideabus__Password__c=:customer.Ideabus__Password__c];
    }
    
    @AuraEnabled
    public static Ideabus__Customer__c insertCustomer(Ideabus__Customer__c customer) {
        insert customer;
        return [SELECT Id, Name, Ideabus__Email_Address__c, Ideabus__Password__c
                FROM Ideabus__Customer__c WHERE Name=:customer.Name];
    }
}