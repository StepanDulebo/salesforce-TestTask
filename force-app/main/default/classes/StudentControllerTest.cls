@IsTest
public class StudentControllerTest { 
    
@TestSetup 
static void setup() { 
     
    List<Student__c> students = new List<Student__c>();
         
    students.add(new Student__c(Name='Anna', Score__c=95));
    students.add(new Student__c(Name='Bob', Score__c=85));
    students.add(new Student__c(Name='David', Score__c=65));
    students.add(new Student__c(Name='Eva', Score__c=55));
         
    insert students;
     
}
    
    
@IsTest 
static void testGetStudents() { 
     
    List<Student__c> result = StudentController.getStudents();
         
    System.assertEquals('Anna', result[0].Name, 'Anna должен быть первым');
    System.assertEquals('Bob', result[1].Name, 'Bob должен быть вторым');
    System.assertEquals('David', result[2].Name, 'David должен быть вторым');
    System.assertEquals('Eva', result[3].Name, 'Eva должен быть вторым');
             
 } 
   
@IsTest 
static void testGetTopStudents() { 
     
    List<Student__c> topResult = StudentController.getTopStudents(3);
    System.assertEquals(topResult.size(), 3, 'Колличество студентов должно быть 3');
 	System.assertEquals(topResult[0].Score__c, 95, 'Score первого студента должен быть 95');
 	

}}