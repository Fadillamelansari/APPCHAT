import 'package:appchat/Pages/HomePage.dart';
import 'package:appchat/Pages/login_page.dart';
import 'package:appchat/components/My_Button.dart';
import 'package:appchat/service/auth/auth_service.dart';
import 'package:appchat/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? press;
  const RegisterPage({super.key, required this.press});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  bool? remember = false;

  // Text controller
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _usernameNamaPengguna = TextEditingController();
  TextEditingController _userEmail = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  FocusNode focusNode = new FocusNode();

// sign up user
  void _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _userEmail.text,
        password: _passwordController.text,
      );

      User? user = userCredential.user;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      String errorMessage = 'Terjadi Kesalahan';
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email sudah digunakan';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Format email atau password salah';
        }
      }

      _showErrorDialog(errorMessage);
    }
  }

  Future<void> _showErrorDialog(String errorMessage) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error!'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

// get auth service
//     final authService = Provider.of<AuthService>(context, listen: false);

//     try {
//       await authService.signUpWithEmailandPassword(
//         emailController.text,
//         passwordController.text,
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(e.toString()),
//         ),
//       );
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[90],
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),

              Image.asset("assets/friendship.png"),
              // Icon(
              //   Icons.person_add,
              //   size: 150,
              //   color: kPrimaryColor,
              // ),

              SizedBox(
                height: 10,
              ),

              // create an account
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Let's create an account for you!",
                        style: mTitleStyle,
                      ),
                    ],
                  )),

              SizedBox(
                height: 50,
              ),

              // Email
              TextField(
                  controller: _userEmail,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "Masukan e-mail anda",
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? mSubtitleColor
                              : kPrimaryColor,
                          fontWeight: FontWeight.w500),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.mail))),

              SizedBox(
                height: 20,
              ),

              // Password
              TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Masukan password anda",
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? mSubtitleColor
                              : kPrimaryColor,
                          fontWeight: FontWeight.w500),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.key))),
              SizedBox(
                height: 20,
              ),

// Confirm Password
              TextField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm password",
                      hintText: "Masukan ulang password anda",
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? mSubtitleColor
                              : kPrimaryColor,
                          fontWeight: FontWeight.w500),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.key))),

              SizedBox(
                height: 30,
              ),

              Divider(
                color: Colors.black38,
              ),

              SizedBox(
                height: 10,
              ),

              // Sign up button
              DefaultButtonCustomeColor(
                color: kPrimaryColor,
                text: "Daftar",
                press: _register,
              ),

              // sudah punya akun
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah punya akun ? ",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  GestureDetector(
                    onTap: widget.press,
                    child: const Text(
                      "Masuk disini",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
// class SignUpPage extends StatefulWidget {
//   final void Function()? press;
//   const SignUpPage({super.key, required this.press});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   String? username;
//   String? password;
//   bool? remember = false;

//   // Text controller
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   FocusNode focusNode = new FocusNode();

//   // sign up user
//   void signUp() async {
//     // get the auth service
//     final authService = Provider.of<AuthService>(context, listen: false);

//     try {
//       await authService.signUpWithEmailandPassword(
//         emailController.text,
//         passwordController.text,
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(e.toString()),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Column(
//               children: [
//                 // Logo
//                 SizedBox(
//                   height: 80,
//                 ),
//                 // SimpleShadow(
//                 //   child: Image.asset("assets/friendship.png", height: 180),
//                 //   opacity: 0.1,
//                 //   color: kSecondaryColor,
//                 //   offset: Offset(5, 5),
//                 //   sigma: 9,
//                 // ),
//                 SizedBox(
//                   height: 50,
//                 ),

//                 Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Sign Up !",
//                           style: mTitleStyle,
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Email
//                 TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                         labelText: "E-mail",
//                         hintText: "Masukan e-mail anda",
//                         labelStyle: TextStyle(
//                             color: focusNode.hasFocus
//                                 ? mSubtitleColor
//                                 : kPrimaryColor,
//                             fontWeight: FontWeight.w500),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 2, color: Colors.black),
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: Icon(Icons.mail))),

//                 SizedBox(
//                   height: 20,
//                 ),

//                 // Password
//                 TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         labelText: "Password",
//                         hintText: "Masukan password anda",
//                         labelStyle: TextStyle(
//                             color: focusNode.hasFocus
//                                 ? mSubtitleColor
//                                 : kPrimaryColor,
//                             fontWeight: FontWeight.w500),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 2, color: Colors.black),
//                             borderRadius: BorderRadius.circular(20)),
//                         prefixIcon: Icon(Icons.lock))),

//                 SizedBox(
//                   height: 20,
//                 ),

//                 // Sign Up Button
//                 ElevatedButton(
//                   onPressed: signUp,
//                   child: Text('Sign Up'),
//                 ),
//               ],
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }
