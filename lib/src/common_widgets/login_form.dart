import 'package:flutter/material.dart';
import 'package:gp2/config.dart';
import 'package:gp2/misc/validators.dart';
import 'package:gp2/services/api_service.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/custom_textfield.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:gp2/src/features/authentication/models/login_request_model.dart';
import 'package:gp2/src/features/authentication/screens/forget_password_otp.dart';
import 'package:gp2/src/features/authentication/screens/signup_screen.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              labelText: 'Email',
              validator: validateEmail,
              controller: emailController,
              keyboardType: TextInputType.text,
            ),

            const GradientDivider(),
            //const CustomDivider(),
            const SizedBox(height: 20.0),
            CustomTextFormField(
              obscureText: true,
              labelText: 'Password',
              validator: validatePassword,
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
                          builder: (context) => const OTPScreen()),
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
                  //   if (validateAndSave()) {
                  //     setState(() {
                  //       isApiCallProcess = true;
                  //     });

                  //     String email = emailController.text;
                  //     String password = passwordController.text;

                  //     LoginRequestModel model =
                  //         LoginRequestModel(email: email, password: password);

                  //     APIService.login(model).then(
                  //       (response) {
                  //         setState(() {
                  //           isApiCallProcess = false;
                  //         });

                  //         if (response) {
                  //           Navigator.pushNamedAndRemoveUntil(
                  //             context,
                  //             '/home',
                  //             (route) => false,
                  //           );
                  //         } else {
                  //           FormHelper.showSimpleAlertDialog(
                  //             context,
                  //             Config.appName,
                  //             "Invalid Username/Password !!",
                  //             "OK",
                  //             () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           );
                  //         }
                  //       },
                  //     );
                  //   }
                   },
                  text: 'Sign in'),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Sign in with google account?',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 60,
            ),
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

  // bool validateAndSave() {
  //   final form = globalFormKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
