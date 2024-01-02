import 'package:appchat/components/My_Button.dart';
import 'package:appchat/service/auth/auth_service.dart';
import 'package:appchat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginPage extends StatefulWidget {
  final void Function()? press;
  const LoginPage({super.key, required this.press});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  bool? remember = false;

  // Text controller
  final emailController = TextEditingController(text: "melan@gmail.com");
  final passwordController = TextEditingController(text: "123456");

  FocusNode focusNode = new FocusNode();

  // sign in user
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[90],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                // Logo
                SizedBox(
                  height: 80,
                ),
                SimpleShadow(
                  child: Image.asset("assets/friendship.png", height: 180),
                  opacity: 0.1,
                  color: kSecondaryColor,
                  offset: Offset(5, 5),
                  sigma: 9,
                ),
                SizedBox(
                  height: 50,
                ),

                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login !",
                          style: mTitleStyle,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                // Email
                TextField(
                    controller: emailController,
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
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.mail))),

                SizedBox(
                  height: 20,
                ),

                // Password
                TextField(
                    controller: passwordController,
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
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.key))),

                SizedBox(
                  height: 25,
                ),

                Row(
                  children: [
                    Checkbox(
                        value: remember,
                        onChanged: (Value) {
                          setState(() {
                            remember = Value;
                          });
                        }),
                    Text("Tetap masuk"),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // pindah halaman
                      },
                      child: Text(
                        "Lupa password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),

                // Sign in button
                DefaultButtonCustomeColor(
                  color: kPrimaryColor,
                  text: "Masuk",
                  press: signIn,
                ),

                // tidak punya akun
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun ? ",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    GestureDetector(
                      onTap: widget.press,
                      child: const Text(
                        "Daftar disini",
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
      ),
    );
  }
}
