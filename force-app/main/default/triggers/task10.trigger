trigger task10 on Contact (after insert) {
if (Trigger.isInsert) {
    for (Contact con : Trigger.new) {
        if (con.LastName!=null && con.Level__c!=null) {
            // Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
            // req1.setComments('Submitting request for approval.'); 
            // req1.setObjectId(con.Id);
            // // req1.setSubmitterId( UserInfo.getUserId() );
            // // req1.setProcessDefinitionNameOrId('Contact Level');
            // Approval.process(req1);

            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            req.setObjectId(con.Id);
            // submit the approval request for processing
            Approval.ProcessResult result = Approval.process(req);
            // display if the reqeust was successful
            System.debug('Submitted for approval successfully: '+result.isSuccess());
        }
    }
}
}

// trigger task10 on Contact (after insert) {
//     if (Trigger.isInsert) {
//         for (Contact con : Trigger.new) {
//             if (con.LastName!=null && con.Level__c!=null) {
//                 // Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
//                 // req1.setComments('Submitting request for approval.'); 
//                 // req1.setObjectId(con.Id);
//                 // // req1.setSubmitterId( UserInfo.getUserId() );
//                 // // req1.setProcessDefinitionNameOrId('Contact Level');
//                 // Approval.process(req1);
    
//                 Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
//                 req.setComments('Submitted for approval. Please approve.');
//                 req.setObjectId(con.Id);
//                 // submit the approval request for processing
//                 Approval.ProcessResult result = Approval.process(req);
//                 // display if the reqeust was successful
//                 System.debug('Submitted for approval successfully: '+result.isSuccess());
//             }
//         }
//     }
//     }