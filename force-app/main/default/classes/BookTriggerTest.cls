@IsTest
public class BookTriggerTest {

  @IsTest
    static void NegativeTest(){
    Book__c b = new Book__c(
            Title__c = 'Test book 1',
            Price__c = 10,
            Quantity__c = 0
        );
        
        insert b;
         b = [SELECT Id, Available__c, Quantity__c FROM Book__c WHERE Id = :b.Id];
    System.AssertEquals(false, b.Available__c, 'Available__c должен иметь значение false');
        
        b.Quantity__c= 9;
        update b;
        b = [SELECT Id, Available__c, Quantity__c FROM Book__c WHERE Id = :b.Id];
          System.AssertEquals(true, b.Available__c, 'После обновнения количества, Available__c должен иметь значение true');
   
    
    
    }  

@IsTest
    static void PossitiveTest(){
    
     Book__c b = new Book__c(
            Title__c = 'Test book 1',
            Price__c = 10,
            Quantity__c = 5
        );
        
        insert b;
         b = [SELECT Id, Available__c, Quantity__c FROM Book__c WHERE Id = :b.Id];
    System.AssertEquals(true, b.Available__c, 'Available__c должен иметь значение true');
    
    
    }}