// import { LightningElement } from 'lwc';

// export default class Task2part1 extends LightningElement {}
import { LightningElement, api, wire, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import getRelatedFiles from '@salesforce/apex/newListFileClass.getRelatedFiles';

// const columns =[
//     {
//         lable:"Name",
//         fieldName:"ContentDocument.Id"
//     },
//     {
//         lable:"Type",
//         fieldName:"ContentDocument.FileType"
//     }
// ]
export default class Task2part1 extends NavigationMixin(LightningElement){
    @api label;
    @api formats = '.png, .jpg';
    @api recordId;
    filesList =[]
    totalfile
    visiblefile

    //for pagination
    // @track columns = columns;
    // @track files; //data store for display
    // @track items; //contains all records
    // @track startingRecord = 1;
    // @track page = 1;
    // @track endingRecord = 0;
    // @track totalRecordCount; // total records count
    // @track totalpage; //divded to how many pages
    // @track pageSize = 5;

    get acceptedFormats() {
        console.log(this.formats.split(','));
        return this.formats.split(',');
    }

    // @wire : To read Salesforce data, Lightning web components use a reactive wire service.
    // @wire(getRelatedFiles, { recordId: '$recordId' }) //apexMethod and apexMethodParams
    // files;                                            //propertyOrFunction                                              
    @wire(getRelatedFiles, {recordId: '$recordId'})
    wiredResult({data, error}){ 
        if(data){ 
            console.log(data)
            this.filesList = Object.keys(data).map(item=>({"label":data[item],
             "value": item,
             "url":`/sfc/servlet.shepherd/document/download/${item}`
            }))
            console.log(this.filesList)
            this.totalfile = this.filesList
             console.log('total con :- ' + this.filesList.length)
        }
        if(error){ 
            console.log(error)
        }
    }

    handleActionFinished(event) {
        //refresh the list of files
        refreshApex(this.files);
    }

    filePreview(event) {
        // Naviagation Service to the show preview
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state: {
                // assigning ContentDocumentId to show the preview of file
                selectedRecordId: event.currentTarget.dataset.id
            }
        })
    }

    updateContactHandler(event){
        this.visiblefile=[...event.detail.records]
        console.log(event.detail.records)
    }
}