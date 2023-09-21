import 'package:flutter/material.dart';
import 'package:flutter_google_maps/reporte/reporteitem.dart';
import 'report.dart';

class ReportList extends StatelessWidget {
  final List<Report> items;

  const ReportList({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ReportItem(item: items[index]);
      },
    );
  }
}
