import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gp2/src/features/authentication/screens/forcasting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../utils/api_endpoints.dart';
import '';

class LoginController extends GetxController{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final Future <SharedPreferences>_prefs = SharedPreferences.getInstance();
  Future<void> login()async{
    try{
      //var hearders ={'Content-type':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.login);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response=await http.post(url,body: jsonEncode(body),);
      if(response.statusCode==200) {
        final json = jsonDecode(response.body);
        Get.off(ForecastingScreen());
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