trigger AccountTrigger on Account (before insert,before update) {

    for (Account ac : trigger.new) {
        if (null == ac.AccountNumber) {
            ac.AccountNumber.adderror('this field is mandatory');
        }
        ac.Fax = ac.Phone;
    }
}