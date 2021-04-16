trigger TriggerContact on Contact (before insert,before update) {
    
    
    List<Account> account = new List<Account>();
    
    for(Contact contact : Trigger.new ){       
            
            Account a1 = new Account(Id = contact.AccountId);
            a1.Phone = contact.MobilePhone;
            account.add(a1);
              
        }
        update account;
}