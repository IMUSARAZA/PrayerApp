import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:prayerapp/const/appColors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MapPage(longitude: 31.4030481379793, latitude: 74.2128057566662));
}



class MapPage extends StatefulWidget {

  final longitude, latitude;

  const MapPage({this.longitude, this.latitude, Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _userLocation;
  List<Marker> _mosques = [];
  // Position ?position;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {

    setState(() {
      _userLocation = LatLng(widget.longitude, widget.latitude);
    });

    _fetchMosques();
  }

  void _fetchMosques() async {
  String url =
      'https://api.mapbox.com/geocoding/v5/mapbox.places/Mosque.json?proximity=${_userLocation!.longitude},${_userLocation!.latitude}&access_token=sk.eyJ1IjoiaW11c2FyYXphIiwiYSI6ImNscWZtYTNkdDB4b3gyanRrNGMxYWZicjIifQ.Hv-ZmGh-DWqaXsXTyvvKAQ';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      setState(() {
        _mosques = (data['features'] as List)
            .where((feature) =>
                (feature['properties']['category'] as String?)?.contains('mosque') ==
                true)
            .map<Marker>((feature) {
              return Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  feature['geometry']['coordinates'][1],
                  feature['geometry']['coordinates'][0],
                ),
                builder: (ctx) => Icon(
                  Icons.mosque,
                  size: 20,
                  color: appColors.appBasic,
                ),
              );
            })
            .toList();
      });
      print(_mosques);
    } else {
      print('Failed to load mosques: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching mosques: $e');
  }
}





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(widget.longitude, widget.latitude),
            zoom: 15,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=sk.eyJ1IjoiaW11c2FyYXphIiwiYSI6ImNscWZtYTNkdDB4b3gyanRrNGMxYWZicjIifQ.Hv-ZmGh-DWqaXsXTyvvKAQ',
            ),
            MarkerLayerOptions(markers: _mosques),
          ],
        ),
      ),
    );
  }
}

