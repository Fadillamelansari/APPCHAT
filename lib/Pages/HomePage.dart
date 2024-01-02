import 'package:appchat/Pages/login_page.dart';
import 'package:appchat/menu/gps.dart';
import 'package:appchat/menu/lyr_battomAppBar.dart';
import 'package:appchat/menu/lyr_camera.dart';
import 'package:appchat/menu/lyr_cardView.dart';
import 'package:appchat/menu/lyr_cardviewPT.dart';
import 'package:appchat/menu/lyr_lamp.dart';
import 'package:appchat/menu/lyr_tabBar.dart';
import 'package:appchat/menu/lyr_temperature.dart';
import 'package:appchat/service/auth/auth_service.dart';
import 'package:appchat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // sign user out
  void signOut() {
    //  get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // sign out button
          IconButton(
              onPressed: signOut,
              
              icon: const Icon(
                Icons.logout,
                color: mTitleColor,
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 217, 241, 204),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HELLO, WELCOME',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: (context) => const LoginPage()));
                  //   },
                  //   //child:
                  //   // // RotatedBox(
                  //   // //   // quarterTurns:
                  //   // //   //     1, // 90 derajat untuk mendapatkan arah panah ke atas
                  //   // //   // child: Icon(
                  //   // //   //   Icons
                  //   // //   //       .logout_sharp, // Ganti ikon dengan ikon logout yang sesuai
                  //   // //   //   color: Colors.indigo,
                  //   // //   //   size: 28,
                  //   // //   // ),
                  //   // // ),
                  //   // ),
                  //   //],
                  // ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset(
                        'assets/friendship.png',
                        scale: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '-- Monitoring --',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Camera(),
                              ),
                            );
                          },
                          icon: 'assets/camera.png',
                          title: 'CAMERA',
                          color: Color.fromARGB(255, 142, 166, 134),
                          fontColor: Colors.white,
                        ),
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TemperaturePage(),
                              ),
                            );
                          },
                          icon: 'assets/temperatur.png',
                          color: Color.fromARGB(255, 142, 166, 134),
                          fontColor: Colors.white,
                          title: 'TEMPERATURE',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              ),
                            );
                          },
                          icon: 'assets/jps1.png',
                          color: Color.fromARGB(255, 116, 145, 104),
                          fontColor: Colors.white,
                          title: 'GPS',
                        ),
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LampPage(),
                              ),
                            );
                          },
                          icon: 'assets/lamp.png',
                          title: 'LAMP',
                          color: Color.fromARGB(255, 116, 145, 104),
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: _builDrawer(context),
    );
  }
}

Widget _builDrawer(context) {
  return SizedBox(
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // <=== tempat panambahan/pengubahan gambar
            accountName: Text('Fadilla Melan Sari'),
            accountEmail: Text('fadillamelansari472@gmail.com'),
            currentAccountPicture: Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkXap4SIFm5RG86Z_ocq0vjq_8LD-GpWZgZGNygWcbigk0Pp0-oGaXG9Jhi0dHWZkd9qY&usqp=CAU")),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdbSiJZbIE_GuoVcb3VWAqRc9qjNLJQLLpFA&usqp=CAU'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.smart_button),
            title: const Text("Sekolah Dasar"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text('Nama Sekolah Dasar dan Profil sekolah'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LyrTabBar()));
            },
          ),
          ListTile(
            leading: Icon(Icons.smart_button),
            title: const Text("Sekolah Menenggah Pertama"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text('Nama Sekolah Menenggah Pertama dan Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LyrBattomApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.smart_button),
            title: const Text("Sekolah Menengah Atas"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text('Sekolah Menengah Atas dan Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LyrCardView()));
            },
          ),
          // 5   navigasi
          ListTile(
            leading: Icon(Icons.smart_button),
            title: const Text("Perguruan Tinggi"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text('Perguruan Tinggi dan Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LyrCardViewPT()));
            },
          ),
        ],
      ),
    ),
  );
}

Widget _cardMenu({
  required String title,
  required String icon,
  VoidCallback? onTap,
  Color color = Colors.white,
  Color fontColor = Colors.grey,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 36,
      ),
      width: 156,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Image.asset(icon),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
          )
        ],
      ),
    ),
  );
}
