/**
 * Created by user on 02.09.2019.
 */

trigger Study_Participant on Study_Participant__c
        (before insert, before update, before delete,
                after insert, after update, after delete, after undelete) {

    if (Trigger.isBefore && Trigger.isInsert) {
        StudyParticipantTriggerHandler.updateStudyParticipantKey(Trigger.new);
    }
}