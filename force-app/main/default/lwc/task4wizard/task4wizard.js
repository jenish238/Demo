import getAccount from "@salesforce/apex/getRecode.getAccount";
import getContact from "@salesforce/apex/getRecode.getContact";
import GetLead from "@salesforce/apex/getRecode.GetLead";
import sendEmailToController from "@salesforce/apex/getRecode.sendEmailToController";


import { LightningElement,track } from 'lwc';

 
export default class Task4wizard extends LightningElement {
 
    @track currentStep = '1';
    @track value = '';
    @track value1 = '';

    @track selectValue = [];
    columns = []; 
    recordsToDisplay1
    @track subject = '';
    @track body = '';
    @track body1 = '';
    myVal = '';

//    this.body= body.replaceAll('<p><br></p>','');

    handleclick(){
        var el = this.template.querySelector('lightning-datatable').getSelectedRows();
        this.value1 = el;
        const select = this.value;
       
        if(select === 'Account'){
         for (let index = 0; index < JSON.stringify(this.value1.length); index++) {
            this.selectValue.push(JSON.stringify(this.value1[index].Account_Email__c));
         }
         for (let i = 0; i < this.selectValue.length; i++) {
            this.selectValue[i] = this.selectValue[i].replace(/"/g, "");
        }
         console.log('recode:::::::' + this.selectValue);   
        }else{
            for (let index = 0; index <JSON.stringify(this.value1.length); index++) {
                this.selectValue.push(JSON.stringify(this.value1[index].Email));     
             }
             for (let i = 0; i < this.selectValue.length; i++) {
                this.selectValue[i] = this.selectValue[i].replace(/"/g, "");
            }
             console.log('recode:::::::' + this.selectValue);


             console.log(JSON.stringify(typeof this.selectValue[0])); 
        }
       
        
       
    }

    handleSubjectChange(event) {
        this.subject = event.target.value;
    }

    handleBodyChange(event) {
        this.body = event.target.value;
    }

    get options() {
        return [
                 { label: 'Account', value: 'Account' },
                 { label: 'Contact', value: 'Contact' },
                 { label: 'Lead', value: 'Lead' },
               ];
    }
    
    
    handleChange(event) {
            this.value = event.detail.value;
            const select = event.detail.value;
            if (select === 'Account') {
              const columns1 = [
                    { label: 'AcountName', fieldName: 'Name' },
                    { label: 'AcountEmail', fieldName: 'Account_Email__c' }

            
                ];
                this.columns = columns1;
                getAccount()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })
            }
            else if(select === 'Contact'){
                const columns2 = [
                    { label: 'conFirstName', fieldName: 'FirstName' },
                    { label: 'conLastName', fieldName: 'LastName' },
                    { label: 'conEmail', fieldName: 'Email' }

            
                ];
                this.columns = columns2;


                getContact()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })

            }else if(select === 'Lead'){
                const columns3 = [
                    { label: 'LeadName', fieldName: 'Name' },
                    { label: 'LeadEmail', fieldName: 'Email' }

            
                ];
                this.columns = columns3;

                GetLead()
                    .then((result) => {
                        if (result != null) {
                            this.recordsToDisplay1 = result;
                        }
                    })
            }
           
         }
 
    get isStepOne() {
        return this.currentStep === "1";
    }
 
    get isStepTwo() {
        return this.currentStep === "2";
    }
 
    get isStepThree() {
        return this.currentStep === "3";
    }
 
    get isEnableNext() {
        return this.currentStep != "3";
    }
 
    get isEnablePrev() {
        return this.currentStep != "1";
    }
 
    get isEnableFinish() {
        return this.currentStep === "3";
    }
 
    handleNext(){
        if(this.currentStep == "1" && this.value != '' ){
            this.handleclick();
            this.currentStep = "2";
        }
        else if(this.currentStep = "2" && this.subject != ''){
            const value = this.template.querySelector('lightning-input-rich-text').value;
            this.myVal = value;
                        this.currentStep = "3";
        }
    }
 
    handlePrev(){
        if(this.currentStep == "3"){
            this.currentStep = "2";
        }
        else if(this.currentStep = "2"){
            this.currentStep = "1";
        }
    }
 
    handleFinish(){
        const emailDetails = {
            body: this.body,
            toSend : this.selectValue,
            subject: this.subject
        };
        console.log(emailDetails);

        sendEmailToController(emailDetails)
            .then(() => {
                console.log("Email Sent");
            })
            .catch((error) => {
                console.log('error che bro');
                console.error("Error in sendEmailController:", error);
            });
 
    }
}




            //  this.selectValue = JSON.parse("[" + this.selectValue.join() + "]");
        // console.log(JSON.stringify(this.value1));

        // let a = "jenishgangani238@gmail.com" ;
        // console.log('1');
        // for (let i = 0; i < JSON.stringify(this.selectValue.length); i++) {
        //     console.log('2');
        //     a = `${a}` +','+ `${this.selectValue[i]}`;
        // }
        // this.toP = a;
        // console.log('a:::' + JSON.stringify(a));

        // console.log('3');
        // a = a.replaceAll("\"(.+)\"", "$1");
        // // a = JSON.stringify(a).substring(1,  JSON.stringify(a.length()) - 1);
        // console.log('4');
        // console.log('a:::' + JSON.stringify(a));
        // console.log('5');
