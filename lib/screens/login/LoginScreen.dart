import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController=TextEditingController();
  final _emailController=TextEditingController();
  var _passwordVisible = false;
  bool _remember = false;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75,),
          Image.asset("assets/images/logo.png",height: 170,width: 200,),
          const SizedBox(height: 15,),
          const Text("Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
         const SizedBox(height: 15,),
          const Text("Please login to continue ",style: TextStyle(fontSize: 16),),
            const SizedBox(height: 50,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        prefixIcon: Icon(FontAwesomeIcons.envelope),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,//This will obscure text dynamically
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        // Here is key idea
                        prefixIcon: const Icon(FontAwesomeIcons.lock,size: 20,),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
              children: [
                Expanded(
                    child:CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Remember me"),
                      value: _remember,
                      onChanged: (Value) {
                        setState(() {
                          _remember=!_remember;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    )
                ),
                TextButton(onPressed: ()=>{}, child: const Text("Forgot Password?")),
              ],
            ),
            ),
            const SizedBox(height: 30,),
            Material(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/dashboard');
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Sign In', style: TextStyle(fontSize: 18,color: Colors.white),)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("or sign in via",style: TextStyle(fontStyle: FontStyle.italic),),
            const SizedBox(height: 20,),
            Material(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                 // Get.toNamed('/login');
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Sign In with Google', style: TextStyle(fontSize: 18,color: Colors.white),)
                ),
              ),
            ),
        ],),
      )
    );
  }
}
