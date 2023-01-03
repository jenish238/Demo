public class dropBoxApi{
    Public String code ;
    Public String accesstoken;
    public String fileBody{get;set;}
    public String key;
   
   
    public dropBoxApi()
    {
        code = ApexPages.currentPage().getParameters().get('code') ;
        
        System.debug('Code='+code);
        if(code != '' && code != null)
        {
            AccessToken() ;
        }
    }

    public PageReference DropAuth()
    {
        
        system.debug('UPLOAD'+accessToken );
        //Authenticating
        PageReference pg = new PageReference('https://www.dropbox.com/1/oauth2/authorize?response_type=code&client_id='+key+' &redirect_uri=https://mvclouds-c-dev-ed--c.develop.vf.force.com/apex/intretask2?core.apexpages.request.devconsole=1') ;
        
        return null;
    }

    public void AccessToken()
    {
        //Getting access token from dropbox
        
        String appKey='xqmqsqesmcr47pc';
        key = appKey;
        String appSecreatKey='sfja1hznkuhxce8';
        String tokenuri = 'https://api.dropbox.com/oauth2/token?grant_type=authorization_code&code='+code+'&redirect_uri=https://c.na46.visual.force.com/apex/DropBoxPage'; 
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(tokenuri);
        req.setMethod('POST');
        req.setTimeout(60*1000);

        Blob headerValue = Blob.valueOf('{appKey}' + ':' + '{appSecretKey}');
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        Http h = new Http();
        String resp;
        HttpResponse res = h.send(req);
        resp = res.getBody();
        System.debug('response='+resp);
        JSONParser parser = JSON.createParser(resp);
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                String fieldName = parser.getText();
                parser.nextToken();
                if(fieldName == 'access_token') {
                    accesstoken = parser.getText();
                    System.debug('accesstoken='+accesstoken);
                } 
            }
        }
        system.debug('accessToken:'+accessToken );
        System.debug(' You can parse the response to get the access token ::: ' + resp);
        
        
   }
}