import 'dart:convert';
import 'dart:async';
import 'reporte/report.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

Future<List<Report>> fetchReport() async {
  final response =
      await http.get(Uri.parse('https://handsomely-lush-garlic.glitch.me/mostrarReports'));
  if (response.statusCode == 200) {
    return decodeReport(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

TraerReporte(){ 
  final uno = Uno();

  // Make a request for a user with a given ID
  uno.get('https://handsomely-lush-garlic.glitch.me/mostrarReports').then((response){
    print(response.data); // it's a Map<String, dynamic>.
    for(var i=0; i<=response.data.length; i++){
      print(response.data[i]);
    }
     var entryList = response.data.toList();
      print(entryList[0].idreporte);  
   // print(response.request);
   // Report mireporte=Report.fromMap(response.data.toList());
 
   // var idreporteishon= mireporte.idreporte;
    //print("ID reporte: $idreporteishon");
  }).catchError((error){
    print(error); // It's a UnoError.
});
}

List<Report> decodeReport(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Report>((json) => Report.fromMap(json)).toList();
}

Future<Report> sendReport(
     int idreporte, int idtipo, int id, String ubicacion, String fechareporte, String fechaarreglo, String foto, String senal) async {
  final http.Response response = await http.post(
    Uri.parse('https://handsomely-lush-garlic.glitch.me/mostrarReports'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'idreporte': idreporte.toString(),
      'idtipo': idtipo.toString(),
      'idusuario': id.toString(),
      'ubicacion': ubicacion,
      'fechareporte': fechareporte,
      'fechaarreglo':fechaarreglo,
      'foto': foto,
      'senal':senal
    }),
  );
  if (response.statusCode == 201) {
    return Report.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Report> deleteReport(int idreporte) async {
  final http.Response response = await http.delete(
    Uri.parse('url/$idreporte'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Report.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete Report.');
  }
}
