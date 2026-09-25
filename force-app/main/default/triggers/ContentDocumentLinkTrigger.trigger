trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {
    if (Trigger.isAfter && Trigger.isInsert){
        CaseFileUploadTriggerHandler.handleAfterInsert(Trigger.new);
    }
}