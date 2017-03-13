@isTest
public class test45 {
    public static testmethod void test1() {
        Ideabus__Customer__c customer = new Ideabus__Customer__c();
        customer.Ideabus__Email_Address__c = 'abi5dante@gmail.com';
        customer.Ideabus__Password__c = '123456';
        system.debug(customer);
        Ideabus__Customer__c oldCustomer = CustomerController.retrieveCustomer(customer);
        system.debug(oldCustomer);
    }
    
    public static testmethod void test2() {
        Ideabus__Customer__c customer = new Ideabus__Customer__c();
        customer.Name = 'user7';
        customer.Ideabus__Email_Address__c = 'sample7@gmail.com';
        customer.Ideabus__Password__c = 'sample7';
        system.debug(customer);
        Ideabus__Customer__c newCustomer = CustomerController.insertCustomer(customer);
        system.debug(newCustomer);
    }
    
    public static testmethod void test3() {
        List<Ideabus__Route__c> oldRoutes = BusController.retrieveRoutes();
        system.debug('routes '+oldRoutes);
    }
    
    public static testmethod void test4() {
        List<Ideabus__Bus__c> oldBuses = BusController.retrieveBuses('a046F00001Cyvm2QAB');
        system.debug('buses '+oldBuses);
    }
}