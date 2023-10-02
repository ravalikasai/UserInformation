import {LightningElement, api, wire, track} from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getUserInformation  from '@salesforce/apex/UserInformationWrapper.getUserInformation';

const FIELD = [
    EMAIL_FIELD
];

export default class UserInformation extends LightningElement {
  @api recordId;
  @track emailFieldValue;
  @track noEmailAddress = false;
  @track noUserFound = false;
  @track userDetails;
  errorValue

//Fetching email address of the contact record using wire method
@wire(getRecord, {recordId: '$recordId', fields: FIELD})
 loadFields({error, data}) {
    if(error) {
       this.errorValue= error;
    }
    else if(data) {
      this.emailFieldValue = getFieldValue(data, EMAIL_FIELD);
      //Checks if the contact record has email address and sets the value noEmailAddress accordingly
      if(this.emailFieldValue == null || this.emailFieldValue == '') {
        this.noEmailAddress = true;
      }
    }
  }

//Fetching user information using apex method by passing the email address
@wire(getUserInformation,{emailAddress : '$emailFieldValue'}) 
userRecordInformation({error, data}) {
if(error) {
  if(!this.noEmailAddress) {
    this.noUserFound = true;
  }
 }
 else if(data) {
 this.userDetails = data;  
 }
}
}




 

