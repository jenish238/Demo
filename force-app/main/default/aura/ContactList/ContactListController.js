({
    doInit: function(component, event, helper) {
        helper.getAccountList(component);

    },
    caList: function(component, event, helper) {
        var idx = event.target.getAttribute('data-index');
        var rowRecord = component.get('v.accounts')[idx];
        var pageSize = component.get("v.pageSize");
        var pageNumber = component.get("v.pageNumber");
        pageNumber=0;
        pageNumber = 1 + pageNumber;
        component.set('v.pageNumber',pageNumber);
        var action2 = component.get("c.conList");
        // var ia = component.target.Id;
        // console.log('ia:::::::'+ia);
        action2.setParams({
            AccName: rowRecord.Id
        });
        action2.setCallback(this, function(response)
        {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS")
        {
        component.set('v.Contacts', response.getReturnValue());
        component.set("v.totalSize", component.get("v.Contacts").length);
        component.set("v.start",0);
        component.set("v.end",pageSize-1);
        var paginationList = [];
        for(var i=0; i< pageSize; i++)
        {
        paginationList.push(response.getReturnValue()[i]);
        }
        console.log('paginationList:::::'+paginationList);
        component.set('v.paginationList', paginationList);
        }
        });
        $A.enqueueAction(action2);

    },
    
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        console.log('serchKey :::::::::'+ searchKey);
            var action = component.get("c.findByName");
            
            action.setParams({
                "searchKey": searchKey
            });
            action.setCallback(this, function(a) {
                component.set("v.accounts", a.getReturnValue());
                var paginationList = [];
            });
            $A.enqueueAction(action);       
    },
    
    
    next : function(component, event, helper)
    
    {
    
    var oppList = component.get("v.Contacts");
    
    var end = component.get("v.end");
    
    var start = component.get("v.start");
    
    var pageSize = component.get("v.pageSize");

    var pageNumber = component.get("v.pageNumber");
    
    pageNumber = 1 + pageNumber;

    var paginationList = [];
    
    var counter = 0;
    
    for(var i=end+1; i<end+pageSize+1; i++)
    
    {
    
    if(oppList.length > end)
    
    {
    
    paginationList.push(oppList[i]);
    
    counter ++ ;
    
    }
    
    }
    
    start = start + counter;
    
    end = end + counter;
    
    component.set("v.start",start);
    
    component.set("v.end",end);

    component.set('v.pageNumber',pageNumber);
    
    component.set('v.paginationList', paginationList);
    console.log('next:::');

    },
    
    previous : function(component, event, helper)
    
    {
    
    var oppList = component.get("v.Contacts");
    
    var end = component.get("v.end");
    
    var start = component.get("v.start");
    
    var pageSize = component.get("v.pageSize");

    var pageNumber = component.get("v.pageNumber");

    pageNumber =pageNumber-1;

    
    var paginationList = [];
    
    var counter = 0;
    
    for(var i= start-pageSize; i < start ; i++)
    
    {
    
    if(i > -1)
    
    {
    
    paginationList.push(oppList[i]);
    
    counter ++;
    
    }
    
    else {
    
    start++;
    
    }
    
    }
    
    start = start - counter;
    
    end = end - counter;
    
    component.set("v.start",start);
    
    component.set("v.end",end);

    component.set('v.pageNumber',pageNumber);

    
    component.set('v.paginationList', paginationList);
    console.log('previous:::');

    }
       
})





 //  if(searchKey == null){
        //    return null;
        //  }else{
        //     var searchKey1 = component.find("searchKey").get("v.value");
        //     var rId =searchKey1;
        //     console.log('rId::::'+rId);
                
        //     var action1 = component.get("c.conList");
        //     console.log('action1:::::'+action1);
        //      action1.setParams({
        //         "AccName": rId
        //     });
        //     action1.setCallback(this, function(a) {
        //         component.set("v.Contacts", a.getReturnValue());
        //     });
        //     $A.enqueueAction(action1);
        //     // var q = component.get('c.caList');
        // //    $A.enqueueAction(q);
        //    console.log('searchKeyChange:::::');
        //  }





        // onSelectChange : function(component, event, helper) {
    
        //     var selected = component.find("records").get("v.value");
            
        //     var paginationList = [];
            
        //     var oppList = component.get("v.Contacts");
            
        //     for(var i=0; i< selected; i++)
            
        //     {
            
        //     paginationList.push(oppList[i]);
            
        //     }
            
        //     component.set('v.paginationList', paginationList);
        //     console.log('onSelectChange');
        //     },