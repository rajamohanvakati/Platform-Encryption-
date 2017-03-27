public class TenantController {
    
    public TenantSecret secretKey {get;set;}
    public TenantController(ApexPages.StandardController controller){
        this.secretKey = new TenantSecret(); 
    }
    
    public PageReference insertNewSecret(){
        try{
            system.debug('Key'+secretKey );
            insert secretKey ; 
        }catch(Exception e ){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
            ApexPages.addMessage(myMsg);
        }
        return null ;
    }
    
    public List<TenantSecret> getKeyHistory(){
        
        return [Select Id , 
                Description , 
                Source ,
                Type ,
                version,
                status 
                from TenantSecret ];
        
    }
    
}