
public class sendmail {
  
@auraEnabled
public static void sendMailWithPDF(String recordId, String subject, String body)
{
   Contact cc = [Select Email FROM Contact WHERE Id =: recordId ];
    list<ContentVersion> conVer=[Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FirstPublishLocationId =: recordId];
    System.debug('conver::::'+conVer);

String mimeBody = '';

String nl = '\n';

String boundary = '__ctrlq_dot_org__';   

mimeBody += 'MIME-Version: 1.0\n';

mimeBody += 'To: '+ cc.Email +'\n';

mimeBody += 'cc: jenishgangani239@gmail.com\n';

mimeBody += 'bcc: jenishgangani239@gmail.com\n';

mimeBody += 'Subject: '+subject+' \n';

mimeBody += 'Hello Testing\n';

mimeBody += 'Content-Type: multipart/mixed; boundary='+boundary+'\n';

mimeBody += '--'+boundary+'\n';

mimeBody += 'Content-Type: text/plain; charset=UTF-8\n';

mimeBody += 'Content-Transfer-Encoding: base64\n';

mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';

mimeBody += '--'+boundary+'\n';

mimeBody += 'Content-Type: text/html; charset=UTF-8\n';

mimeBody += 'Content-Transfer-Encoding: base64\n\n';

mimeBody += EncodingUtil.base64Encode(blob.valueOf(body))+'\n\n';

mimeBody += '--'+boundary+'\n';

   for(ContentVersion cv:conVer){

mimeBody += 'Content-Type:'+cv.Title+'/'+cv.FileType+''+';name=' + cv.Title + '\n';

mimeBody += 'Content-Disposition: attachment; filename="' + cv.PathOnClient + '"\n';

mimeBody += 'Content-Transfer-Encoding: base64\n\n';

mimeBody += Encodingutil.base64Encode(cv.VersionData) + '\n\n';

}

mimeBody += '--'+boundary+'--';

// System.debug('mm::'+ mimeBody);

Http http = new Http();

HttpRequest req = new HttpRequest();  

req.setEndpoint('callout:Gmail_API/upload/gmail/v1/users/jenishgangani238@gmail.com/messages/send');

//(Gmail_API)API Name of Name credential

   req.setHeader('Authorization', 'Bearer ');

req.setHeader('Content-Type', 'message/rfc822');

   req.setBody('{"raw":"'+ mimeBody +'"}');

   req.setMethod('POST');

   req.setTimeout(60 * 1000);

   system.debug('req——>>'+req);

HttpResponse response = http.send(req);

   system.debug('response——>>'+response.getBody());

   System.debug(response);

if (response.getStatusCode() != 201) {

       System.debug('The status code returned was not expected: ' +

                    response.getStatusCode() + ' ' + response.getStatus());  

} else {

       System.debug(response.getBody());

} 

   }
}








    // @auraEnabled
    // public static void sendMailWithPDF(String recordId, String subject, String body){
    //  List<Contact> cc = [SELECT Id, Name, Email FROM Contact WHERE Id =: recordId];
    //  List<Attachment> ac = [SELECT Id,Name,Body,ContentType FROM Attachment where parentId =: recordId];
       
    //  Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    //  List<ContentVersion> getVersionFiles = [
    //     SELECT Id,Title,ContentDocumentId,FileType,ContentSize,FileExtension,VersionNumber,CreatedDate,VersionData,FirstPublishLocationId FROM ContentVersion WHERE FirstPublishLocationId =: recordId ];
        // Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();


        // List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
// for (Attachment file: ac) {

//   Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
//   efa.setFileName(file.Name);
//   efa.setBody(file.Body);
//   efa.setContentType(file.ContentType);
//   attachments.add(efa);
// }



//         HttpRequest req = new HttpRequest();
//         String toAddress = cc[0].Email;

//         String mbody = '{ "raw" : "' + EncodingUtil.base64Encode(Blob.valueof( 'To: ' + toAddress + '\r\nContent-Type:text/plain; charset=utf-8;\r\nSubject: ' + subject + '\r\n\r\n' + body  )) +   '" }';
//         req.setHeader('Content-Length', mbody.length()+'');
//         req.setHeader('Content-Type', 'application/json');

//         req.setEndpoint('callout:Gmail_API/gmail/v1/users/jenishgangani238@gmail.com/messages/send');
//         req.setMethod('POST');
//         system.debug(mbody);
//         req.setBody(mbody);
//         Http h = new Http();
//         HttpResponse res = h.send(req);
//         system.debug(res);
    
//     }


    

// }





// @auraEnabled
// public static void sendMailWithPDF(String recordId, String subject, String body)
// {

