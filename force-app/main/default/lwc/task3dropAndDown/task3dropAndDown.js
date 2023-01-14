import { LightningElement, track,wire } from 'lwc';
import getFileVersions from "@salesforce/apex/catchAccount.getAccount";
import { publish , MessageContext } from 'lightning/messageService';
import filterContact from '@salesforce/messageChannel/MyMessageChannel__c';


export default class Task3dropAndDown extends LightningElement {

    @track value ='';
    @track optionArray = [];

    get options(){
        return this.optionArray;
    }

    @wire(MessageContext)
    MessageContext;
  
    @wire(getFileVersions)
    wiredContentVersions({ data, error }) {

    if(data){
        let arr =[];
        for (var index = 0; index < data.length; index++) {
             arr.push({label : data[index].Name , value : data[index].Id});    
        }
        this.optionArray = arr;
    }
    }
    handlechangedValue(event){
        this.value = event.detail.value;
        // alert(JSON.stringify(this.value));
        const payload = {
            messageToSend : this.value
        };
        // alert(this.MessageContext);
        publish(this.MessageContext ,filterContact, payload);
    }
}