import 'package:flutter/material.dart';
import 'package:flutter_google_maps/login.dart';
import 'package:flutter_google_maps/reporte.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'camara.dart';
import 'src/locations.dart' as locations;

void main() => runApp(MaterialApp(
      title: "App",
      home: LogIn(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

 

class _HomeScreen extends State<HomeScreen>  {
   final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reporteishon'),
          backgroundColor: Color.fromARGB(255, 246, 66, 0),
        ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(19.4020, -99.264),
            zoom: 19,
          ),
          markers: _markers.values.toSet(),
          
        ),
      Positioned(
            bottom: 24,
            left: 40,
            right: 40,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "Reportar",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 19,
                    // height: 19/19,
                  ),
                ),
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraExampleHome()),
              );
            },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 246, 66, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          )
  
          ]
      )
    );
  }
}
