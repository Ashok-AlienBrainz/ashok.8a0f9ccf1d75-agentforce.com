/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

  if(trigger.isAfter){
    if(trigger.isInsert){

      AccountTriggerHandler.createContactOnACcountBaseonNumberField(trigger.new );
    }
  }


}