public class Sample {
    
    //static method
    private static void sampleMethod(){
        Double rating = 4.76;
        System.debug('this is a static method ' + rating);
    }
    
    //non-static method
    private void sampleMethod1(){
        Object obj = 100000000L;
        Long steps = (Long)obj;
        System.debug('object cast to long ' + steps);
    }
    
    private static void sampleMethod2(){
        DateTime thisDay = DateTime.now();
		DateTime nextMonth = thisDay.addDays(15);
        System.debug('today is '+ thisDay);
		System.debug('after 15 days '+ nextMonth);
    }
    
    private void sampleCollectionList(){
        List<Integer> numbers = new List<Integer>();
        numbers.add(1);
        numbers.add(5);
        numbers.add(9);
        numbers.add(7);
        numbers.add(2);
        System.debug(numbers);
        System.debug('Element at index 4 is '+numbers.get(4));
        System.debug('Element at index 2 is '+numbers[2]);
        System.debug('Number of elements are '+numbers.size());
        numbers.sort();
        System.debug('Sorted numbers are '+numbers);
        numbers.clear();
        System.debug('Is list empty '+numbers.isEmpty());
    }
    
    private void sampleCollectionSet(){
        Set<Integer> numbers = new Set<Integer>();
        numbers.add(1);
        numbers.add(5);
        numbers.add(9);
        numbers.add(7);
        numbers.add(9);
        numbers.add(7);
        numbers.add(2);
        numbers.add(8);
        System.debug(numbers);
        System.debug('does 4 exists in set '+numbers.contains(4));
        System.debug('is 5th element removed, '+numbers.remove(5));
        System.debug('Number of elements are '+numbers.size());
        numbers.clear();
        System.debug('Is list empty '+numbers.isEmpty());
    }
    
    private void sampleCollectionMap(){
        Map<Integer,String> names = new Map<Integer,String>();
        names.put(1,'abi');
        names.put(2,'azad');
        names.put(3,'showkath');
        names.put(4,'ruhan');
        names.put(5,'abbas');
        names.put(6,'asan');
        System.debug(names);
        System.debug('keys in map are '+names.keySet());
        System.debug('values in map are '+names.values());
        System.debug('does key 7 exists in map '+names.containsKey(7));
        System.debug('Element with key 4 is '+names.get(4));
        System.debug('Remove 5th element '+names.remove(5));
        System.debug('Number of elements are '+names.size());
        names.clear();
        System.debug('Is list empty '+names.isEmpty());
    }
    
    private void insertAccount(String name, String billingcity, Decimal annualRevenue){
        Account acc = new Account();
		acc.Name = name;
		acc.Billingcity = billingcity;
        acc.AnnualRevenue = annualRevenue;
		insert acc;
    }
    
    public void getAccount(){
        List<Account> accounts  = [SELECT id,name,annualrevenue,rating,phone FROM Account WHERE annualrevenue != null AND rating != null];
        for (Account account: accounts) {
            System.debug('Account name is ' + account.name);
        }
    }
}