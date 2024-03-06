import 'package:flutter/material.dart';
import 'package:gp2/misc/validators.dart';
import 'package:gp2/src/common_widgets/custom_button.dart';
import 'package:gp2/src/common_widgets/custom_textfield.dart';
import 'package:gp2/src/common_widgets/gradient_divider.dart';

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
              child: CustomButton(onTap: () {}, text: 'Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
