import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Tagging',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Demo Aplikasi Geo Tagging'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  String strLatLong = 'Belum Mendapatkan Lat dan Long, Silahkan tekan tombol';
  String strAlamat = 'Mencari lokasi...';
  bool loading = false;

  //getLatLong
  Future _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // //getAddress
  Future getAddressFromLongLat(Position position) async {
    List placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    Placemark place = placemarks[0];
    setState(() {
      strAlamat = '${place.street}, ${place.subLocality}, ${place.locality}, '
          '${place.postalCode}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(widget.title),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Titik Koordinat',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              child: Text(strLatLong),
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: strLatLong));
                final snackBar = SnackBar(
                  content: const Text('LatLong berhasil disalin!'),
                  backgroundColor: (Colors.teal),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: 'Tutup',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: GestureDetector(
                child: Text(strAlamat),
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: strAlamat));
                  final snackBar = SnackBar(
                    content: const Text('Alamat berhasil disalin!'),
                    backgroundColor: (Colors.green),
                    action: SnackBarAction(
                      textColor: Colors.white,
                      label: 'Tutup',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });

                      Position position = await _getGeoLocationPosition();
                      setState(() {
                        loading = false;
                        strLatLong =
                            '${position.latitude}, ${position.longitude}';
                      });

                      getAddressFromLongLat(position);
                    },
                    child: const Text(
                      'Tagging Lokasi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Map Geocoding',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MapPage(),
//     );
//   }
// }

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   late MapController _mapController;
//   late LatLng _targetLocation;
//   // double _sheetPosition = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _mapController = MapController();
//     _getLocation();
//   }

//   void _moveCamera() {
//     _mapController.move(
//       _targetLocation,
//       _mapController.zoom,
//     );
//   }

//   Future<List<Placemark>> _getPlacemarks(Position position) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);
//       return placemarks;
//     } catch (e) {
//       print("Error getting placemarks: $e");
//       return [];
//     }
//   }

//   Future<void> _getLocation() async {
//     try {
//       await Geolocator.requestPermission();
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       List<Placemark> placemarks = await _getPlacemarks(position);

//       setState(() {
//         currentLocation = position;
//         currentPlacemarks = placemarks;
//         _targetLocation = LatLng(position.latitude, position.longitude);
//       });
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }

//   Position? currentLocation;
//   List<Placemark> currentPlacemarks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Map'),
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             mapController: _mapController,
//             options: MapOptions(
//               center: LatLng(currentLocation?.latitude ?? -0.9471,
//                   currentLocation?.longitude ?? 100.4172),
//               initialZoom: 12.0,
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: ['a', 'b', 'c'],
//               ),
//               MarkerLayer(markers: [
//                 if (currentLocation != null)
//                   Marker(
//                     point: LatLng(
//                       currentLocation!.latitude,
//                       currentLocation!.longitude,
//                     ),
//                     child: Icon(
//                       Icons.location_pin,
//                       color: Colors.red,
//                       size: 40.0,
//                     ),
//                   )
//               ]),
//             ],
//           ),
//           DraggableScrollableSheet(
//             initialChildSize: 0.1,
//             minChildSize: 0.1,
//             maxChildSize: 0.8,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return GeocodingInfoWidget(
//                 placemarks: currentPlacemarks,
//                 scrollController: scrollController,
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await _getLocation();
//           _moveCamera();
//         },
//         shape: CircleBorder(side: BorderSide(color: Colors.red)),
//         splashColor: Colors.black45,
//         backgroundColor: Colors.white,
//         elevation: 30,
//         child: Icon(
//           Icons.my_location,
//           color: Colors.red,
//         ),
//       ),
//     );
//   }
// }

// class GeocodingInfoWidget extends StatelessWidget {
//   final List<Placemark> placemarks;
//   final ScrollController scrollController;

//   GeocodingInfoWidget(
//       {required this.placemarks, required this.scrollController});

//   @override
//   Widget build(BuildContext context) {
//     Placemark firstPlacemark =
//         placemarks.isNotEmpty ? placemarks.first : Placemark();

//     return Container(
//       padding: EdgeInsets.all(16.0),
//       color: Colors.white,
//       child: SingleChildScrollView(
//         controller: scrollController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//             Text(
//               'Information:',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Negara   : ${firstPlacemark.country}'),
//                 Text('Provinsi : ${firstPlacemark.administrativeArea}'),
//                 Text('Kota     : ${firstPlacemark.subAdministrativeArea}'),
//                 Text('Kecamatan: ${firstPlacemark.locality}'),
//                 Text('Kelurahan: ${firstPlacemark.subLocality}'),
//                 Text('Kode Pos : ${firstPlacemark.postalCode}'),
//                 Text('Jalan    : ${firstPlacemark.name}'),
//                 SizedBox(height: 16.0),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }