import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../screens/login_screen.dart';
import '../utils/api_endpoints.dart';
import '';

class RegisterationController extends GetxController{
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late TextEditingController emailController;
  //late TextEditingController phoneController;

  final Future <SharedPreferences>_prefs = SharedPreferences.getInstance();
  Future<void> register(BuildContext context)async{
    try{
      //var hearders ={'Content-type':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.register);
      Map body = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'car_license':"#######",
        //'phone': phoneController.text,
      };
      http.Response response=await http.post(url,body: jsonEncode(body));
      if(response.statusCode==200){
        final json=jsonDecode(response.body);
        Get.off(LoginScreen());
      }

        else{
          throw jsonDecode(response.body)["message"]??"unknown Error Occured";
        }
      }
    catch(e){
      showDialog(context: Get.context!, builder: (contex){
        return SimpleDialog(title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [Text(e.toString())],
        );
      });
    }
  }
}