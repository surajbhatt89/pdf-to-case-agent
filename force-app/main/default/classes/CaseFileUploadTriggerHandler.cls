public with sharing class CaseFileUploadTriggerHandler {
    
    private static Boolean isExecuting = false;
    
    public static void handleAfterInsert(List<ContentDocumentLink> newLinks ){
        
        if (isExecuting){
            return;
        }
        
        isExecuting = true;
        
        Set<Id> caseIds = new Set<Id>();
        
        String caseKeyPrefix = Case.SObjectType.getDescribe().getKeyPrefix();
        
        for (ContentDocumentLink cd1 : newLinks){
            
            if (cd1.LinkedEntityId == null){
                continue;
            }
        
        String linkedEntityId = String.valueOf(cd1.LinkedEntityId);
        
        if (linkedEntityId.startsWith(caseKeyPrefix)){
            caseIds.add(cd1.LinkedEntityId);
            }
        }
        
        if(!caseIds.isEmpty()){
            System.enqueueJob(new CaseFileUploadPromptQueueable(caseIds));
        }
    }
  
}