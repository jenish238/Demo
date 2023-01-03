import { api,track, LightningElement,wire } from 'lwc';
import uploadFiles from '@salesforce/apex/dropbox1.uploadFiles';
import fileDeta from '@salesforce/apex/dropbox1.fileDeta';

import deleteFile from '@salesforce/apex/dropbox1.deleteFolderOrFile';
import getFileData from '@salesforce/apex/dropbox1.getFileData';
import { refreshApex } from "@salesforce/apex";
import { CurrentPageReference } from 'lightning/navigation';





export default class Droptask extends LightningElement {

@api recordId;
@track records;
@track recordsToDisplay = [];



wiredActivities;
@wire (fileDeta,{recordId : '$recordId'})
wiredAccount(result){
        this.wiredActivities = result;   
}

handleActionFinished(event) {
      uploadFiles({recordId : this.recordId})
 .then(result=> {
        console.log('result-->',result);
        return refreshApex(this.wiredActivities);
  })
 .catch(error => {
        console.log('error-->',error);
  });
  window.location.reload(); 

}


}




// connectedCallback(){
     
//        getFileData()
//     .then(result=> {
//            console.log('result-->',result);
//            this.records = result;
//            for (let index = 0; index < result.length; index++) {
//             this.recordsToDisplay.push(this.records[index]);
//            } 
//      })
//     .catch(error => {
//            console.log('error-->',error);
//      });

// }


// this.recordsToDisplay = [{"id":"1","Name":"int2.TEXT"},{"id":"2","Name":"info.TEXT"},{"id":"3","Name":"im3.PNG"},{"id":"4","Name":"1 (1).JPG"},{"id":"5","Name":"callbackFunction.TEXT"}]


