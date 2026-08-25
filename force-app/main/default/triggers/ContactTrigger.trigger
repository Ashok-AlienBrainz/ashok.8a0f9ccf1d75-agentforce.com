/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (before insert , before update , after insert , after update , after delete , after undelete) {

  if(trigger.isAfter){
    if(trigger.isInsert || trigger.isUpdate){
      ContactTriggerHandler.pupulateLastestContactEmaiToAccount(trigger.new , trigger.oldMap);    
    }
  }

}