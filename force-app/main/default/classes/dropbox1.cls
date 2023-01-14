public with sharing class dropbox1 {
//    @AuraEnabled
    // public String refreshToken;
   
     // for refrsh token
    // https://www.dropbox.com/oauth2/authorize?client_id=<APP_KEY>&token_access_type=offline&response_type=code
    @AuraEnabled(cacheable=true)
    public static void deleteFolderOrFile(list<String> toDeleteFile){
        list<salesforce1__c> data = salesforce1__c.getAll().values();
        System.debug('data'+ data[0].Token__c);
        for (String a : toDeleteFile) {
            String endPoint = 'https://api.dropboxapi.com/2/files/delete_v2';
            String body = '{"path": "/Homework/math/'+a+'"}';
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setHeader('Authorization', 'bearer '+ data[0].Token__c);
            req.setHeader('Content-Type', 'application/json');
            req.setMethod('POST');
            req.setBody(body);
            HttpResponse res = http.send(req);
            system.debug(res);
            Map<string, string> jsonDataMap = new Map<string, string>();
            jsonDataMap = parseJSONToMap(res.getBody());
            if(jsonDataMap.containsKey('error')){
               
            }
            else {
                
            }  
        }
       
        // string body = '{"grant_type ":refresh_token,"refresh_token ":B7YxL4TtG9sAAAAAAAAAAaKjdztVK5L4cH6vckFI_fe2dFlwMFZH3-yMaRzR7fA9 }';
    }
    @AuraEnabled(cacheable = true)
    public static String genrateLongTimeAccessToken(){
        try {
            // 7anturvlx116i1g:rr6oujfitv66sxj@
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            String endpoint = 'https://api.dropbox.com/oauth2/token?grant_type=refresh_token&refresh_token=VqEQvtfE2WwAAAAAAAAAAWrUmkfj1bAzDv_rrs71QpiVcgth0dr8R-h_Ei5JkfLi';
            Blob headerValue = Blob.valueOf('7anturvlx116i1g' + ':' + 'rr6oujfitv66sxj');
            String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
            req.setHeader('Authorization', authorizationHeader);
            req.setEndpoint(endpoint);
            req.setMethod('POST');
            req.setTimeout(60*1000);
            HttpResponse resp = http.send(req);
            system.debug(resp.getBody());
            map<string, string> jsonDataMap = new map<string, string>();
            jsonDataMap = parseJSONToMap(resp.getBody());
            System.debug('jsonDataMap'+ jsonDataMap);
           String refreshToken = jsonDataMap.get('access_token');
            System.debug('dropbox token'+ refreshToken);
            return refreshToken;
                //    changeToken(refreshToken);

            } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void changeToken(String b){
        try {
            List<salesforce1__c> v = [SELECT Name,Token__c From salesforce1__c WHERE id ='a0K5g000004MEKuEAO' limit 1];
                            salesforce1__c t = salesforce1__c.getInstance('token Filed');
                            t.Token__c = b;
                                update t;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
     
    // method that uploads files to dropbox
    @AuraEnabled(cacheable=true)
    public static void uploadToDropBox(Blob file, String filename, String fileType) {
        list<salesforce1__c> data = salesforce1__c.getAll().values();
        try {
            System.debug('filllllllllll:::::::::::::::::;'+ file);
            String boundary = '----------9889464542212';
            String bodyEncoded = EncodingUtil.base64Encode(file);
            Blob bodyEncoded2 = EncodingUtil.base64Decode(bodyEncoded);
            String body = '{ "path": "/Homework/math/'+filename+'.'+fileType+'", "mode": "add", "autorename": true, "mute": false, "strict_conflict": false }';
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            String endpoint = 'https://content.dropboxapi.com/2/files/upload';
            //req.setEndpoint('callout:SalesforceBox/2/files/upload');
            req.setEndpoint(endpoint);
            req.setHeader('Authorization', 'Bearer '+data[0].Token__c);
            req.setHeader('Dropbox-API-Arg', body);
            req.setHeader('Content-Type', 'application/octet-stream');
            req.setHeader('Content-length', String.valueOf(bodyEncoded.length()));
            req.setBody(body);
            req.setBodyAsBlob(bodyEncoded2);
            req.setMethod('POST');
            req.setTimeout(60*1000);
            HttpResponse resp = http.send(req);
            system.debug(resp.getBody());
            map<string, string> jsonDataMap = new map<string, string>();
            jsonDataMap = parseJSONToMap(resp.getBody());
            System.debug('jsonDataMap'+ jsonDataMap);
            if(jsonDataMap.containsKey('error')){
               
            } else{
                
              }
        }
        catch(Exception e) {
           
        }
    }
    @AuraEnabled(cacheable=true)
    public static map<string, string> parseJSONToMap(string JSONValue){
        JSONParser parser = JSON.createParser(JSONValue);
        map<string, string> jsonMap = new map<string, string>();
        string keyValue = '';
        string tempValue = '';
        while (parser.nextToken() != null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
                keyValue = parser.getText();
                parser.nextToken();
                tempValue = parser.getText();
                jsonMap.put(keyValue, tempValue); 
                        
            }
        }
        return jsonMap;
    }
    @AuraEnabled(cacheable=true) 
    public static void uploadFiles(String recordId) {
        list<ContentVersion> conVer=[Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FirstPublishLocationId =: recordId ORDER BY CreatedDate DESC];
        System.debug('conver::::::' + conVer);
        Blob aa = conVer[0].VersionData;
        uploadToDropBox(aa, conVer[0].Title, conVer[0].FileType);
    }
    @AuraEnabled(cacheable=true) 
    public static List<ContentVersion> fileDeta(String recordId) {
      uploadFiles(recordId);
        return [Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FirstPublishLocationId =: recordId ORDER BY CreatedDate DESC];
    }


@AuraEnabled(cacheable=true)
public static List<String> getFileData(){
    list<salesforce1__c> data = salesforce1__c.getAll().values();

    try {
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        string body ='{"include_deleted": false,"include_has_explicit_shared_members": false, "include_media_info": false, "include_mounted_folders": true, "include_non_downloadable_files": true, "path": "/Homework/math", "recursive": false}';
        req.setEndpoint('https://api.dropboxapi.com/2/files/list_folder');
        req.setHeader('Authorization', 'Bearer '+ data[0].Token__c);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setBody(body);
    
        HttpResponse res = new HttpResponse();
        res = http.send(req);
        System.debug(res.getBody());
        List<string> jsonDataMap = new List<string>();
        jsonDataMap = parseJSONToMap1(res.getBody());
        System.debug(jsonDataMap);


        return jsonDataMap;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}
@AuraEnabled(cacheable=true)
public static list<string> parseJSONToMap1(string JSONValue){
    JSONParser parser = JSON.createParser(JSONValue);
    map<string, string> jsonMap = new map<string, string>();
    List<String> name = new List<String>();
    string keyValue = '';
    string tempValue = '';
    while (parser.nextToken() != null) {
        if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
            keyValue = parser.getText();
            parser.nextToken();
            tempValue = parser.getText();
            
            // System.debug('keyvalue::::'+ keyValue);
            // System.debug('tempValue:::::'+ tempValue); 
            if (keyValue =='name') {
                jsonMap.put(keyValue, tempValue); 
                name.add(tempValue);
                
            }          
        }
    }
    return name;
}
    
}





// @AuraEnabled(cacheable=true)
//     public Static void getAccessToken1()
//     {
//         String accesstoken ='';
//         String code = ApexPages.currentPage().getParameters().get('code') ;
//         //Getting access token from dropbox
//         String tokenuri = 'https://api.dropbox.com/1/oauth2/token?grant_type=authorization_code&code='+code+'&redirect_uri=https://mvclouds-c-dev-ed.develop.lightning.force.com/lightning/r/Contact/0035g00000mPsL1AAK/view'; 
//         HttpRequest req = new HttpRequest();
//         req.setEndpoint(tokenuri);
//         req.setMethod('POST');
//         req.setTimeout(60*1000);

//         Blob headerValue = Blob.valueOf('7anturvlx116i1g' + ':' + 'rr6oujfitv66sxj');
//         String authorizationHeader = 'Basic  ' + EncodingUtil.base64Encode(headerValue);
//         req.setHeader('Authorization', authorizationHeader);
//         Http h = new Http();
//         String resp;
//         HttpResponse res = h.send(req);
//         resp = res.getBody();

//         JSONParser parser = JSON.createParser(resp);
//         while (parser.nextToken() != null) {
//             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
//                 String fieldName = parser.getText();
//                 parser.nextToken();
//                 if(fieldName == 'access_token') {
//                     accesstoken = parser.getText();
//                 } 
//             }
//         }
//         system.debug('accessToken==>'+ accesstoken );
//         System.debug(' You can parse the response to get the access token ::: ' + resp);

//         string token = 'https://api.dropbox.com/1/account/info';
//         HttpRequest r = new HttpRequest();
//         r.setEndpoint(token);
//         r.setHeader('Authorization','Bearer' + accesstoken);
//         r.setMethod('GET');
//         r.setTimeout(60000);
//         Http h1 = new Http();
//         HttpResponse res1 = h1.send(r);
//         string resp1 = res1.getBody();

//         System.debug(' Account Information :: ' + resp1);
//    }


 // isError = true;
            // errorMessage = 'Delete Folder Process failed!!';


   
    // private String apiKey;
    // private String apiSecret;
    // private String redirectURI;
    // private String Dropbox_Account_endpoint;
    // private String Dropbox_files_endpoint;  
    // private String Dropbox_OAuth_authorize;
    // private String Dropbox_OAuth_token;
    // private String authorizationCode;
    // private String refreshToken;
     
    // public String code { get; set; }
    // public String username { get; set; }
   
    // public Boolean success { get; set; }
    // public Boolean connected { get; set; }
    // public Boolean isError{get;set;}
    // public String errorMessage{get;set;}
    // public String successMessage{get;set;}
    // public Boolean isSuccess{get;set;}


    // public dropbox1() {
        // connected = false;
        // success = false;
        // successMessage = '';
    //     apiKey = '7anturvlx116i1g'; // this is your dropbox apikey
    //     apiSecret = 'rr6oujfitv66sxj'; // this is your dropbox api secret
    //     redirectURI = 'https://mvclouds-c-dev-ed--c.develop.vf.force.com/apex/DropBoxVf';
    //    // url of the vf page in which the dropbox login is done
    //     Dropbox_Account_endpoint = 'https://api.dropboxapi.com/2/users/get_current_account';
    //     Dropbox_files_endpoint = 'https://content.dropboxapi.com/1/files_put/auto/';
    //     Dropbox_OAuth_authorize = 'https://www.dropbox.com/oauth2/authorize';
    //     Dropbox_OAuth_token = 'https://api.dropboxapi.com/oauth2/token';
         
        // code = ApexPages.currentPage().getParameters().get('code');
        // if(code != null) {
        //     connected = true;
        //     authorizationCode = code;
        //     getAccessToken();
        //     fetchUserInfo();
        // }
    // }
     
    // public PageReference getAuthorizationCode() {
    //     String uri = Dropbox_OAuth_authorize +
    //                  '?client_id=' + apiKey +
    //                  '&response_type=code' +
    //                  '&redirect_uri=' + redirectURI;
    //     PageReference pr = new PageReference(uri);
    //     pr.setRedirect(true);
    //     return pr;
    // }
   
 // isError = true;
            // errorMessage = 'Files couldn\'t be uploaded to Dropbox.';
            // successMessage = 'Folder Deleted Successfully!!';
            // isSuccess = true;

             // method that returns the user data of the connected dropbox account
    // private void fetchUserInfo() {
         
    //     if(refreshToken != null) {
    //         try {
    //             Http h = new Http();
    //             HttpRequest req = new HttpRequest(); 
    //             req.setEndpoint(Dropbox_Account_endpoint);
    //             req.setHeader('Authorization', 'Bearer '+refreshToken);
    //             req.setMethod('POST');
    //             req.setTimeout(60*1000);
    //             HttpResponse res = h.send(req);
    //             system.debug(res.getBody());
    //             Map<string, string> jsonValues = new Map<string, string>();
    //             jsonValues = parseJSONToMap(res.getBody());
    //             if(jsonValues.containsKey('error')){
               
    //             }
    //             else {
                    
    //             }
    //         }
    //         catch(Exception e) {
    //             // isError = true;
    //             // errorMessage = 'Could not connect to DropBox!!';
    //         }
    //     }
    // }
    // @AuraEnabled(cacheable=true)
    // public static String getAccessToken(String code) {
       
    //         try {
    //           String  apiKey = '7anturvlx116i1g'; // this is your dropbox apikey
    //           String  apiSecret = 'rr6oujfitv66sxj'; // this is your dropbox api secret
    //         //   String  redirectURI = 'https://mvclouds-c-dev-ed--c.develop.vf.force.com/apex/DropBoxVf';
    //           String  Dropbox_Account_endpoint = 'https://api.dropboxapi.com/2/users/get_current_account';
    //           String  Dropbox_files_endpoint = 'https://content.dropboxapi.com/1/files_put/auto/';
    //           String  Dropbox_OAuth_authorize = 'https://www.dropbox.com/oauth2/authorize';
    //           String  Dropbox_OAuth_token = 'https://api.dropboxapi.com/oauth2/token';
    //             Http h = new Http();
    //             HttpRequest req = new HttpRequest();
                
    //             req.setEndpoint(Dropbox_OAuth_token);  
    //             string bodyRequest = '';
    //             System.debug('Step 1');
    //             System.debug('code:::::;'+code);
    //             // string authorizationCode = ApexPages.currentPage().getParameters().get('code');
    //             // System.debug('token:::::::'+authorizationCode);
    //             bodyRequest = 'code=' + EncodingUtil.urlEncode(code, 'UTF-8');
    //             bodyRequest+= '&client_id=' + EncodingUtil.urlEncode(apiKey, 'UTF-8'); 
    //             bodyRequest+= '&client_secret=' + EncodingUtil.urlEncode(apiSecret, 'UTF-8');
    //             // bodyRequest+= '&redirect_uri=' + EncodingUtil.urlEncode(redirectURI, 'UTF-8');
    //             bodyRequest+= '&grant_type=authorization_code';
    //             System.debug('aassddddddddddddddddddddd::::::::::::::::'+ bodyRequest);
    //             req.setBody(bodyRequest);    
    //             req.setHeader('Content-length', string.ValueOf(bodyRequest.length()));
    //             req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    //             req.setMethod('POST');
    //             req.setTimeout(60*1000);
    //             System.debug('setp2');
                 
    //             HttpResponse res = h.send(req);  
    //             system.debug(res.getBody());
    //             map<string, string> jsonValues = new map<string, string>();
    //             jsonValues = parseJSONToMap(res.getBody());
    //             if(jsonValues.containsKey('error')) {return null;}
    //             else {
    //                 String refreshToken = jsonValues.get('access_token');
    //                 System.debug('refrsethToken'+ refreshToken);
    //                return refreshToken;
    //             }
    //         }
    //         catch(Exception e) {}
    //     return null;
    // }
     
     
   
    // @AuraEnabled(cacheable=true)
    // public static void createFolder(){
    //     String endPoint = 'https://api.dropboxapi.com/2/files/create_folder_v2';
    //     String body = '{"path": "/Test","autorename": false}';
    //     Http http = new Http();
    //     HttpRequest req = new HttpRequest();
    //     HttpResponse res = new HttpResponse();
    //     req.setEndpoint(endpoint);
    //     req.setHeader('Authorization', 'Bearer '+ 'sl.BWG-aEZjDFhUx0BlZD52kXQ4_D8m2zvyt__hN-Gu6UFgwm-kUw_iBdXFMCXWJCD4e2vdIq98KApjc0vc9dpZeGToZ3je3HifEv0geSmnOO6OMhg-ncH_Ivq6Rmqg763cOdvFNarcjnQ');
    //     req.setHeader('Content-Type', 'application/json');
    //     req.setMethod('POST');
    //     req.setBody(body);
    //     res = http.send(req);
    //     Map<string, string> jsonDataMap = new Map<string, string>();
    //     jsonDataMap = parseJSONToMap(res.getBody());
    //     if(jsonDataMap.containsKey('error')){
    //     }
    //     else {
    //     }
    // }
    // private String apiKey;
    // private String apiSecret;
    // private String redirectURI;
    // private String Dropbox_Account_endpoint;
    // private String Dropbox_files_endpoint;
    // private String Dropbox_OAuth_authorize;
    // private String Dropbox_OAuth_token;
    // private String authorizationCode;
    // private String refreshToken;
     
    // public String code { get; set; }
    // public String username { get; set; }
    // public String fileName { get; set; }
    // public Blob fileBody { get; set; }
    // public Boolean success { get; set; }
    // public Boolean connected { get; set; }
    // public Boolean isError{get;set;}
    // public String errorMessage{get;set;}
    // public String successMessage{get;set;}
    // public Boolean isSuccess{get;set;}



    // public Dropbox1() {
    //     connected = false;
    //     success = false;
    //     successMessage = '';
    //     apiKey = '7anturvlx116i1g'; // this is your dropbox apikey
    //     apiSecret = 'rr6oujfitv66sxj'; // this is your dropbox api secret
    //     redirectURI = 'https://mvclouds-c-dev-ed--c.develop.vf.force.com/apex/dropboxpage';
    //    // url of the vf page in which the dropbox login is done
    //     Dropbox_Account_endpoint = 'https://api.dropboxapi.com/2/users/get_current_account';
    //     Dropbox_files_endpoint = 'https://content.dropboxapi.com/1/files_put/auto/';
    //     Dropbox_OAuth_authorize = 'https://www.dropbox.com/oauth2/authorize';
    //     Dropbox_OAuth_token = 'https://api.dropboxapi.com/oauth2/token';
         
    //     code = ApexPages.currentPage().getParameters().get('code');
    //     System.debug('code'+ code);
    //     if(code != null) {
    //         connected = true;
    //         authorizationCode = code;
    //         getAccessToken();
    //         fetchUserInfo();
    //         getAuthorizationCode();
    //     }
    //     System.debug('dropbox');
    // }
     
    // public PageReference getAuthorizationCode() {
    //     String uri = Dropbox_OAuth_authorize +
    //                  '?client_id=' + apiKey +
    //                  '&response_type=code' +
    //                  '&redirect_uri=' + redirectURI;
    //     PageReference pr = new PageReference(uri);
    //     pr.setRedirect(true);
    //     System.debug('dropboxpageReference');
    //     return pr;
    // }
     
    // private void getAccessToken() {
    //     if(authorizationCode != null) {
    //         try {
    //             Http h = new Http();
    //             HttpRequest req = new HttpRequest();
                  
    //             req.setEndpoint(Dropbox_OAuth_token);  
    //             string bodyRequest = '';
    //             System.debug('authorizationCode:::::::'+ authorizationCode);
    //             bodyRequest = 'code=' + EncodingUtil.urlEncode(authorizationCode, 'UTF-8');
    //             bodyRequest+= '&client_id=' + EncodingUtil.urlEncode(apiKey, 'UTF-8');
    //             bodyRequest+= '&client_secret=' + EncodingUtil.urlEncode(apiSecret, 'UTF-8');
    //             bodyRequest+= '&redirect_uri=' + EncodingUtil.urlEncode(redirectURI, 'UTF-8');
    //             bodyRequest+= '&grant_type=authorization_code';
    //             System.debug('asaasasasas::::::::'+ bodyRequest);
                 
    //             req.setBody(bodyRequest);    
    //             req.setHeader('Content-length', string.ValueOf(bodyRequest.length()));
    //             req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    //             req.setMethod('POST');
    //             req.setTimeout(60*1000);
                 
    //             HttpResponse res = h.send(req);  
    //             system.debug(res.getBody());
    //             map<string, string> jsonValues = new map<string, string>();
    //             jsonValues = parseJSONToMap(res.getBody());
    //             if(jsonValues.containsKey('error')) {
    //                 isError = true;
    //                 errorMessage = 'Could not connect to DropBox!!';
    //                 connected = false;
    //             }
    //             else {
    //                connected = true;
    //                isSuccess = true;
    //                refreshToken = jsonValues.get('access_token');
    //                System.debug('vf page dropbox token'+ refreshToken);
    //             }
    //         }
    //         catch(Exception e) {
    //             isError = true;
    //             errorMessage = 'Could not connect to DropBox!!';
    //         }
    //     }
    //     else{ 
    //         isError = true;
    //         errorMessage = 'Could not connect to DropBox!!';
    //     }
    //     System.debug('getAccessToken');
    // }
     
     
    // // method that returns the user data of the connected dropbox account
    // private void fetchUserInfo() {
         
    //     if(refreshToken != null) {
    //         try {
    //             Http h = new Http();
    //             HttpRequest req = new HttpRequest(); 
    //             req.setEndpoint(Dropbox_Account_endpoint);
    //             req.setHeader('Authorization', 'Bearer '+refreshToken);
    //             req.setMethod('POST');
    //             req.setTimeout(60*1000);
    //             HttpResponse res = h.send(req);
    //             system.debug(res.getBody());
    //             Map<string, string> jsonValues = new Map<string, string>();
    //             jsonValues = parseJSONToMap(res.getBody());
    //             if(jsonValues.containsKey('error')){
    //                isError = true;
    //                errorMessage = 'Could not connect to DropBox!!';
    //             }
    //             else {
    //                  username = jsonValues.get('email');
    //                  isSuccess = true;
    //                  successMessage = 'DropBox Account : '+ username + ' Connect Successfully';
    //             }
    //         }
    //         catch(Exception e) {
    //             isError = true;
    //             errorMessage = 'Could not connect to DropBox!!';
    //         }
    //     }
    //     System.debug('fetchUserInfo');
    // }
   // for (salesforce1__c acc : v){ 
                                //     //this will update the list only. 
                                //     acc.Token__c = b;
                                //     update acc;
                                // }