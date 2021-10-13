public class getContactsController {

    public static String contactSearch {get; set;}
    public static List<Contact> contacts { get { return getContact();} }       
    
    public static List<Contact> getContact() {       
        if (contactSearch == null) {                    
            return [
                SELECT FirstName, LastName, Email, MobilePhone, CreatedDate, AccountId
                FROM Contact                
                ORDER BY CreatedDate DESC 
                LIMIT 50            
            ];
        } else {
            String getSearchContact= '%' + contactSearch + '%';            
            return [
                SELECT FirstName, LastName, Email, MobilePhone, CreatedDate, AccountId
                FROM Contact
                WHERE FirstName 
                LIKE :getSearchContact              
                ORDER BY CreatedDate DESC 
                LIMIT 50            
            ];
        }        
    }   
}
