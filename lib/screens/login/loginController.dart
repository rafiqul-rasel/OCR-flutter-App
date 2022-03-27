import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:dialog_loader/dialog_loader.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_ocr/service/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController{
  bool loginWithEmail=false;
final _googleSignIn=GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]
);
var googleAccount=Rx<GoogleSignInAccount?>(null);

Future<void> signIn() async {
  try{
    googleAccount.value=await _googleSignIn.signIn();
  }catch (e){
    print('Error signing in $e');
  }
}

signOut() async{
  googleAccount.value=await _googleSignIn.signOut();
}
Future<void> createToken(String email,String password,BuildContext context) async {

  Map<String, String> body = {
    'email':email,
    'password': password,

  };
  DialogLoader dialogLoader = DialogLoader(context: context);
  dialogLoader.show(
    theme: LoaderTheme.dialogCircle,
    title: Text("Loading"),
    leftIcon: const SizedBox(
      child: CircularProgressIndicator(),
      height: 25.0,
      width: 25.0,
    ),
  );
  try {
    var data = {
      'email':email,
      'password':password,
    };
        Dio.Response response=await dio().post('/login',data: data);
    Map<String, dynamic> userPesponse = jsonDecode(response.toString());
        var token=userPesponse["access_token"];
        var prefs =await  SharedPreferences.getInstance();
    await prefs.setString('token', token);
    final String? getToken = prefs.getString('token');
    Dio.Response profile=await dio().get('/profile', options: Options(
      headers: {
        "authorization": "Bearer $getToken",
      },
    ),);
    var userInfo=jsonDecode(profile.toString());
    dialogLoader.close();
    loginWithEmail=true;
    await prefs.setString('name', userInfo['name']);
    await prefs.setString('email', userInfo['email']);
    final String? getname = prefs.getString('name');
    prefs.commit();
    Get.toNamed('/dashboard');
  }on Dio.DioError catch (e) {
    dialogLoader.close();
  if(e.response?.statusCode == 404){
  print(e.response?.statusCode);
  }else{
  //print(e.message);
    Map<String, dynamic> message = jsonDecode(e.response.toString());
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      text: message['message'],
     // autoCloseDuration: Duration(seconds: 2),
    );


  print(message['message']);
  }
  }

}

logOutwithEmail() async{
  var prefs =await  SharedPreferences.getInstance();
  final String? getToken = prefs.getString('token');
  Dio.Response profile=await dio().get('/logout', options: Options(
    headers: {
      "authorization": "Bearer $getToken",
    },
  ),);
}

}