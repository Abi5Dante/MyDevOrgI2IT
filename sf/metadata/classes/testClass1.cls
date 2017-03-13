@isTest
public class testClass1 {
    private static testMethod void test1() {
        ScheduleCls sc = new ScheduleCls();
        String sch = '00 05 10 16 2 ?';
		system.schedule('executeBatchJob', sch, sc);
    }
}