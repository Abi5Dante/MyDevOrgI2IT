public class DeleteContacts{
    @InvocableMethod(label='Get Contacts' description='Delete Contacts in Accounts')
    public static void deleteAccountContacts(List<id> accountsIds) {
        List<Contact> contacts = [SELECT id FROM contact WHERE AccountId=:accountsIds];
        delete contacts;
    }
}