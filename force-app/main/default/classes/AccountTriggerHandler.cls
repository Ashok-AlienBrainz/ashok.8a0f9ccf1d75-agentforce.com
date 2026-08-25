/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountTriggerHandler {

    public static void createContactOnACcountBaseonNumberField(List<Account> newList){

        List<Contact> conList = new List<Contact>();
        for(Account acc : newList){
            for(Integer I = 1 ; I <= acc.NumberofLocations__c ; I++){
                Contact con = new Contact(LastName = 'Contact '+I , AccountId = acc.Id);
                conList.add(con);
            }
        }
        if(conList.size() > 0){
            insert conList;
        }
    }
}