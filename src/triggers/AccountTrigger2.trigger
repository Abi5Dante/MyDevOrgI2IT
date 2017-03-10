trigger AccountTrigger2 on Account (after update) {

    List<Account> accs = [SELECT id,name,phone,rating,annualRevenue
                          FROM Account];
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    for (Account ac : accs) {
        accMap.put(ac.id,ac);
    }
    
    List<Contact> conts = [SELECT id,name,email,phone,AccountId FROM Contact
                           WHERE AccountId IN:trigger.newMap.keySet()];
    
    for (Contact cont : conts) {
        if (accMap.containsKey(cont.AccountId)) {
            cont.phone = accMap.get(cont.AccountId).phone;
        }
    }
    update conts;
}