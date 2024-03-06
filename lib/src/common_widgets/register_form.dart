import 'package:flutter/material.dart';
import 'package:gp2/misc/validators.dart';
import 'package:gp2/src/common_widgets/custom_divider.dart';



class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateFirstName,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateLasttName,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validatePhone,
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateEmail,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validatePassword,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateConfirmPassword,
                controller: confirmpasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Color(0xff076092),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 30,
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1FDEF5),
                  textStyle: const TextStyle(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
