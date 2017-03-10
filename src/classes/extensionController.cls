public class extensionController {

    public List<Contact> conts{get;set;}

    public extensionController(ApexPages.StandardController controller) {
        conts = [SELECT id,name,title,phone FROM Contact];
    }
}