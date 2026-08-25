/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OpportunityTrigger on Opportunity (after insert) {

  if(Trigger.isAfter){
    if(trigger.isUpdate){
      OpportunityTriggerHandler.updateOLIDeliveryStatus(trigger.new , trigger.oldMap);
    }
  }
}