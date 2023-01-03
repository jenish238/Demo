public with sharing class getfile {
    public getfile() {

    }
    @AuraEnabled(cacheable=true)
    public static List<ContentVersion> getVersionFiles1(){ 
        return [
            SELECT Id,Title,ContentDocumentId,FileType,ContentSize,FileExtension,VersionNumber,CreatedDate,VersionData,FirstPublishLocationId FROM ContentVersion ];
}
@AuraEnabled(cacheable=true)
public static List<ContentVersion> getVersionFiles2(){ 
    return [
        SELECT Id,Title,ContentDocumentId,FileType,ContentSize,FileExtension,VersionNumber,CreatedDate,VersionData,FirstPublishLocationId FROM ContentVersion ORDER BY CreatedDate DESC];
}  
}