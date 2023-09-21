import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_google_maps/operation.dart';
import 'package:flutter_google_maps/reporteecho.dart';
import 'package:flutter_google_maps/reporteishons.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'main.dart';


class SecondRoute extends StatefulWidget {
  
  const SecondRoute({super.key});

@override
  _SecondRoute createState() => _SecondRoute();
}

class _SecondRoute extends State<SecondRoute> {
  var location = new Location();
  
  //final location = await getLocation();
 


  final List<Map<String, dynamic>> _items = [
    {
    'value': 'urgente',
    'label': 'Peligroso',
    'icon': Icon(Icons.dangerous),
  },
  {
    'value': 'grafiti',
    'label': 'Grafiti',
    'icon': Icon(Icons.format_paint),
  },
  {
    'value': 'plomeria',
    'label': 'Plomería',
    'icon': Icon(Icons.plumbing),
    //'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'electrico',
    'label': 'Eléctrico',
    'icon': Icon(Icons.lightbulb),
  },
   {
    'value': 'equipo',
    'label': 'Equipo descompuesto',
    'icon': Icon(Icons.computer),
  },
   {
    'value': 'naturaleza',
    'label': 'Naturaleza',
    'icon': Icon(Icons.emoji_nature),
  },
  {
    'value': 'limpieza',
    'label': 'Limpieza',
    'icon': Icon(Icons.cleaning_services),
  },
    {
    'value': 'construccion',
    'label': 'Estructural',
    'icon': Icon(Icons.construction),
  },
    {
    'value': 'vial',
    'label': 'Vial',
    'icon': Icon(Icons.car_crash),
  },
    {
    'value': 'internet',
    'label': 'Internet',
    'icon': Icon(Icons.signal_wifi_statusbar_connected_no_internet_4),
  },
  {
    'value': 'seguridad',
    'label': 'Seguridad',
    'icon': Icon(Icons.security),
  },
  {
    'value': 'otro',
    'label': 'Otro',
    'icon': Icon(Icons.question_mark),
  },
];


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
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: '',
            icon: Icon(Icons.warning_amber),
            labelText: 'Tipo incidente',
            items: _items,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
      
          DateTimeFormField(
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.redAccent),
                    icon: Icon(Icons.event_note),
                    labelText: 'Fecha',
                  ),
                  firstDate: DateTime.now().add(const Duration(days: 10)),
                  lastDate: DateTime.now().add(const Duration(days: 40)),
                  initialDate: DateTime.now().add(const Duration(days: 20)),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                    
                  },
                ),
                TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Señales que pueden identificar mejor el lugar del incidente',
              labelText: 'Señales',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.location_on),
              hintText: 'Ubicación',
              labelText: 'Ubicación',
              
            ),
            onSaved: (String? value) async {
              // This optional block of code can be used to run
              // code when the user saves the form.
              var currentlocation = await location.getLocation();
                print("Location: ${currentlocation}");
            
            },
            validator: (String? value) {
              return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            },
          ),
          Positioned(
            bottom: 24,
            left: 40,
            right: 40,
            child: SizedBox(
              height: 50,
              child: TextButton(
                child: const Text(
                  "¡Reporteishon!",
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
                MaterialPageRoute(builder: (context) => ReporteHecho()),
              );
            },
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