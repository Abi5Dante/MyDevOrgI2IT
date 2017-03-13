trigger AccountTrigger3 on Account (before delete) {
    
    for (Account ac : trigger.old) {
        if (false == ac.Contacts.isEmpty()) {
            ac.addError('You cannot delete this record');
        }
    }
}