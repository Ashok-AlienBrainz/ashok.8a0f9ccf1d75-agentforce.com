/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-25-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OpportunityTriggerHandler {

    public static void updateOLIDeliveryStatus(List<Opportunity> oppList, Map<Id, Opportunity> oppOldMap){

        Set<Id> oppIdSet = new Set<Id>();
        for(Opportunity opp : oppList){
            if(oppOldMap.get(opp.Id).StageName != opp.StageName && opp.StageName == 'Closed Won'){
                oppIdSet.add(opp.Id);
            }
        }

        if(oppIdSet.isEmpty()){
            return;
        }

        List<OpportunityLineItem> oliList = [SELECT Id, Delivery_Status__c FROM OpportunityLineItem 
                                              WHERE OpportunityId IN :oppIdSet 
                                              AND Delivery_Status__c != 'Ready for Shipment'];
        for(OpportunityLineItem oli : oliList){
            oli.Delivery_Status__c = 'Ready for Shipment';
        }

        if(!oliList.isEmpty()){
            update oliList;
        }
    }
}