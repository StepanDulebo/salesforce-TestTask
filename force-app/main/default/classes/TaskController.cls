public class TaskController {

    @AuraEnabled(cacheable=true)
    public static List<Task__c>  getTasks(){
        return [SELECT  Id, Subject__c, DueDate__c,  Done__c FROM Task__c  ORDER BY DueDate__c ASC];
        
    }
    
     @AuraEnabled
    public static void  markDone(Id taskId){
        
         if (taskId == null) {
            return;
        }
        
        Task__c tsk = [SELECT  Id, Done__c FROM Task__c WHERE Id = :taskId  LIMIT 1];
        
        tsk.Done__c = true;
        update tsk;
        
    }
    
}