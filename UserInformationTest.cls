@isTest

public class UserInformationTest {

    public static String EMAIL_ADDRESS = 'sachinsharma@gamil.com';
    public static String NAME = 'Sachin Sharma';

    static testMethod void userInformationTestMethod(){

        User userObj = new User(FirstName = 'Sachin', LastName = 'Sharma',
                                Email = 'sachinsharma@gamil.com', Division = 'Technology', Username = 'user169@salesforce.bruntwoodTest',
                                Alias = 'SSharma', TimeZoneSidKey = 'Europe/London', LocaleSidKey = 'en_GB', EmailEncodingKey = 'UTF-8',
                                ProfileId ='00e8e000001WgeOAAS', LanguageLocaleKey= 'en_US');
        insert userObj;
        UserInformationWrapper.UserWrapper userWrapperObj = UserInformationWrapper.getUserInformation(EMAIL_ADDRESS);
        System.assertEquals(userWrapperObj.name, NAME);
    }

    }

