import { LightningElement, wire, track } from 'lwc';
import getFileVersions from "@salesforce/apex/getfile.getVersionFiles1";
import { refreshApex } from "@salesforce/apex";

export default class Task2PeriveandNext extends LightningElement {
    loaded = true;
    pageSizeOptions = [5];
    @track records;
    columns = []; 
    totalRecords = 0;
    pageSize;
    totalPages;
    pageNumber = 1;
    @track recordsToDisplay = [];
    columns = [
        { label: 'fileTitle', fieldName: 'Title' },
        { label: 'fileExtension', fieldName: 'FileExtension' },
        { label: 'fileContentDocumentId', fieldName: 'ContentDocumentId' },
        { label: 'fileContentDocument', fieldName: 'ContentDocument' },
        { label: 'fileCreatedDate', fieldName: 'CreatedDate' }
    ];
     wiredActivities;
    @wire (getFileVersions)
    wiredAccount(result) {
        
            this.wiredActivities = result;
            this.records = result.data;
            this.connectedCallback1();
          
    }
    connectedCallback1() {
    
    getFileVersions()
            .then((result) => {
                if (result != null) {

                    this.records = result;
                    this.totalRecords = result.length; // update total records count                 
                    this.pageSize = this.pageSizeOptions[0]; 
                    console.log('2');//set pageSize with default value as first option
                    this.paginationHelper(); // call helper menthod to update pagination logic 
                }
            })
            .catch((error) => {
                console.log('error while fetch contacts--> ' + JSON.stringify(error));
            });
}
    
    
    get bDisableFirst() {
        return this.pageNumber == 1;
    }
    get bDisableLast() {
        return this.pageNumber == this.totalPages;
    }
    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }
    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }
    firstPage() {
        this.pageNumber = 1;
        this.paginationHelper();
    }
    lastPage() {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }
    // JS function to handel pagination logic 
    paginationHelper() {
        this.recordsToDisplay = [];
        // calculate total pages
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        // set page number 
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }
        // set records to display on current page 
        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.records[i]);
        }
        console.log('hello::::::'+JSON.stringify(this.recordsToDisplay));
    }
   
    meth1(event){
        return refreshApex(this.wiredActivities);
    }

}




// thumbnailFileCard:
//                         "/sfc/servlet.shepherd/version/renditionDownload?rendition=THUMB720BY480&versionId=" +
//                         this.fileList[i].Id +
//                         "&operationContext=CHATTER&contentId=" +
//                         this.fileList[i].ContentDocumentId,
//                     downloadUrl:
//                         "/sfc/servlet.shepherd/document/download/" +
//                         this.fileList[i].ContentDocumentId




 // getFileVersions()
        //     .then((result) => {
        //         if (result != null) {
        //             console.log('RESULT--> ' + result.length);
        //             this.records = result;
        //             this.totalRecords = result.length; // update total records count                 
        //             this.pageSize = this.pageSizeOptions[0]; 
        //             console.log('1');//set pageSize with default value as first option
        //             alert('3');
        //             this.paginationHelper(); // call helper menthod to update pagination logic 
        //         }
        //     })
        //     .catch((error) => {
        //         console.log('error while fetch contacts--> ' + JSON.stringify(error));
        //     });
        // alert('2');


 
    // this.fileList = data;
            // for (let i = 0; i < this.fileList.length; i++) {
            //     let file = {
            //         Id: this.fileList[i].Id,
            //         Title: this.fileList[i].Title,
            //         Extension: this.fileList[i].FileExtension,
            //         ContentDocumentId: this.fileList[i].ContentDocumentId,
            //         ContentDocument: this.fileList[i].ContentDocument,
            //         CreatedDate: this.fileList[i].CreatedDate,

            //     };
            //     this.files.push(file);
            //     console.log('fileList' + fileList);
            //     console.log('fileList' + files);

            // }
            // this.loaded = true



        // @track accountList;

    // @wire(getFileVersions)
    // wiredContentVersions({ d, error }) {

    //     console.log(JSON.stringify(d));
    //     this.accountList = d;
    //     this.records = d;
    //     console.log('accountList' + this.accountList);
    //     this.totalRecords = records.length; // update total records count                 
    //     this.pageSize = this.pageSizeOptions[0]; //set pageSize with default value as first option
    //     this.paginationHelper()
    // }



      // console.log('aa'+ JSON.stringify(this.records));
            // let a =JSON.stringify(this.records);
            // console.log(a);
            // // console.log('RESULT--> ' +JSON.stringify(this.records));

            // // this.totalRecords = this.records.length ;// update total records count           
            // this.totalRecords = 20  ;// update total records count                 
      
            // this.pageSize = this.pageSizeOptions[0]; 
            // console.log('2');//set pageSize with default value as first option
            // this.paginationHelper();


             // handleFilesChange(event) {
    //     const uploadedFiles = event.detail.records;
    //     alert('1');
    //     this.connectedCallback();
    //     // alert('No. of files uploaded : ' + uploadedFiles.length);
    // }
            