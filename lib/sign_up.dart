import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/authentication/auth_controller.dart';
import 'package:flutter_firebase/welcome.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  var emailController= TextEditingController();
  var passwordController = TextEditingController();

@override
  Widget build(BuildContext context) {
  /*
  List images =[
    "f.png",
    "g.png",
    "t.png"
    ];
   */

    double  w =MediaQuery.of(context).size.width;
    double  h =MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "images/signup.png"
                  ),
                  fit: BoxFit.cover,
                )
            ),


          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.grey[500],
                  ),
                ),

                SizedBox(height: 50,),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ]
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Your Email Address",
                      prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ]
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      prefixIcon: Icon(Icons.password, color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(
                        "images/loginbtn.png"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30 ,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),


            ),
          ),
          SizedBox(height: w*0.1,),

          RichText(text: TextSpan(
              text: '''Already have an account?''',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              children: [
                TextSpan(
                  text: ''' Sign in''',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>MyHomePage())
                ),
              ]
          )),

          Wrap(
            children: List.generate(
              1,
                (index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white54,

                    child: GestureDetector(
                      onTap: (){
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "images/g.png"
                        ),
                      ),
                    ),
                  ),
                );
                }
            ),
          )
        ],
      ),
    );
  }
}


