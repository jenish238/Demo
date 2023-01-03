import { LightningElement, track, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
const options = [
    {'label' : 'Account', 'value' : 'Account',},
    {'label' : 'Contact', 'value' : 'Contact',},
    {'label' : 'Lead', 'value' : 'Lead'},
    {'label' : 'Opportunity', 'value' : 'Opportunity'},
    {'label' : 'Contract', 'value' : 'Contract'},
    {'label' : 'Price Book', 'value' : 'Pricebook2'},
    {'label' : 'Student', 'value' : 'Student__c'},
    {'label' : 'School', 'value' : 'School__c'},
    {'label' : 'login', 'value' : '	login__c'}
                ];
 
export default class MultiSelectPickListParent extends LightningElement {
    @track selectedValue = '';//selected values
    @track selectedValueList = [''];//selected values
    @track options; //= options;
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    wirePickList({ error, data }) {
        if (data) {
            this.options = data.values;
        } else if (error) {
            console.log(error);
        }
    }
     
    //for single select picklist
    handleSelectOption(event){
        console.log(event.detail);
        this.selectedValue = event.detail;
    }
 
    //for multiselect picklist
    handleSelectOptionList(event){
        console.log(event.detail);
        this.selectedValueList = event.detail;
        console.log(this.selectedValueList);
    }
}




// objectInfo;
 
//     //fetch picklist options
//     @wire(getPicklistValues, {
//         recordTypeId: "$objectInfo.data.defaultRecordTypeId",
//         fieldApiName: TYPE_FIELD
//     })