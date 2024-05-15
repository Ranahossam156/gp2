import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gp2/src/common_widgets/signup_form.dart';
import 'package:gp2/src/features/authentication/screens/forget_password_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import '../../../common_widgets/gradient_divider.dart';
import 'package:http/http.dart'as http;

import '../utils/api_endpoints.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final ValidEmail = MultiValidator([
    RequiredValidator(errorText: "Please enter confirm email"),
    EmailValidator(errorText: "Enter valid email id"),
  ]);
  final Future <SharedPreferences>_prefs = SharedPreferences.getInstance();
   TextEditingController emailController= TextEditingController();
   Future<void> forgetPassword() async {
     try {
       var hearders ={"Content-Type": "application/json",};

       var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.forget);
       Map body = {
         'email': emailController.text,
         //'name':'name',
       };

       http.Response response = await http.post(url,body: jsonEncode(body),headers: hearders);
       print('Response Status Code: ${response.statusCode}');
       print('Response Body: ${response.body}');
       if(response.statusCode >=200 && response.statusCode <= 300){
         print(response.body);
         final json = jsonDecode(response.body);
         // var token=json['token'];
         // final SharedPreferences? prefs=await _prefs;
         // await prefs?.setString('token', token);
         Get.off(OTPScreen(email: emailController.text));
       }
       else{
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
  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 4, left: 16),
                        child: Image.asset(
                          'assets/images/only_logo.png',
                          height: 80,
                          width: 80,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            'TRAFFIC',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "CodeDemo",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'DETECTOR',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "CodeDemo",
                              color: Color(0xff3FBEDA),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
               Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: globalFormKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Enter your email to send a verification code to it',style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:16),),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                              labelText: 'Email',
                              validator: ValidEmail,
                              controller: emailController,
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
                                    forgetPassword();
                                    //register();
                                  }
                                },
                                text: 'Send',
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
