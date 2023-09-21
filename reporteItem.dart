import 'package:flutter/material.dart';

import 'report.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key, required this.item});

  final Report item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.ubicacion,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("id:${this.item.id}"),
                            Text("tiporeporte:${this.item.idtipo}"),
                          ],
                        )))
              ]),
        ));
  }
}
