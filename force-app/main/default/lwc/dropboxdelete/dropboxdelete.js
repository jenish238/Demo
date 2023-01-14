import { api,track, LightningElement,wire } from 'lwc';
import deleteFile from '@salesforce/apex/dropbox1.deleteFolderOrFile';
import getFileData from '@salesforce/apex/dropbox1.getFileData';
import genrateLongTimeAccessToken from '@salesforce/apex/dropbox1.genrateLongTimeAccessToken';




export default class Dropboxdelete extends LightningElement {
    @api recordId;
    @track records;
    @track recordsToDisplay = [];

     value = [];
    
        get options() {
    
          let columns = [];
          let arr =[];
          arr = this.recordsToDisplay;
          console.log('arr::::'+ arr[0]);
            for (let index = 0; index < this.recordsToDisplay.length; index++) {
                columns.push({ label: arr[index], value: arr[index] });  
          }
      return columns;
        }
               
    
        get selectedValues() {  
        return this.value.join(',');
    }
    
    handleChange(e) {
        this.value = e.detail.value;
    }
    handleClick1(event){
       genrateLongTimeAccessToken().then(result=>{console.log('token genrate');})
       .catch(error=>{console.log('error---->',error);});
 }
    
    
    connectedCallback(){
         
           getFileData()
        .then(result=> {
               console.log('result-->',result);
               this.records = result;
               for (let index = 0; index < result.length; index++) {
                this.recordsToDisplay.push(this.records[index]);
               } 
         })
        .catch(error => {
               console.log('error-->',error);
         });
    
    }
    handleDelete(event){

        deleteFile({toDeleteFile : this.value})
     .then(result=> {
            console.log('result-->',result);
            getFileData()
            .then(result=> {
                   console.log('result 1-->',result);
                   this.records = result;
                   this.recordsToDisplay = [];
                   for (let index = 0; index < result.length; index++) {
                    this.recordsToDisplay.push(this.records[index]);
                   } 
             })
            .catch(error => {
                   console.log('error-->',error);
             });
        
      })
     .catch(error => {
            console.log('error-->',error);
      });
 
    
    alert('file deleted'); 
    window.location.reload(); 
    //    this.options();
      
 }


}
// refreshComponent(event){
//     eval("$A.get('e.force:refreshView').fire();");
// }


 //   for (let i = 0; i < columns.length; i++) {
        //       delete columns[i];
        //       console.log('column'+columns);
                
        //   }
          

        //   delete this.records;
    //   delete this.recordsToDisplay;
    //   getFileData()
    //   .then(result=> {
    //          console.log('resultAfterDeleted-->',result);
    //          this.records = result;
    //          for (let index = 0; index < result.length; index++) {
    //           this.recordsToDisplay.push(this.records[index]);
    //          } 
    //          console.log('file');  
    //          console.log('1'+this.recordsToDisplay);
  
    //          console.log('2'+JSON.stringify(this.records));
             
    //    })
    //   .catch(error => {
    //          console.log('error-->',error); 
    //    });
    // wiredActivities;
    // @wire (getFileData)
    // wiredAccount(result) {
    //         this.wiredActivities = result;
    // }