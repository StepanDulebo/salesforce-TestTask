import { LightningElement, wire, track } from 'lwc';
import getTasks from '@salesforce/apex/TaskController.getTasks';
import markDone from '@salesforce/apex/TaskController.markDone';
import { refreshApex } from '@salesforce/apex'; 

export default class TaskList extends LightningElement {
  @track tasks;
  @track error;
  getWiredTasks; 

  @wire(getTasks)
  wiredTasks(result) {
    this.getWiredTasks = result;            
    if (result.data) {
      this.tasks = result.data;
      this.error = undefined;
    } else if (result.error) {
      this.error = result.error;
      this.tasks = undefined;
    }
  }

  async handleMarkDone(event) {
    const taskId = event.target.dataset.id;

    try {
      await markDone({ taskId });
      await refreshApex(this.getWiredTasks);
    } catch (e) {
      this.error = e;
    }
  }
}