import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_google_maps/operation.dart';
import 'package:flutter_google_maps/reporteishons.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'main.dart';


class ReporteHecho extends StatefulWidget {
  
  const ReporteHecho({super.key});

@override
  _ReporteHecho createState() => _ReporteHecho();
}

class _ReporteHecho extends State<ReporteHecho> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Reporteishon'),
          backgroundColor: Color.fromARGB(255, 246, 66, 0),
        ),
      body: Center(
        //alignment: Alignment.topCenter,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            bottom: 24,
            left: 40,
            right: 40,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "¡Reorte Hecho!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 19,
                    // height: 19/19,
                  ),
                ),
                onPressed: ()=> TraerReporte(),
                /*() {
                     Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TraerReporte())
                //Reporteishon(products: fetchReport())),
              );
              print(fetchReport());
           // Navigator.of(context).popUntil((route) => route.isFirst);

          },*/
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 119, 246, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]))
    );
    
  }
}