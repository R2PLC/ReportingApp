import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_google_maps/operation.dart';
import 'package:flutter_google_maps/reporteishons.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'main.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);
 
  static const String _title = 'Sample App';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                
                child: const Text(
                  'Dora la Reportadora',
                  style: TextStyle(
                      color:Color.fromARGB(255, 246, 66, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Ai se mi olvidó :(', style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 246, 66, 0),),
                  ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 246, 66, 0)),),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('No tienes cuenta?'),
                TextButton(
                  child: const Text(
                    'Pos ni modo :(',
                    style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 246, 66, 0),),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}