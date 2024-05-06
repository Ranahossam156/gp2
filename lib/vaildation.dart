// bool isValidEmail (String input){
//   const emailRegex = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//   if(RegExp(emailRegex).hasMatch(input))
//     {
//       return true;
//     }
//   else{
//     return false;
//   }
// }
// bool isValidName (String input){
//   const nameRegex = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
//   if(RegExp(nameRegex).hasMatch(input))
//   {
//     return true;
//   }
//   else{
//     return false;
//   }
// }
// bool isValidPassword (String input){
//   const passwordRegex = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$"r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>';
//   if(RegExp(passwordRegex).hasMatch(input))
//   {
//     return true;
//   }
//   else{
//     return false;
//   }
// }
// bool isValidPhone (String input){
//   const passwordRegex = r"^\+?0[0-9]{10}$";
//   if(RegExp(passwordRegex).hasMatch(input))
//   {
//     return true;
//   }
//   else{
//     return false;
//   }
// }
//
// // bool get isNotNull{
// //   return this!=null;
// // }
import 'package:form_field_validator/form_field_validator.dart';
class PhoneValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  PhoneValidator({String errorText = 'Enter a valid phone number'}) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    // return true if the value is valid according the your condition
    return value != null && hasMatch(r"^\+?0[0-9]{10}", value);
  }

}
// class NameValidator extends TextFieldValidator {
//   // pass the error text to the super constructor
//   NameValidator({String errorText = 'Enter a Name'}) : super(errorText);
//
//   // return false if you want the validator to return error
//   // message when the value is empty.
//   @override
//   bool get ignoreEmptyValues => true;
//
//   @override
//   bool isValid(String? value) {
//     // return true if the value is valid according the your condition
//     return value == null , value);
//   }

