public with sharing class CaseFileUploadPromptQueueable implements Queueable , Database.AllowsCallouts{
    
    private set<Id> caseIds;
    
    public CaseFileUploadPromptQueueable(set<Id> caseIds){
        this.caseIds = caseIds;
    }
    
    public void execute(QueueableContext context){
        if (caseIds == null || caseIds.isEmpty()){
            return;
        }
        List<Case> caselist = [
            SELECT Id , Description
            FROM Case
            WHERE Id IN :caseIds
        ];
        
        /*if(!caselist.isEmpty()){
            CasePromptPDFDataTemplateHandler.generateDescriptionsById(caseList);
        }*/
            
    }
}