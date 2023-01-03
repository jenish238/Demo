import { LightningElement, wire, api, track } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import filterContact from '@salesforce/messageChannel/MyMessageChannel__c';
import getContacts from "@salesforce/apex/catchAccount.getContacts";
import fetchOpportunity from "@salesforce/apex/catchAccount.fetchOpportunity";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';



export default class Task3dropAndDownPart2 extends LightningElement {

    subscription = null;
    @api AccountId;
    recordsToDisplay1
    recordsToDisplay2
   @track empty1 = null;
   @track empty2 = null;
   showToast() {
    const event = new ShowToastEvent({
        title: 'Data is empty',
        message: 'Data not in Contact',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
}
showToast1() {
    const event = new ShowToastEvent({
        title: 'Data is empty',
        message: 'Data not in Opportunity',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
}
    columns1 = [
        { label: 'conFirstName', fieldName: 'FirstName' },
        { label: 'conLastName', fieldName: 'LastName' },

    ];
    columns2 = [
        { label: 'OpportunityName', fieldName: 'Name' },
        { label: 'OpportunityStageName', fieldName: 'StageName' },
        { label: 'OpportunityCloseDate', fieldName: 'CloseDate' }
    ];

    @wire(MessageContext)
    MessageContext;

    connectedCallback() {


        this.subscription = subscribe(
            this.MessageContext,
            filterContact,
            (message) => this.contactAndOpportunities(message)
        );
    }

    contactAndOpportunities(message) {

        getContacts({
            accountId: message.messageToSend
        })
            .then((result) => {
                console.log(result);

                console.log(JSON.stringify(result));
                if (result == null) {
                    this.showToast();
                    this.empty1 = true;
                    this.recordsToDisplay1 = null;
                }else{
                    this.empty1 = null;;

                    this.recordsToDisplay1 = result;
                   
                }
            })

        fetchOpportunity({
            accountId: message.messageToSend
        })
            .then((result1) => {
                if (result1 == null) {
                    this.showToast1();
                    this.empty2 = true;
                    this.recordsToDisplay2 = null;

                    
                }else{
                    this.empty2 = null;
                    this.recordsToDisplay2 = result1;
                }
            })

    }

}


 // this.recordsToDisplay1 =this.getContacts(message.messageToSend);
        // alert(JSON.stringify(this.recordsToDisplay1));
        // this.recordsToDisplay2 =fetchOpportunity(message.messageToSend);