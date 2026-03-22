@IsTest
public class StudentScoreTriggerTest {
    
@TestSetup 
static void setup() { 

    List<Student__c> students = new List<Student__c>();
    
    students.add(new Student__c(Name = 'Anna', Score__c = 95));  
    students.add(new Student__c(Name = 'Bob', Score__c = 85));    
    students.add(new Student__c(Name = 'Charlie', Score__c = 75)); 
    students.add(new Student__c(Name = 'David', Score__c = 65));   
    
    insert students;
        
}     
    

    
@IsTest 
static void testGetStudents() { 
   List<Student__c> students = [SELECT Id, Name, Score__c, Grade__c FROM Student__c ORDER BY Score__c DESC];
       
        System.assertEquals('A', students[0].Grade__c, 'Anna 95 должно быть A');
        System.assertEquals('B', students[1].Grade__c, 'Bob 85 должно быть B');
        System.assertEquals('C', students[2].Grade__c, 'Charlie 75 должно быть C');
        System.assertEquals('D', students[3].Grade__c, 'David 65 должно быть D');
}
    
}