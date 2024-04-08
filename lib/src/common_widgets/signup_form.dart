import 'package:flutter/material.dart';
import 'package:gp2/config.dart';
import 'package:gp2/misc/validators.dart';
import 'package:gp2/services/api_service.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/custom_textfield.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';
import 'package:gp2/src/features/authentication/models/login_request_model.dart';
import 'package:gp2/src/features/authentication/models/register_request_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
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
              labelText: 'First Name',
              validator: validateFirstName,
              controller: firstNameController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              labelText: 'Last Name',
              validator: validateLasttName,
              controller: lastNameController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              labelText: 'Phone number',
              validator: validatePhone,
              controller: phoneController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormField(
              labelText: 'Email',
              validator: validateEmail,
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
              validator: validatePassword,
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
              validator: validateConfirmPassword,
              controller: confirmpasswordController,
              keyboardType: TextInputType.text,
            ),
            const GradientDivider(),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 30,
              width: 140,
              child: CustomButton(
                  onTap: () {

                    //   setState(() {
                    //     isApiCallProcess = true;
                    //   });

                    //   String email = emailController.text;
                    //   String password = passwordController.text;
                    //   String firstName = firstNameController.text;
                    //   String lastName = lastNameController.text;
                    //   String confirmPassword = confirmpasswordController.text;
                    //   int phoneNumber = int.parse(phoneController.text);

                    //   RegisterRequestModel model = RegisterRequestModel(
                    //       firstName: firstName,
                    //       lastName: lastName,
                    //       email: email,
                    //       phoneNumber: phoneNumber,
                    //       password: password,
                    //       confirmPassword: confirmPassword);

                    //   APIService.register(model).then(
                    //     (response) {
                    //       setState(() {
                    //         isApiCallProcess = false;
                    //       });

                    //       if (response.data != null) {
                    //         FormHelper.showSimpleAlertDialog(
                    //           context,
                    //           Config.appName,
                    //           "Registration Successful. Please login to the account",
                    //           "OK",
                    //           () {
                    //             Navigator.pushNamedAndRemoveUntil(
                    //               context,
                    //               '/',
                    //               (route) => false,
                    //             );
                    //           },
                    //         );
                    //       } else {
                    //         FormHelper.showSimpleAlertDialog(
                    //           context,
                    //           Config.appName,
                    //           response.message,
                    //           "OK",
                    //           () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         );
                    //       }
                    //     },
                    //   );
                    // }
                  },
                  text: 'Sign up'),
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
