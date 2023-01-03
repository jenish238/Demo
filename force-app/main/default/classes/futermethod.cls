global class futermethod{

    
  @future(callout=true)
    Webservice static  void  sendCallOut(ID oppIds) {
      
      
      Http H  = new http();
      HttpResponse res = new HttpResponse();
                              
    HttpRequest req = new HttpRequest(); 
    System.debug('st1');      
    req.setEndpoint('https://source.unsplash.com/random'); 
    
    System.debug('st2'); 
    req.setMethod('GET');
    System.debug('st3');              
                     
           res = h.send(req); 
          System.debug(res);
          System.debug(' done bro');
              
          string responseValue = '';
          responseValue = res.getBody();
          System.debug('s1');
          system.debug('Response Body for File: ' + responseValue);
          
          System.debug('s2');
        string r =  responseValue.Substring(responseValue.indexof('https://'),responseValue.indexof('1080'));
        System.debug(r);
         
          Http H1  = new http();
    HttpResponse res1 = new HttpResponse();
                              
    HttpRequest req1 = new HttpRequest(); 
    System.debug('st1');      
    req1.setEndpoint(r); 
    System.debug('st2'); 
    req1.setMethod('GET');
    System.debug('st3');              
                     
           res1 = h1.send(req1); 
          Attachment n = new Attachment();
          n.ParentId =oppIds ;
          System.debug('s3');
          n.Name = 'myImage.jpg';
          System.debug(n.Name);
         
           n.Body = res1.getBodyAsBlob();
          System.debug(n.Body);
          n.contentType ='image/jpg';
          System.debug(n.contentType);
          insert n;
        
        }
     
    }    







     // n.Body = image;
          // System.debug('z:-'+z);
          // n.Body =Blob.valueOf('https://images.unsplash.com/photo-1666624481306-0ce40f51ec7b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY2OTIzMDE0MQ&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080');

           // req.setHeader('Content-Type', 'image/jpg');



           // blob image = res.getBodyAsBlob();
          // String z ='https://images.unsplash.com/photo-1666624481306-0ce40f51ec7b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY2OTIzMDE0MQ&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080';
          // Blob e =Blob.valueOf(z);
          // System.debug('res.getBodyAsBlob()'+res.getBodyAsBlob());
          // System.debug('image'+ image);


           // Blob body =  Encodingutil.base64Decode(e.substring(z.indexOf(',') + 1));

          // string q = [select tag from responseValue];

          // req.setHeader('Content-Type', 'image/jpg');


          //  String a = 'this is a PDF';


          // 
// public with sharing class futermethod {
//     public futermethod() {

//     }
// }