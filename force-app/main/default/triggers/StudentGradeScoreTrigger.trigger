trigger StudentGradeScoreTrigger on Student__c (before insert, before update) {
    StudentGradeScoreTriggerHelper.GetStudentScore(Trigger.new);
}