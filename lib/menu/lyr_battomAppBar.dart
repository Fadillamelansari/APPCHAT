import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//class Contoh BottomAppBar1
class LyrBattomApp extends StatefulWidget {
  const LyrBattomApp({super.key});

  @override
  State<LyrBattomApp> createState() => _ContohBottomAppBar1state();
}

class _ContohBottomAppBar1state extends State<LyrBattomApp> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sekolah Menengah Pertama'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 89),
        children: <Widget>[
          // SwitchListTile(
          //   title: const Text(
          //     'Tampilkan Floating Buttom',
          //   ),
          //   value: _showFab,
          //   onChanged: _onShowFabChanged,
          // ),
          // SwitchListTile(
          //   title: const Text(
          //     'Tampilkan Border',
          //   ),
          //   value: _showNotch,
          //   onChanged: _onShowNotchChanged,
          // ),
          const Padding(
            padding: EdgeInsets.all(16),
            // child: Text('Posisi Floating Action Button'),
          ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('SMP Negeri 14 Padang'),
          //   value: FloatingActionButtonLocation.endDocked,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,

          // ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('Profil Sekolah'),
          //   value: FloatingActionButtonLocation.centerDocked,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,
          // ),
          ListTile(
            leading: Icon(Icons.school_rounded),
            title: const Text("SMP Negeri 14 Padang"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            // trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text(''),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => GalerySMP()));
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: const Text("Profil Sekolah"),
            selected: true,
            //===--------------------------
            // interaksi Menu dngan Halaman Lain, jika diklik
            //==========================
            // trailing: const Icon(Icons.radio_button_checked_outlined),
            subtitle: const Text('Geleri'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GalerySMP()));
            },
          ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('Tumpuk Di Kiri'),
          //   value: FloatingActionButtonLocation.startDocked,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,
          // ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('Ambang Di Kanan'),
          //   value: FloatingActionButtonLocation.endFloat,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,
          // ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('Ambang Di Tengah'),
          //   value: FloatingActionButtonLocation.centerFloat,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,
          // ),
          // RadioListTile<FloatingActionButtonLocation>(
          //   title: const Text('Ambang di Kiri'),
          //   value: FloatingActionButtonLocation.startFloat,
          //   groupValue: _fabLocation,
          //   onChanged: _onFabLocationChanged,
          // ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Crate',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemoBottomAppBar1(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    ));
  }
}

//class DemoBottomAppBar1
class _DemoBottomAppBar1 extends StatelessWidget {
  const _DemoBottomAppBar1({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Menu Navigasi',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Pencarian',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Suka',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

//selanjutnay class ContohBantomAppBar2....
class ContohBottomAppBar2 extends StatefulWidget {
  const ContohBottomAppBar2({super.key});

  @override
  State<ContohBottomAppBar2> createState() => _ContohBottomAppBar2state();
}

class _ContohBottomAppBar2state extends State<ContohBottomAppBar2> {
  static const List<Color> colors = <Color>[
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
  ];
  static final List<Widget> items = List<Widget>.generate(
    colors.length,
    (int index) => Container(color: colors[index], height: 150.0),
  ).reversed.toList();
  late ScrollController _controller;
  bool _showFab = true;
  bool _isElevated = true;
  bool _isVisible = true;
  FloatingActionButtonLocation get _fabLocation => _isVisible
      ? FloatingActionButtonLocation.endContained
      : FloatingActionButtonLocation.endFloat;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onElevatedChanged(bool value) {
    setState(() {
      _isElevated = value;
    });
  }

  void _addNewItem() {
    setState(() {
      items.insert(
        0,
        Container(color: colors[items.length % 5], height: 150.0),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Battom App Bar'),
        ),
        body: Column(
          // padding: const EdgeInsets.only(bottom: 89),
          children: <Widget>[
            SwitchListTile(
              title: const Text(
                'Floating Action Buttom',
              ),
              value: _showFab,
              onChanged: _onShowFabChanged,
            ),
            SwitchListTile(
              title: const Text(
                'Battom App Bar Elevation',
              ),
              value: _isElevated,
              onChanged: _onElevatedChanged,
            ),
            Expanded(
              child: ListView(
                controller: _controller,
                children: items.toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: _addNewItem,
                tooltip: 'Tambahkan Item Baru',
                elevation: _isVisible ? 0.0 : null,
                child: const Icon(Icons.add),
              )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar:
            _DemoBottomAppBar2(isElevated: _isElevated, isVisible: _isVisible),
      ),
    );
  }
}

class _DemoBottomAppBar2 extends StatelessWidget {
  const _DemoBottomAppBar2({
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: isElevated ? null : 0.0,
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Buka popup menu',
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                final SnackBar snackBar = SnackBar(
                  content: const Text('Ini Adalah SnackBar !'),
                  action: SnackBarAction(
                    label: 'Ulangi',
                    onPressed: () {},
                  ),
                );

                /// and use it to show a SnackBar
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            IconButton(
              tooltip: 'Pencarian',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Suka',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/////class galery smp
class GalerySMP extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      title: 'SMP Negeri 14 Padang',
      description: 'This is the description for Card 1.',
      imagePath: 'assets/smp1.jpg',
    ),
    CardItem(
      title: 'Card 2',
      description: 'This is the description for Card 2.',
      imagePath: 'assets/smp2.jpg',
    ),
    CardItem(
      title: 'Card 3',
      description: 'This is the description for Card 3.',
      imagePath: 'assets/smp3.jpg',
    ),
    CardItem(
      title: 'Card 4',
      description: 'This is the description for Card 3.',
      imagePath: 'assets/smp4.jpg',
    ),
    CardItem(
      title: 'Card 5',
      description: 'This is the description for Card 3.',
      imagePath: 'assets/smp5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gelery Sekolah'),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return cardItems[index];
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  CardItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
