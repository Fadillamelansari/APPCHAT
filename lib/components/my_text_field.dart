// import 'package:appchat/utils/constants.dart';
// import 'package:flutter/material.dart';

// class MyTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;

//   const MyTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     required this.obscureText,
//     });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: "E-mail",
//         enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.black)
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.black)
//       ),
//       fillColor: mBorderColor,
//       filled:  true,
//       hintText: hintText, 
//       hintStyle: const TextStyle(color: Colors.white)
//       ),
//     );
//   }
// }