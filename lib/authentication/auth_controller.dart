import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/welcome.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  static AuthController instance=Get.find();
  GoogleSignIn googleSignIn= GoogleSignIn(scopes: ['email']);

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
    
  }

  _intialScreen (User? user){
    if(user==null){
      print("Login page");
      Get.offAll(()=>MyHomePage());
    }
    else{
      Get.offAll(()=> Welcome());
    }
  }

  void register(String email, password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About User", "User Message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Account Creation Failed"
      ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        )
      );
    }

  }

  void login(String email, password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "Login Message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Login Failed"
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
      );
    }

  }
  void logout()async{
    await auth.signOut();
  }
}

/*
void SignInWithGoogle() async{

  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth?.idToken,
    accessToken: googleAuth?.accessToken,
  );

}


void SignOut() async{
  await GoogleSignIn().signOut();
}
*/