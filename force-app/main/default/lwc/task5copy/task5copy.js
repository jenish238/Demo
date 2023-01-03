
import { LightningElement, track } from 'lwc';
import getAccountData from '@salesforce/apex/copyTask.getAccountData';
import getAccount from '@salesforce/apex/copyTask.getAccount';



export default class Task5copy extends LightningElement {
    @track value;
    @track options =
        [
            { label: 'Account', value: 'Account' },
            { label: 'Contact', value: 'Contact' },
            { label: 'Lead', value: 'Lead' },
            { label: 'Opportunity', value: 'Opportunity' },
            { label: 'Contract', value: 'Contract' },
            { label: 'Price Book', value: 'Pricebook2' },
            { label: 'Student', value: 'Student__c' },
            { label: 'School', value: 'School__c' }
        ];
    @track allValues = [];

    handleChange(event) {
        if (!this.allValues.includes(event.target.value)) { this.allValues.push(event.target.value); }
        console.log(JSON.stringify(this.allValues));
        this.serchrecode();
    }

    handleRemove(event) {
        const valueRemoved = event.target.name;
        this.allValues.splice(this.allValues.indexOf(valueRemoved), 1);
        console.log(JSON.stringify(this.allValues));
        this.serchrecode();

    }
    @track searchKey;
    @track accounts;
    @track Contacts;
    @track Leads;
    @track Opportunitys;
    @track Contracts;
    @track Pricebook2s;
    @track Students;
    @track Schools;
    @track logins;
    //This Funcation will get the value from Text Input.
    handelSearchKey(event) {
        this.searchKey = event.target.value;
        console.log('serinput:::::::::' + this.searchKey);
    }

    // This funcation will fetch the Account Name on basis of searchkey
    SearchAccountHandler(event) {
        //call Apex method.
        const a = {
            textkey: this.searchKey
        }
        console.log('function');
        getAccountData(a)
            .then(result => {
                alert('1');
                for (let index = 0; index < JSON.stringify(this.allValues.length); index++) {
                    if (this.allValues[index] === 'Account') { this.accounts = result[0]; }
                    else if (this.allValues[index] === 'Contact') { this.Contacts = result[1]; }
                    else if (this.allValues[index] === 'Lead') { this.Leads = result[2]; }
                    else if (this.allValues[index] === 'Opportunity') { this.Opportunitys = result[3]; }
                    else if (this.allValues[index] === 'Contract') { this.Contracts = result[4]; }
                    else if (this.allValues[index] === 'Pricebook2') { this.Pricebook2s = result[5]; }
                    else if (this.allValues[index] === 'Student__c') { this.Students = result[6]; }
                    else if (this.allValues[index] === 'School__c') { this.Schools = result[7]; }

                }
                console.log(JSON.stringify(result[0]));
                // this.accounts = result;
            })
            .catch(error => {
                console.log(error);
            });

    }
    cols = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone' }

    ]
    cols1 = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'LastName', fieldName: 'LastName' }
    ]
    cols2 = [
        { label: 'Lead Name', fieldName: 'Name' },
        { label: 'Lead Email', fieldName: 'Email' }
    ]

    cols3 = [
        { label: 'Opportunity Name', fieldName: 'Name' },
        { label: 'Opportunity stage', fieldName: 'StageName' }
    ]
    cols4 = [
        { label: 'Contracts Name', fieldName: 'Name' },
        { label: 'Status', fieldName: 'Status' }
    ]
    cols5 = [
        { label: 'Pricebook2 Name', fieldName: 'Name' },
        { label: 'Description', fieldName: 'Description' }
    ]
    cols6 = [
        { label: 'Student Name', fieldName: 'Student_Name__c' },
        { label: 'Student Email', fieldName: 'Student_Email__c' }
    ]
    cols7 = [
        { label: 'School Name', fieldName: 'School_Name__c' },
        { label: 'School Total_Student', fieldName: 'Total_Student__c' }
    ]


    serchrecode() {
        for (let index = 0; index < JSON.stringify(this.allValues.length); index++) {
            console.log('for loop' + JSON.stringify(this.allValues.length));
            if (this.allValues[index] === 'Account') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Phone',
                    filed3: 'Account'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('aaacc');
                        if (result != null) {
                            this.accounts = result;
                        }
                       
                    })
                    .catch(error => {
                    });
                // console.log('result' + JSON.stringify(result));

            } else if (this.allValues[index] === 'Contact') {
                const filed = {
                    filed1: 'FirstName',
                    filed2: 'LastName',
                    filed3: 'Contact'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('cccconli');
                        if (result != null) {
                            this.Contacts = result;
                        }
                       
                    })
                    .catch(error => {
                    });


            } else if (this.allValues[index] === 'Lead') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Email',
                    filed3: 'Lead'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('lllllead');
                        if (result != null) {
                            this.Leads = result;
                        }
                    })
                    .catch(error => {
                    });

            } else if (this.allValues[index] === 'Opportunity') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'StageName',
                    filed3: 'Opportunity'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('Opportunity');
                        if (result != null) {
                            this.Opportunitys = result;
                        }
    
                    })
                    .catch(error => {
                    });

            } else if (this.allValues[index] === 'Contract') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Status',
                    filed3: 'Contract'
                };

                getAccount(filed)
                    .then(result => {
                        console.log('Contract');
                        if (result != null) {
                            this.Contracts = result;
                        }
                        
                    })
                    .catch(error => {
                    });
            } else if (this.allValues[index] === 'Pricebook2') {
                const filed = {
                    filed1: 'Name',
                    filed2: 'Description',
                    filed3: 'Pricebook2'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('Pricebook2');
                        if (result != null) {
                            this.Pricebook2s = result;
                        }
                    })
                    .catch(error => {
                        this.accounts = null;
                    });

            } else if (this.allValues[index] === 'Student__c') {
                const filed = {
                    filed1: 'Student_Name__c',
                    filed2: 'Student_Email__c',
                    filed3: 'Student__c'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('Student__c');
                        if (result != null) {
                            this.Students = result;
                        }
                    })
                    .catch(error => {
                    });

            } else if (this.allValues[index] === 'School__c') {
                const filed = {
                    filed1: 'School_Name__c',
                    filed2: 'Total_Student__c',
                    filed3: 'School__c'
                };
                getAccount(filed)
                    .then(result => {
                        console.log('School__c');
                        if (result != null) {
                            this.Schools = result;
                        }
                    })
                    .catch(error => {
                    });

            }




        }
    }
}



// console.log('x' + JSON.stringify(this.accounts));
//             console.log(JSON.stringify(this.Contacts));
//             console.log(JSON.stringify(this.Leads));
//             console.log(JSON.stringify(this.Opportunitys));
//             console.log(JSON.stringify(this.Contracts));
//             console.log(JSON.stringify(this.Pricebook2s));
//             console.log(JSON.stringify(this.Students));
//             console.log(JSON.stringify(this.Schools));

