public class BookTriggerHelper { 
 public static void setAvailability(List<Book__c> books) { 
     for(Book__c bk : books){
         if(bk.Quantity__c > 0){
             bk.Available__c = true;
         }else{
             bk.Available__c = false;
         }
     }
 } 
 }