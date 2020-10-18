import 'package:boba_map/pages/activity_feed_page.dart';
import 'package:boba_map/pages/drink_form_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:boba_map/pages/user_profile_page.dart';
import 'package:boba_map/pages/friends_list_page.dart';

// class Singleton {

//   static final Singleton _singleton = Singleton._internal();
//   static List list;

//   factory Singleton() {
//     return _singleton;
//   }

//   Singleton._internal();
// }

void main() {
  // var activityFeed = Singleton();
  // Singleton.list = List();
  // Singleton.list.add("Carissa just sipped a new drink!");
  // print(Singleton.list[0]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  // Location location = Location();
  // --Add Location Service & Permission status here--

  // Atlanta coordinates: 33.7490° N, 84.3880° W
  static final LatLng _center = const LatLng(33.7490, -84.3880);

  final Set<Marker> _markers = Set();

  LatLng _lastMapPosition = _center;

  @override
  void initState() {
    super.initState();

    final marker0 = Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.8982, -84.2833),
      infoWindow: InfoWindow(
        title: '4.85/5',
        snippet: 'Meet Fresh',
      )
    );
    _markers.add(marker0);
    final marker1 = Marker(
      markerId: MarkerId('2'),
      position: LatLng(33.75, -84.38),
      infoWindow: InfoWindow(
        title: '4.7/5',
        snippet: 'KFT',
      )
    );
    _markers.add(marker1);
    final marker2 = Marker(
      markerId: MarkerId('3'),
      position: LatLng(33.78, -84.384),
      infoWindow: InfoWindow(
        title: '4.2/5',
        snippet: 'Sweet Hut',
      )
    );
    _markers.add(marker2);
    final marker3 = Marker(
      markerId: MarkerId('4'),
      position: LatLng(33.74, -84.38),
      infoWindow: InfoWindow(
        title: '4.5/5',
        snippet: 'Sweet & Fresh',
      )
    );
    _markers.add(marker3);
    final marker4 = Marker(
      markerId: MarkerId('5'),
      position: LatLng(34.02, -84.1922),
      infoWindow: InfoWindow(
        title: '4.45/5',
        snippet: 'Maji Tea Bar',
      )
    );
    _markers.add(marker4);
    final marker5 = Marker(
      markerId: MarkerId('6'),
      position: LatLng(34.02, -84),
      infoWindow: InfoWindow(
        title: '4.9/5',
        snippet: 'Greatea',
      )
    );
    _markers.add(marker5);
    final marker6 = Marker(
      markerId: MarkerId('7'),
      position: LatLng(34.035, -84.185),
      infoWindow: InfoWindow(
        title: '4.85/5',
        snippet: 'Greatea',
      )
    );
    _markers.add(marker6);
    final marker7 = Marker(
      markerId: MarkerId('8'),
      position: LatLng(34.004, -84.1734),
      infoWindow: InfoWindow(
        title: '4.45/5',
        snippet: 'Sharetea',
      )
    );
    _markers.add(marker7);
    final marker8 = Marker(
      markerId: MarkerId('9'),
      position: LatLng(33.942, -84.126),
      infoWindow: InfoWindow(
        title: '4.9/5',
        snippet: 'Greatea',
      )
    );
    _markers.add(marker8);
    final marker9 = Marker(
      markerId: MarkerId('10'),
      position: LatLng(33.949, -84.127),
      infoWindow: InfoWindow(
        title: '4.85/5',
        snippet: 'OneZo',
      )
    );
    _markers.add(marker9);
    final marker10 = Marker(
      markerId: MarkerId('11'),
      position: LatLng(33.958, -84.143),
      infoWindow: InfoWindow(
        title: '4.45/5',
        snippet: 'Cuckoo\'s Cafe',
      )
    );
    _markers.add(marker10);
    final marker11 = Marker(
      markerId: MarkerId('12'),
      position: LatLng(33.957, -84.136),
      infoWindow: InfoWindow(
        title: '4.9/5',
        snippet: 'Yi Fang Taiwan Fruit Tea',
      )
    );
    _markers.add(marker11);
    final marker12 = Marker(
      markerId: MarkerId('13'),
      position: LatLng(33.962, -84.135),
      infoWindow: InfoWindow(
        title: '4.85/5',
        snippet: 'Sweet Hut',
      )
    );
    _markers.add(marker12);
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Tea Top',
          snippet: '4/5',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.map_outlined)),
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.person_outline)),
              ],
              ),
              title: Text('Boba Map'),
              backgroundColor: const Color(0xFF1DE9B6),
          ),
          body: TabBarView(
            children: [
              GoogleMap(
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
                mapType: MapType.normal,
                markers: Set<Marker>.of(_markers),
                onCameraMove: _onCameraMove,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
              ),
              ActivityFeedPage(),
              FriendsPage(),
              UserProfilePage(),
            ],
          ),
          floatingActionButton: Builder(
            builder: (context) => Container(
              height: 100.0,
              width: 100.0,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrinkFormPage()),
                    );
                    print(result);
                    _onAddMarkerButtonPressed();
                  },
                  child: ImageIcon(
                    AssetImage("assets/images/boba_icon.png")),
                  backgroundColor: const Color(0xFF1DE9B6),
                )
              )
            )
          )
        ),
      ),
    );
  }
}