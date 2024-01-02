import 'package:flutter/material.dart';

class LyrTabBar extends StatelessWidget {
  const LyrTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sekolah Dasar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.school_outlined),
              ),
              Tab(
                icon: Icon(Icons.image),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "SDN 22 Koto Lalang \n\n Alamat: Koto Duku RT.04/RW.04 \n Kelurahan Koto Lalang \n Kecamatan Lubuk Kilangan \n Kota Padang ",
              ),
            ),
            Center(child: Image(image: AssetImage('assets/sd.jpg'))),
          ],
        ),
      ),
    );
  }
}