//     list<ContentVersion> conVer=[Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FirstPublishLocationId =: recordId];

    // String mimeBody = '';

    // String nl = '\n';

    // String boundary = '__ctrlq_dot_org__';   

    // mimeBody += 'MIME-Version: 1.0\n';

    // mimeBody += 'To: jenishgangani239@gmail.com\n';

    // mimeBody += 'cc: jenishgangani239@gmail.com\n';

    // mimeBody += 'bcc: jenishgangani239@gmail.com\n';

    // mimeBody += 'Subject: Email_Testing \n';

    // mimeBody += 'Hello Testing\n';

    // mimeBody += 'Content-Type: multipart/mixed; boundary='+boundary+'\n';

    // mimeBody += '-'+boundary+'\n';

    // mimeBody += 'Content-Type: text/plain; charset=UTF-8\n';

    // mimeBody += 'Content-Transfer-Encoding: base64\n';

    // mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';

    // mimeBody += '-'+boundary+'\n';

    // mimeBody += 'Content-Type: text/html; charset=UTF-8\n';

    // mimeBody += 'Content-Transfer-Encoding: base64\n\n';

    // mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';

    // mimeBody += '-'+boundary+'\n';

    //    for(ContentVersion cv:conVer){

    // mimeBody += 'Content-Type:image/png'+';name='+cv.Title+'\n';

    // mimeBody += 'Content-Disposition: attachment; filename="'+cv.PathOnClient+'"\n';

    // mimeBody += 'Content-Transfer-Encoding: base64\n\n';

    // mimeBody += Encodingutil.base64Encode(cv.VersionData)+'\n\n';

    // }

    // mimeBody += '-'+boundary+'-';

//     System.debug('mmm:::::'+ mimeBody); 

//     Http http = new Http();

//     HttpRequest req = new HttpRequest();  

//    req.setEndpoint('callout:Gmail_API/upload/gmail/v1/users/jenishgangani238@gmail.com/messages/send?uploadType=media');

// //(Gmail_API)API Name of Name credential

//        req.setHeader('Authorization', 'Bearer ');

//    req.setHeader('Content-Type', 'message/rfc822');

//        req.setBody('{"raw":"'+ mimeBody +'"}');

//        req.setMethod('POST');

//        req.setTimeout(60 * 1000);

//        system.debug('req——>>'+req);

//     HttpResponse response = http.send(req);

//        system.debug('response——>>'+response.getBody());

//        System.debug(response);

//     if (response.getStatusCode() != 201) {

//            System.debug('The status code returned was not expected: ' +

//                         response.getStatusCode() + ' ' + response.getStatus());  

//     } else {

//            System.debug(response.getBody());

//     } 
// }

// }


// req.setEndpoint('callout:Gmail/jenishgangani238@gmail.com/drafts');
// req.setMethod('GET');
// Http http = new Http();
// HTTPResponse res = http.send(req);
// System.debug(res.getBody());

// Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
// Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
// PageReference pref = page.inttask; // Visualforce Page Name
// pref.getParameters().put('Id',recordId);
// pref.setRedirect(true);
// Blob b;
// b = pref.getContent();
// attach.setFileName('ContactDetails.pdf');
// attach.setBody(b);
// semail.setSubject('Contact details');
// List<String> sendTo = new List<String>();
// sendTo.add(cc[0].Email);
// semail.setOrgWideEmailAddressId(res.getBody());
// semail.setToAddresses(sendTo);
// semail.setPlainTextBody('Please find the attached contact details');
// semail.setFileAttachments(new Messaging.EmailFileAttachment[]{attach});
// Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});


// @AuraEnabled
// public static boolean deleteAttachments(Id attachId){
    
//     if(attachId != NULL){
//         ContentDocument file = [Select Id from ContentDocument where Id = :attachId];
//         delete file;
//         return true;
//     }
//     else{
//         return false;
//     }
// }



// @AuraEnabled
//     public static List<ContentVersion> getAttachments(String conId){
        
//         List<ContentDocumentLink> CDLs = [Select ContentDocumentId 
//                                           from ContentDocumentLink 
//                                           where LinkedEntityId = : conId];
        
//         System.debug('CDLs::::'+CDLs);
//         if(CDLs != NULL && CDLs.size() > 0){
//         Set<Id> CDIdList = new Set<Id>();
//         for (ContentDocumentLink nextCDL : CDLs) {
//             CDIdList.add(nextCDL.ContentDocumentId); 
//         }
//         System.debug('CDIdList::::'+CDIdList);        
        
//         List<ContentDocument> entries = [SELECT Id, Title, FileType FROM ContentDocument WHERE ContentDocument.Id IN :CDIdList];
//         System.debug('entries::::'+entries);
            
//         List<ContentVersion> CVmainList = new List<ContentVersion>();  
//         List<ContentVersion> CVList = [SELECT Id, ContentDocumentId, isLatest, Title 
//                                        FROM ContentVersion 
//                                        WHERE ContentDocumentId = :CDIdList AND isLatest = true];

//             return CVList;
//         }
//         else{
//             List<ContentVersion> CV = new List<ContentVersion>();
//             CV = NULL;
//             return CV;
//         }
//     }



         
// List<Contact> startups = [SELECT Id, (SELECT Id FROM Attachments) FROM Contact WHERE Id = :recordId];
// System.debug(startups);
// Set<Id> attachmentIds = (new Map<Id, Contact>(startups[0])).keySet();

// List<Attachment> files = [SELECT Name, Body, ContentType FROM Attachment WHERE Id IN :attachmentIds];

// List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
// for (Attachment file: files) {
// Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
// efa.setFileName(file.Name);
// efa.setBody(file.Body);
// efa.setContentType(file.ContentType);
// attachments.add(efa);
// }