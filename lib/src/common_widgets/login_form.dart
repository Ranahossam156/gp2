import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/custom_textfield.dart';
import 'package:gp2/src/features/authentication/screens/forget%20_password_screen.dart';
import 'package:http/http.dart'as http;
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:gp2/src/features/authentication/screens/forcasting_screen.dart';
import 'package:gp2/src/features/authentication/models/login_request_model.dart';
import 'package:gp2/src/features/authentication/screens/forget_password_otp.dart';
import 'package:gp2/src/features/authentication/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../features/authentication/controllers/login_controller.dart';
import '../features/authentication/controllers/registeration_controller.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/utils/api_endpoints.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController=TextEditingController();
   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
   bool isApiCallProcess = false;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter password'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final ValidEmail = MultiValidator([
    RequiredValidator(errorText: "Please enter email"),
    EmailValidator(errorText: "Enter valid email id"),
  ]);
  late String password;
  bool isLoading = false;
  final Future <SharedPreferences>_prefs = SharedPreferences.getInstance();
  LoginController loginController=Get.put(LoginController());
  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });
      var hearders ={"Content-Type": "application/json",};

      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.login);
      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
        //'name':'name',
      };

      http.Response response = await http.post(url,body: jsonEncode(body),headers: hearders);
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if(response.statusCode >=200 && response.statusCode <= 300){
        print(response.body);
        final json = jsonDecode(response.body);
          var token=json['token'];
          final SharedPreferences? prefs=await _prefs;
          await prefs?.setString('token', token);
          Get.off(ForecastingScreen());
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
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
              labelText: 'Email',
              validator: ValidEmail,
              controller: emailController,
              keyboardType: TextInputType.text,
            ),

            const GradientDivider(),
            //const CustomDivider(),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              obscureText: true,
              labelText: 'Password',
              validator: passwordValidator,
              controller: passwordController,
              keyboardType: TextInputType.text,
            ),

            const GradientDivider(),
            //const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 30,
              width: 140,
              child: CustomButton(
                  onTap: () {
                    if (validateAndSave()) {
                      login();
                    }
                  },
                  text: 'Sign in'),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text(
            //   'Sign in with google account?',
            //   style: TextStyle(color: Colors.white, fontSize: 14),
            // ),
            // const SizedBox(
            //   height: 60,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?  ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Color(0xff1FDEF5), fontSize: 16),
                  ),
                ),
              ],
            ),
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
