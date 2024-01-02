// SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               FadeInUp(
//                 duration: Duration(milliseconds: 1000),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   decoration: BoxDecoration(
//                       color: Color(0xFFEB6E4E),
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(42),
//                           bottomRight: Radius.circular(42)),
//                       border: Border.all(width: 2, color: Color(0xFFEB6E4E))),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       FadeInUp(
//                         duration: Duration(milliseconds: 1000),
//                         child: ListBody(
//                           children: [
//                             SizedBox(height: 60),
//                             Text(
//                               'Selamat Datang     Kembali 😊!',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 height: 0,
//                               ),
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               'Silahkan masukkan email dan password anda untuk login kembali.',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.4,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: 20)
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               FadeInDown(
//                 duration: Duration(milliseconds: 1000),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             child: Text(
//                               'Email :',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       MyTextField(
//                           suffixIcon: null,
//                           prefixIcon: Icon(Icons.email),
//                           controller: emailcontroller,
//                           hinText: '    Email Address',
//                           obscureText: false),

//                       const SizedBox(height: 25),

//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             child: Text(
//                               'Password :',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 8),

//                       //Password TextField
//                       MyTextField(
//                           suffixIcon: Icon(Icons.remove_red_eye),
//                           prefixIcon: null,
//                           controller: passwordControler,
//                           hinText: '    Password',
//                           obscureText: true),
//                       const SizedBox(height: 10),
//                       GestureDetector(
//                           onTap: () => {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             LupaPasswordScreen())),
//                               },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               const Text(
//                                 'Lupa Password ?',
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                       const SizedBox(height: 10),

//                       //sign in button
//                       MyButton(onTap: signIn, text: 'MASUK'),
//                       const SizedBox(height: 10),
//                       SizedBox(
//                         child: Container(
//                           decoration: const ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                   side: BorderSide(
//                             width: 1,
//                             strokeAlign: BorderSide.strokeAlignCenter,
//                             color: Color(0xFFEAEAEA),
//                           ))),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       MyButton2(
//                           text: 'Login With Google',
//                           image: AssetImage('assets/googlelogo.png')),
//                       const SizedBox(height: 20),

//                       //not a member? register now
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Tidak Punya Akun?',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           GestureDetector(
//                               onTap: widget.onTap,
//                               child: const Text(
//                                 'Sign Up',
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               )),
//                         ],
//                       ),
//                       const Image(
//                         image: NetworkImage(
//                             'https://img.freepik.com/free-vector/people-waving-hand-illustration-concept_52683-29825.jpg?w=1380&t=st=1702282693~exp=1702283293~hmac=7474dd964256f72cb22cd2a3ccd0988555fee15b05b8787034a889d9300c38ed'),
//                         height: 230,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),