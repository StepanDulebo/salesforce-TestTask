public class StudentGradeScoreTriggerHelper {
    public static void GetStudentScore(List<Student__c> students){
        
        for (Student__c s : students) {
        if (s.Score__c >= 90) {
            s.Grade__c = 'A';
        } else if (s.Score__c >= 80) {
            s.Grade__c = 'B';
        } else if (s.Score__c >= 70) {
            s.Grade__c = 'C';
        } else if (s.Score__c >= 60) {
            s.Grade__c = 'D';
        } else {
            s.Grade__c = 'F';
        }
    }
    }

}