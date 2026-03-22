@IsTest
public class TaskControllerTest {
    
 @TestSetup
    static void setup() {
        List<Task__c> tasks = new List<Task__c>();

        tasks.add(new Task__c(
            Subject__c = 'Task 1',
            DueDate__c = Date.today().addDays(1),
            Done__c = false
        ));

        tasks.add(new Task__c(
            Subject__c = 'Task 2',
            DueDate__c = Date.today(),
            Done__c = false
        ));

        tasks.add(new Task__c(
            Subject__c = 'Task 3',
            DueDate__c = Date.today(),
            Done__c = true
        ));

        insert tasks;
    }
    
    
    
     @IsTest
    static void testGetTasks() {
        Test.startTest();
        List<Task__c> result = TaskController.getTasks();
        Test.stopTest();

        System.assertEquals(3, result.size(), 'Должно быть 3 задачи');

        System.assertEquals('Task 2', result[0].Subject__c, 'Первая задача по дате должна быть Task 2');
        System.assertEquals('Task 3', result[1].Subject__c, 'Вторая задача по дате должна быть Task 3');
        System.assertEquals('Task 1', result[2].Subject__c, 'Третья задача по дате должна быть Task 1');
    }

    @IsTest
    static void testMarkDone() {
        
        Task__c task1 = [SELECT Id, Done__c FROM Task__c WHERE Subject__c = 'Task 1' LIMIT 1];
        System.assertEquals(false, task1.Done__c, 'Task 1 изначально не выполнен');

        Test.startTest();
        TaskController.markDone(task1.Id);
        Test.stopTest();

        task1 = [SELECT Id, Done__c FROM Task__c WHERE Id = :task1.Id];
        System.assertEquals(true, task1.Done__c, 'Task 1 должен стать выполненным');
    }
    
    
    
}