import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/custom_textfield.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:gp2/src/features/authentication/controllers/registeration_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/utils/api_endpoints.dart';
import 'package:http/http.dart'as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
   TextEditingController nameController = TextEditingController();
   TextEditingController passwordController= TextEditingController();
   TextEditingController confirmpasswordController= TextEditingController();
   TextEditingController emailController= TextEditingController();
   TextEditingController addressController= TextEditingController();
 // RegisterationController registerationController=Get.put(RegisterationController());
   bool isLoading = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter confirm password'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final ValidEmail = MultiValidator([
    RequiredValidator(errorText: "Please enter confirm email"),
    EmailValidator(errorText: "Enter valid email id"),
  ]);
   final Future <SharedPreferences>_prefs = SharedPreferences.getInstance();
  // @override
  // void initState() {
  //   super.initState();
  //   nameController = TextEditingController();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   //phoneController = TextEditingController();
  //   confirmpasswordController = TextEditingController();
  // }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  // Future<void> register()async{
  //   try{
  //     setState(() {
  //       isLoading = true;
  //     });
  //     //var hearders ={'Content-type':'application/json'};
  //     var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.register);
  //     Map body = {
  //       'name': nameController.text,
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //       'car_license':"#######",
  //       //'phone': phoneController.text,
  //     };
  //
  //       http.Response response=await http.post(url,body: jsonEncode(body));
  //       print('Response Status Code: ${response.statusCode}');
  //       print('Response Body: ${response.body}');
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const LoginScreen(),
  //       ),
  //     );
  //
  //       // print(response.body);
  //   }
  //   catch(e){
  //     showDialog(context: Get.context!, builder: (contex){
  //       return SimpleDialog(title: Text('Error'),
  //         contentPadding: EdgeInsets.all(20),
  //         children: [Text(e.toString())],
  //       );
  //     });
  //   }
  // }
  //  Future<void> register() async {
  //    try {
  //      setState(() {
  //        isLoading = true;
  //      });
  //
  //      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.register);
  //      Map body = {
  //        'name': nameController.text,
  //        'email': emailController.text,
  //        'password': passwordController.text,
  //        'car_license':"#######",
  //      };
  //
  //      http.Response response = await http.post(url,body: jsonEncode(body));
  //      print('Response Status Code: ${response.statusCode}');
  //      print('Response Body: ${response.body}');
  //
  //      setState(() {
  //        isLoading = false;
  //      });
  //
  //      Navigator.push(
  //        context,
  //        MaterialPageRoute(
  //          builder: (context) => const LoginScreen(),
  //        ),
  //      );
  //    } catch (e) {
  //      setState(() {
  //        isLoading = false;
  //      });
  //
  //      print('Error during registration :$e');
  //      // Handle error
  //    }
  //  }
   Future<void> register() async {
     try {
       setState(() {
         isLoading = true;
       });

       var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.register);
       print('{$url}');
       Map body = {
         'name': nameController.text,
         'email': emailController.text,
         'password': passwordController.text,
         'car_license':"#######",
         'address':addressController.text,
       };

       http.Response response = await http.post(url,body: jsonEncode(body));
       if(response.statusCode==201){
         print(response.body);
         final json = jsonDecode(response.body);
         if(json['code']==0){
           var token=json['data']['user']['token'];
           final SharedPreferences? prefs=await _prefs;
           await prefs?.setString('token', token);
           Get.off(LoginScreen());
         }
         else if(json['code']==1){
           throw jsonDecode(response.body)['message'];
         }
       }else{
         throw jsonDecode(response.body)['message']??"unKnown error occurred";
       }
       print('Response Status Code: ${response.statusCode}');
       print('Response Body: ${response.body}');

     }
     catch(error){
       Get.back();
       showDialog(context: Get.context!, builder: (contex){
         return SimpleDialog(title: Text('Error'),
           contentPadding: EdgeInsets.all(20),
           children: [Text(error.toString())],
         );
     });
     }
   }

   //   setState(() {
   //     isLoading = false;
   //   });
   //
   //   if (response.statusCode == 200) {
   //     // Navigate to the login screen if the registration is successful
   //     Navigator.push(
   //       context,
   //       MaterialPageRoute(
   //         builder: (context) => const LoginScreen(),
   //       ),
   //     );
   //   } else {
   //     // Handle other response status codes if needed
   //   }
   // } catch (e) {
   //   setState(() {
   //     isLoading = false;
   //   });
   //
   //   print('Error during registration :$e');
   // Handle error
   @override
  Widget build(BuildContext context) {
    return Form(
      key: globalFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              labelText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }

              },
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              labelText: 'address',
              validator:  (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your address';
                }

              },
              controller: addressController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            // CustomTextFormField(
            //   labelText: 'Phone number',
            //   controller: phoneController,
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'please enter phone number';
            //     }
            //     else{
            //       PhoneValidator();
            //     }
            //   },
            //
            //   keyboardType: TextInputType.text,
            // ),
            // const GradientDivider(),
            // const SizedBox(
            //   height: 14,
            // ),
            CustomTextFormField(
              labelText: 'Email',
              validator: ValidEmail,
              controller: emailController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              labelText: 'Password',
              obscureText: true,
              validator: passwordValidator,
              controller: passwordController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              obscureText: true,
              labelText: 'Confirm Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter confirm password';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null; // Return null if validation passes
              },
              controller: confirmpasswordController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 40,
            ),
        // isLoading
        //     ? const CircularProgressIndicator(color:Color(0xff1FDEF5) ,strokeWidth : 4.0,):
            SizedBox(
              height: 30,
              width: 140,
              child:  // Show loading indicator
              CustomButton(
                onTap: () {
                  if (validateAndSave()) {
                    register();
                  }
                },
                text: 'Sign up',
              ),
            ),
              // CustomButton(
              //     onTap: () {
              //       if (validateAndSave()) {
              //         register();
              //           // Navigator.push(
              //
              //           //   context,
              //           //   MaterialPageRoute(
              //           //     builder: (context) => const LoginScreen(),
              //           //   ),
              //           // );
              //           //isApiCallProcess = true;
              //         // Your API call logic here...
              //       }
              //     },
              //     text: 'Sign up'),
           // ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
