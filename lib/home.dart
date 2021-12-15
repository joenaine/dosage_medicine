import 'package:dosage/jidkosti.dart';
import 'package:dosage/kapelnicavchas.dart';
import 'package:dosage/kapvminutu.dart';
import 'package:dosage/percentage.dart';
import 'package:dosage/tabletok.dart';
import 'package:flutter/material.dart';

import 'nepreryvnoe.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> titles = [
    'Количество таблеток',
    'Расчет с процентной концентрацией',
    'Жидкости/Инъекции',
    'Непрерывное вливание/Инфузия',
    'Инфузия/Капельница в час',
    'Инфузия: Капель в минуту'
  ];

  List<Widget> pages = [Page1(), Page6(), Page2(), Page3(), Page4(), Page5()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf0da),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Расчёт доз лекарств',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: titles
              .asMap()
              .map((i, value) => MapEntry(
                    i,
                    Card(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                        child: ListTile(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => pages[i],
                          )),
                          title: Text(
                            value,
                            style: TextStyle(fontSize: 22),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
