trigger sendMailToContact on Contact (after insert) {
    List<Messaging.SingleEmailMessage> mails
    	= new List<Messaging.SingleEmailMessage>();
    for (Contact con : trigger.new) {
        Messaging.SingleEmailMessage mail
            = new Messaging.SingleEmailMessage();
        EmailTemplate emtem; 
		try {
            emtem = [SELECT Id, Name FROM EmailTemplate
                     WHERE DeveloperName='sample_mail'];
        }
		catch (Exception e) {
		}
		mail.setTemplateId(emtem.id);
        List<String> sendTo = new List<String>();
      	sendTo.add(con.Email);
      	mail.setToAddresses(sendTo);
        mail.setTargetObjectId(con.Id);
        mails.add(mail);
    }
    Messaging.sendEmail(mails);
}