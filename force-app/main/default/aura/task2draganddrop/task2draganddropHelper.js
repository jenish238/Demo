({
    UpdateRecode1 : function(component, event,helper,conId1,conAccountName) {
      
        var action = component.get("c.updateACcountName");
        action.setParams({
            conId: conId1,
            AccName:conAccountName
        });
        action.setCallback(this, function(a) {
            component.set("v.contact2", a.getReturnValue());
            console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action); 
    },
    UpdateRecode2 : function(component, event,helper,conId1,conAccountName) {
      
        var action = component.get("c.updateACcountName");
        action.setParams({
            conId: conId1,
            AccName:conAccountName
        });
        action.setCallback(this, function(a) {
            component.set("v.contact1", a.getReturnValue());
            console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action); 
    }
})