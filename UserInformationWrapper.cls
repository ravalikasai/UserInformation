public without sharing class UserInformationWrapper {

    /**
     * @Method Name  : getUserInformation
     * @Description  : This method is used to fetch the user information based on the email address provided and returns back a wrapper class object.
     * @param        : emailAddress 
     * @return       : userWrapperObj
     */

    @AuraEnabled(cacheable=true)
    public static UserWrapper getUserInformation(String emailAddress) {
        UserWrapper userWrapperObj = new UserWrapper();
        User userInfoObj = [Select Id, Name, Division, TimeZoneSidKey, CompanyName, AboutMe, FederationIdentifier, Username, Title,
                            Profile.Name, Userrole.Name, MediumPhotoUrl from User where Email = :emailAddress];

       //Setting the field values to the wrapper class object
        if(userInfoObj != null) {
            userWrapperObj.id = userInfoObj.Id;
            userWrapperObj.name = userInfoObj.Name;
            userWrapperObj.division = userInfoObj.Division;
            userWrapperObj.timezone = userInfoObj.TimeZoneSidKey;
            userWrapperObj.companyName = userInfoObj.CompanyName;
            userWrapperObj.aboutMe = userInfoObj.AboutMe;
            userWrapperObj.federationIdentifier = userInfoObj.FederationIdentifier;
            userWrapperObj.username = userInfoObj.Username;
            userWrapperObj.title = userInfoObj.Title;
            userWrapperObj.userRole = userInfoObj.Userrole.Name;
            userWrapperObj.profile = userInfoObj.Profile.Name;
            userWrapperObj.photoUrl = userInfoObj.MediumPhotoUrl;

        }
        return userWrapperObj;
    } 

    public class UserWrapper {

            @AuraEnabled public String id{get;set;}
            @AuraEnabled public String name{get;set;}
            @AuraEnabled public String division{get;set;}
            @AuraEnabled public String timezone{get;set;}
            @AuraEnabled public String companyName{get;set;}
            @AuraEnabled public String aboutMe{get;set;}
            @AuraEnabled public String federationIdentifier{get;set;}
            @AuraEnabled public String username{get;set;}
            @AuraEnabled public String title{get;set;}
            @AuraEnabled public String userRole{get;set;}
            @AuraEnabled public String profile{get;set;}
            @AuraEnabled public String photoUrl{get;set;}
        }

    }
    