// [{"Id":"0685g000006ThLVAA0","Title":"photo2-removebg-preview","ContentDocumentId":"0695g0000068GW1AAM","FileType":"PNG","ContentSize":22843,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-04T11:29:13.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000Tfo7FEAR","VersionData":"BLOB(22843 bytes)"},{"Id":"0685g000006ThZGAA0","Title":"HOW-DO-YOU-DESIGN-A-LIBRARY-MANAGEMENT-SYSTEM-min","ContentDocumentId":"0695g0000068GndAAE","FileType":"PNG","ContentSize":78915,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:37:24.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoTLEAZ","VersionData":"BLOB(78915 bytes)"},{"Id":"0685g000006ThZfAAK","Title":"HOW-DO-YOU-DESIGN-A-LIBRARY-MANAGEMENT-SYSTEM-min","ContentDocumentId":"0695g0000068Go2AAE","FileType":"PNG","ContentSize":78915,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:45:25.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoU4EAJ","VersionData":"BLOB(78915 bytes)"},{"Id":"0685g000006ThZuAAK","Title":"photo2-removebg-preview","ContentDocumentId":"0695g0000068GoHAAU","FileType":"PNG","ContentSize":22843,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:56:53.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoUYEAZ","VersionData":"BLOB(22843 bytes)"},{"Id":"0685g000006UP9PAAW","Title":"WhatsApp Image 2022-12-09 at 9.11.33 AM (1)","ContentDocumentId":"0695g00000690U0AAI","FileType":"JPEG","ContentSize":56405,"FileExtension":"jpeg","VersionNumber":"1","CreatedDate":"2022-12-09T15:54:22.000Z","FirstPublishLocationId":"0015g000013RH1FAAW","ContentBodyId":"05T5g00000btoFxEAI","VersionData":"BLOB(56405 bytes)"}]
// task2PeriveandNext.js:1 2
// task2PeriveandNext.js:1 hello::::::[{"Id":"0685g000006ThLVAA0","Title":"photo2-removebg-preview","ContentDocumentId":"0695g0000068GW1AAM","FileType":"PNG","ContentSize":22843,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-04T11:29:13.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000Tfo7FEAR","VersionData":"BLOB(22843 bytes)"},{"Id":"0685g000006ThZGAA0","Title":"HOW-DO-YOU-DESIGN-A-LIBRARY-MANAGEMENT-SYSTEM-min","ContentDocumentId":"0695g0000068GndAAE","FileType":"PNG","ContentSize":78915,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:37:24.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoTLEAZ","VersionData":"BLOB(78915 bytes)"},{"Id":"0685g000006ThZfAAK","Title":"HOW-DO-YOU-DESIGN-A-LIBRARY-MANAGEMENT-SYSTEM-min","ContentDocumentId":"0695g0000068Go2AAE","FileType":"PNG","ContentSize":78915,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:45:25.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoU4EAJ","VersionData":"BLOB(78915 bytes)"},{"Id":"0685g000006ThZuAAK","Title":"photo2-removebg-preview","ContentDocumentId":"0695g0000068GoHAAU","FileType":"PNG","ContentSize":22843,"FileExtension":"png","VersionNumber":"1","CreatedDate":"2022-10-05T03:56:53.000Z","FirstPublishLocationId":"0055g00000F9sOOAAZ","ContentBodyId":"05T5g00000TfoUYEAZ","VersionData":"BLOB(22843 bytes)"},{"Id":"0685g000006UP9PAAW","Title":"WhatsApp Image 2022-12-09 at 9.11.33 AM (1)","ContentDocumentId":"0695g00000690U0AAI","FileType":"JPEG","ContentSize":56405,"FileExtension":"jpeg","VersionNumber":"1","CreatedDate":"2022-12-09T15:54:22.000Z","FirstPublishLocationId":"0015g000013RH1FAAW","ContentBodyId":"05T5g00000btoFxEAI","VersionData":"BLOB(56405 bytes)"}]
// return [
      //       { label: 'int2.TEXT', value: 'int2.TEXT' },
      //       { label: 'info.TEXT', value: 'info.TEXT' },
      //       { label: 'im3.PNG', value: 'im3.PNG' },
      //       { label: '1 (1).JPG', value: '1 (1).JPG' },
      //       { label: 'callbackFunction.TEXT', value: 'callbackFunction.TEXT' }
      //   ];


                  // console.log('1');
            // let checkbox = document.createElement('input');
            // console.log('1');
            // checkbox.type = 'checkbox';
            // console.log('1');
            // checkbox.id = 'car';
            // console.log('1');
            // checkbox.name = 'interest';
            // console.log('1');
            // checkbox.value = 'car';
            // console.log('1'); 
            // let label = document.createElement('label')
            // label.htmlFor = 'car';
            // label.appendChild(document.createTextNode('Car'));
         
            // let br = document.createElement('br');
         
            // let container = document.getElementById('container');
            // container.appendChild(checkbox);
            // container.appendChild(label);
            // container.appendChild(br);
            // console.log('task completed');
            //      let alist = [];
//        this.recordsToDisplay.forEach(function(element) {
//        alist.push({ label: recordsToDisplay, value: recordsToDisplay });
//      });
//      console.log('cccc');
//      return alist;
//    }
  //      columns = [
      //       { label: 'tag',fieldName: '.tag'},
      //       { label: 'fileName',fieldName: 'name'},  
      //       { label: 'path_lower',fieldName: 'path_lower'},
      //       { label: 'path_display',fieldName: 'path_display'}
      //   ];
       // getAccessToken({code : this.Id})
      // .then(token=> {
      //        console.log('token-->' , token);
      //  })
      // .catch(error => {
      //        console.log('error-->',error);
      //  });
      // @wire(CurrentPageReference)
// getStateParameters(currentPageReference) {
//   if (currentPageReference) {
//      this.urlStateParameters = currentPageReference.state;
//      this.setParametersBasedOnUrl();
//   }
// }

// setParametersBasedOnUrl() {
//   this.Id = this.urlStateParameters.id || null;
//  }