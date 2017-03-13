trigger sendMail on Student__c (after insert) {
    List<Messaging.SingleEmailMessage> mails
        = new List<Messaging.SingleEmailMessage>();
    List<String> sendTo = new List<String>();
    for (Student__c student : trigger.new) {
        Messaging.SingleEmailMessage mail
            = new Messaging.SingleEmailMessage();
        EmailTemplate emailtemp; 
        try {
            emailtemp = [SELECT Id, Name FROM EmailTemplate
                         WHERE DeveloperName='Mail_to_contact'];
        } catch (Exception e) {
            System.debug('unable to get email template');
        }
        mail.setTemplateId(emailtemp.id);
        List<Contact> contacts = new List<Contact>();
        try {
            contacts = [SELECT Id, Name, Email FROM Contact
                        WHERE AccountId=:student.Account__c];
        } catch (Exception e) {
            System.debug('unable to get contacts');
        }
        for (Contact con : contacts) {
            sendTo.add(con.Email);
            mail.setToAddresses(sendTo);
            mail.setTargetObjectId(con.Id);
            mail.setSaveAsActivity(false);
            mails.add(mail);
        }
        Account acc = new Account(); 
        try {
             acc = [SELECT id,ownerId FROM Account
                    WHERE Id=:student.Account__c];
        } catch (Exception e) {
            System.debug('unable to get account');
        }
        User accountOwner = new User(); 
        try {
            accountOwner = [SELECT id, email FROM user
                            where id=:acc.ownerId];
        } catch (Exception e) {
            System.debug('unable to get user');
        }
        sendTo.add(accountOwner.Email);
        mail.setToAddresses(sendTo);
        mail.setTargetObjectId(acc.ownerId);
        mail.setSaveAsActivity(false);
        mails.add(mail);
    }
    //Messaging.sendEmail(mails);
}