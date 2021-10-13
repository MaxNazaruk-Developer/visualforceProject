@isTest
public with sharing class getContactsControllerTest {
    @TestSetup
    static void createTestContacts(){
        List<Contact> listAddContacts= new List<Contact>();
        for (Integer i = 0; i < 48; i++) {
            Contact newContact = new Contact(
                LastName = 'Test' + i,
                FirstName = 'Sutap' + i
            );
            listAddContacts.add(newContact);
        }
        listAddContacts.add(new Contact(
            LastName = 'OneContact',
            FirstName = 'FirstNameContact'            
        ));
        insert listAddContacts;
    }

    @isTest
    static void getContactTest() {
        Test.startTest();
        List<Contact> getContactsController = getContactsController.contacts;
        Test.stopTest();
        List<Contact> allContacts = [
            SELECT LastName, FirstName, CreatedDate 
            FROM Contact
        ];        
        System.assertEquals(allContacts, getContactsController);
    }

    @IsTest
    public static void testcreateContact(){
        Test.startTest();        
        getContactsController.contactSearch = 'FirstNameContact';
        List<Contact> searchContactTest = getContactsController.contacts;
        Test.stopTest();
        List<Contact> testlistContact = [
            SELECT FirstName, LastName, CreatedDate, Id 
            FROM Contact 
            WHERE FirstName 
            LIKE :'FirstNameContact'
        ];        
        System.assertEquals(searchContactTest, testlistContact);
    }
}
