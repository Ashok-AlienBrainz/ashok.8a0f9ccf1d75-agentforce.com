/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactTriggerHandler {
   
    public static void pupulateLastestContactEmaiToAccount(List<Contact> newList , Map<Id , Contact> Oldcon){

        Map<Id, Contact > conOldList = new Map<Id, Contact>();
        if(Oldcon == null || Oldcon.isEmpty()){
            conOldList = new Map<Id, Contact>();
        }
        else{
            conOldList = Oldcon;
        }

      Map<Id , List<contact>> AccIdConList = new Map<Id , List<contact>>();

      for(contact con : newList){
        if((con.AccountId != null && con.Email != null) || conOldList.get(con.Id).Email != con.Email){
            if(accIdConList.containsKey(con.AccountId)){
                accIdconList.get(con.accountId).add(con);
            }
            else{
                accIdConList.put(con.AccountId , new List<contact>{con});
            }
        }
      }
      System.debug('contactTriggerHandler - accIdConList => '+accIdConList);
      List<Account> accList = new List<Account>();
        for(Id accId : accIdConList.keySet()){  
            List<contact> conList = accIdconList.get(accId);
            conList.sort();
            Account acc = new Account(Id = accId , Latest_Contact_Email__c = conList[0].Email);
            accList.add(acc);

    }
    if(accList.size() > 0){
        update accList;
    }
}
}