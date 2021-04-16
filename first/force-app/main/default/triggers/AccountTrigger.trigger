trigger AccountTrigger on Account (before insert, before update) {
    
      List<Contact> lstContact = new List<Contact>();
      List<Contact> lstContact1 = new List<Contact>([select id,Phone from Contact where AccountId IN: Trigger.new]);
        
        for(Account objAcc : Trigger.new)
        {
            
           //List<Contact> lstContact = new List<Contact>([select id,Phone from Contact where AccountId=:objAcc.Id]);
            for(Contact c : lstContact1)
            {
                c.Phone=objAcc.Phone;
                //update c;
                lstContact.add(c);
               
            }
          }
    update lstContact;
}