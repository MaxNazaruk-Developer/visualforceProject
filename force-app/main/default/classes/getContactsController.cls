public class getContactsController {

    public static Contact contactSearch{get;}
    public static List<Contact> contacts { get { return getContact();} } 
    
    
    /*public Contact getContactForSearch(){
        if (contactSearch == null) {
            contactSearch = new Contact();
        }
        return contactSearch;
    }*/    
    
    public static List<Contact> getContact() {
        System.debug('contactSearch', contactSearch);    
        
        if (contactSearch == null) {                    
            return [
                SELECT FirstName, LastName, Email, MobilePhone, CreatedDate, AccountId
                FROM Contact                
                ORDER BY CreatedDate DESC 
                LIMIT 50            
            ];
        } else {
            String getSearchContact= '%' + contactSearch.LastName + '%';
            System.debug('getSearchContact', getSearchContact);
            return [
                SELECT FirstName, LastName, Email, MobilePhone, CreatedDate, AccountId
                FROM Contact
                WHERE LastName LIKE :getSearchContact              
                ORDER BY CreatedDate DESC 
                LIMIT 50            
            ];
        }
    }   
    
    /*public static void searchContact() {
        
    }*/
}
