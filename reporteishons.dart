import 'package:flutter/material.dart';
import 'dart:async';
import 'reporte/report.dart';
import 'reporte/reporteList.dart';
import 'operation.dart';


class Reporteishon extends StatelessWidget {
  final Future<List<Report>> products;
  Key k = new Key("");
  Reporteishon({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reporte"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Report>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ReportList(items: snapshot.data!, key: k)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
