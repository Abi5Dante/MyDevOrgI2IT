@isTest
public class TriggerTest {
   static testmethod void test_trigger(){
       Student__c stuObj = new Student__c(first_Name__c = 'sheik', last_Name__c = 'hassina',
                                          age__c = 45 , account__c = '0016F00001vZsJU');
       insert stuObj;
   }
}