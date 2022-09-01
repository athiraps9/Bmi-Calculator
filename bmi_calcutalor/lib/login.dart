import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Login());

}

 class Login extends StatefulWidget {
   const Login({Key? key}) : super(key: key);

   @override
   State<Login> createState() => _LoginState();
 }

 class _LoginState extends State<Login> {
   final TextEditingController _email = TextEditingController();
   final TextEditingController _password = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
         home: SafeArea(
         child: Scaffold(
         appBar: AppBar(
           title: Text('login'),
     ),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextField(
                   controller: _email,
                   decoration:InputDecoration(
                       contentPadding: const EdgeInsets.all(0.0),
                     hintText: 'Enter Your Email'

                   ),
                 ),
                 TextField(
                   controller: _password,
                   decoration:InputDecoration(
                       contentPadding: const EdgeInsets.all(0.0),
                       hintText: 'Enter Your Password'
                   ),
                 ),
                 ElevatedButton(onPressed:() {

                   registration(_email.text.toString(), _password.text.toString());

                 }, child: Text('Sign Up')),
                 TextButton(onPressed:() {
                   signin(_email.text.toString(), _password.text.toString());

                 }, child: Text('Sign In')),
               ],
             ),
           ),

     ),
         ),


     );

   }


   signin(email,password) async {


     try {
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email,
           password: password
       );
     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         print('No user found for that email.');
       } else if (e.code == 'wrong-password') {
         print('Wrong password provided for that user.');
       }
     }
   }

 }


 registration(email,password) async {
   try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password
     );
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
   } catch (e) {
     print(e);
   }

 }