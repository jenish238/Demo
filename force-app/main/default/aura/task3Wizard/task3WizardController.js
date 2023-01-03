({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        
        
        if(showAccount == true){
            var accountName = component.find("Name").get("v.value");
            console.log('accountName:::'+accountName);
            // document.getElementById("a1").removeClass = "";
            var element1 = document.getElementById("a2");
             element1.classList.add("slds-is-active");

            if(accountName =='' || accountName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showContact",false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", true);
                component.set("v.showEvent", false); 
                component.set("v.showError", false);
                component.set("v.showData", false);
            }
        }    
        if(showContact == true){
            var lastName = component.find("LastName").get("v.value");
            console.log('lastName:::'+lastName);
            var element1 = document.getElementById("a3");
            element1.classList.add("slds-is-active");
            if(lastName =='' || lastName == null){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showEvent", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
            }
            else
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showEvent", true);
                component.set("v.showError", false);
                component.set("v.showData", false);
            }
        }   
        
        if(showEvent == true){
            var OpportunityName = component.find("EventLocation").get("v.value");
            console.log('EventLocation:::'+OpportunityName);
            var element1 = document.getElementById("a4");
            element1.classList.add("slds-is-active");
            var StageName = component.find("StartDate").get("v.value");
            console.log('StageName:::'+StageName);
            var closeDate = component.find("EndDate").get("v.value");
            console.log('closeDate:::'+closeDate);
            if((OpportunityName =='' || OpportunityName == null) || (StageName =='' || StageName == null) || (closeDate =='' || closeDate == null)){
                component.set("v.setMessage",'error');           
            }
            if(component.get("v.setMessage")=='error')
            { 
                component.set("v.showAccount", false);
                component.set("v.showContact", false);
                component.set("v.showError", true);
                component.set("v.showData", false);
                
            }
            else
            { 
                component.set("v.showEvent", false);
                component.set("v.showContact", false);
                component.set("v.showAccount", false)
                component.set("v.showError", false);
                component.set("v.showData", true);
            }
        }   
        
    },
    prevTab : function(component, event, helper) {
        var showAccount = component.get("v.showAccount");
        var showContact = component.get("v.showContact");
        var showEvent = component.get("v.showEvent");
        var showData = component.get("v.showData");
        
        
        if(showContact == true){
            var element = document.getElementById("a2");
            element.classList.remove("slds-is-active");
            component.set("v.showAccount", true);
            component.set("v.showContact", false);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
        }    
        if(showEvent == true){
            var element = document.getElementById("a3");
            element.classList.remove("slds-is-active");
            component.set("v.showAccount", false);
            component.set("v.showContact", true);
            component.set("v.showEvent", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
        } 
        if(showData == true){
            var element = document.getElementById("a4");
            element.classList.remove("slds-is-active");
            component.set("v.showAccount", false);
            component.set("v.showContact", false);
            component.set("v.showEvent", true);
            component.set("v.showError", false);
            component.set("v.showData", false);
        }  
    },
    
    saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);
        var pageNumber = component.get("v.number2");
        pageNumber = 1 + pageNumber;
        component.set('v.number2',pageNumber);               
    }
})