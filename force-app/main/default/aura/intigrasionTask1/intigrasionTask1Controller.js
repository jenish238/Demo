({
    sendMail : function(component, event, helper) {
        var action = component.get("c.sendMailWithPDF");
        var emailSubject = component.get("v.subject");
        var emailBody = component.get("v.body");
        action.setParams({
            'recordId' : component.get('v.recordId'),
            "subject" : emailSubject,
            "body" : emailBody,
        })
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // alert('Email Sent Successfully');
                $A.get("e.force:closeQuickAction").fire();
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    }
})