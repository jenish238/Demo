import { LightningElement,api,track} from 'lwc';

export default class Task5MultiList extends LightningElement {

@api a 
@track value = '';
get options() {
    return  [{label : 'Account', value : 'Account',},
    {label : 'Contact', value : 'Contact',},
    {label : 'Lead', value : 'Lead'},
    {label : 'Opportunity', value : 'Opportunity'},
    {label : 'Contract', value : 'Contract'},
    {label : 'Price Book', value : 'Pricebook2'},
    {label : 'Student', value : 'Student__c'},
    {label : 'School', value : 'School__c'},
    {label : 'login', value : '	login__c'}];
}
       


                fetchSelectedValues(event){
                    this.value = event.detail.value;
                    const select = event.detail.value;
                    alert(select);
                    let selections = this.template.querySelector('c-mutli-select-picklist');
                    console.log(selections.value);
                }
}
