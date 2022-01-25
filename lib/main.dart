import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_ocr/screens/dashBoard/DashBoardScreen.dart';
import 'package:my_ocr/screens/login/LoginScreen.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => const MyApp()),
      GetPage(name: '/login', page: () => const LoginScreen()),
      GetPage(name: '/dashboard', page: () => const DashBoardScreen()),
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body:    Container(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          Image.asset("assets/images/main_logo.png"),
          const SizedBox(height: 120,),
          const Text("Welcome!",style: TextStyle(color: Colors.white,fontSize: 55),),
          const SizedBox(height: 20,),
          const Text("We're Glad You're Here",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          const Text("Let's Get Started!",style: TextStyle(color: Colors.red,fontSize: 25),),
          const SizedBox(height: 10,),
          const Icon(FontAwesomeIcons.angleDoubleRight,
            size: 50, //Icon Size
            color: Colors.red, //Color Of Icon
          ),
          const SizedBox(height: 40,),
          Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
              Get.toNamed('/login');
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 340,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text('Get Started', style: TextStyle(fontSize: 18,color: Colors.white),)
              ),
            ),
          ),
        ],)
      )
    );
  }
}
