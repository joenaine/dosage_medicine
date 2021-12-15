import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  String drugs;
  String rastvor;
  double birlik1 = 1;
  double birlik2 = 1;
  String init1Measure = 'мл';
  String init2Measure = 'г';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf0da),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Расчет с процентной концентрацией'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180,
                        alignment: Alignment.center,
                        child: Text('Процент Вещества', style: _style()),
                      ),
                      SizedBox(
                          width: 120,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _controller1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelStyle: TextStyle(fontSize: 18)),
                            style: TextStyle(fontSize: 26),
                          )),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('%', style: _style()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 180,
                        child: Text(
                          'Доза Таблетки',
                          style: _style(),
                        ),
                      ),
                      SizedBox(
                          width: 120,
                          child: TextField(
                            controller: _controller2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelStyle: TextStyle(fontSize: 18)),
                            style: TextStyle(fontSize: 26),
                          )),
                      Container(
                        width: 120,
                        child: Row(
                          children: [
                            Text(init2Measure, style: _style()),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconSize: 48,
                                iconEnabledColor: Colors.black,
                                autofocus: true,
                                items: <String>[
                                  'мг',
                                  'г',
                                  'мкг',
                                ].map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == 'г')
                                      birlik2 = 1000;
                                    else if (value == 'мкг')
                                      birlik2 = 0.001;
                                    else
                                      birlik2 = 1;
                                    init2Measure = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 180,
                        child: Text(
                          'Объем Раствора',
                          style: _style(),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: drugs != null
                            ? Text(
                                drugs,
                                style: TextStyle(fontSize: 26),
                              )
                            : Text(''),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('МЛ', style: _style()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    minWidth: double.infinity,
                    color: Colors.redAccent,
                    onPressed: _result,
                    child: Text(
                      'Расчитать',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    minWidth: double.infinity,
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        _controller1.clear();
                        _controller2.clear();
                        drugs = null;
                      });
                    },
                    child: Text(
                      'Стереть',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180,
                        alignment: Alignment.center,
                        child: Text('Процент Вещества', style: _style()),
                      ),
                      SizedBox(
                          width: 120,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _controller3,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelStyle: TextStyle(fontSize: 18)),
                            style: TextStyle(fontSize: 26),
                          )),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('%', style: _style()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 180,
                        child: Text(
                          'Объем раствора',
                          style: _style(),
                        ),
                      ),
                      SizedBox(
                          width: 120,
                          child: TextField(
                            controller: _controller4,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelStyle: TextStyle(fontSize: 18)),
                            style: TextStyle(fontSize: 26),
                          )),
                      Container(
                        width: 120,
                        child: Row(
                          children: [
                            Text(init1Measure, style: _style()),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconSize: 48,
                                iconEnabledColor: Colors.black,
                                autofocus: true,
                                items: <String>[
                                  'мл',
                                  'л',
                                ].map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == 'л')
                                      birlik1 = 1000;
                                    else if (value == 'мл') birlik1 = 1;
                                    init2Measure = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 180,
                        child: Text(
                          'Доза Таблетки',
                          style: _style(),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: rastvor != null
                            ? Text(
                                rastvor,
                                style: TextStyle(fontSize: 26),
                              )
                            : Text(''),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text('Г', style: _style()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    minWidth: double.infinity,
                    color: Colors.redAccent,
                    onPressed: _result1,
                    child: Text(
                      'Расчитать',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    minWidth: double.infinity,
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        _controller3.clear();
                        _controller4.clear();
                        rastvor = null;
                      });
                    },
                    child: Text(
                      'Стереть',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _style() {
    return TextStyle(
      fontSize: 20,
    );
  }

  void _result() {
    final result = (double.parse(_controller2.text) * birlik2) *
        (100 / double.parse(_controller1.text));

    setState(() {
      drugs = '$result';
    });
  }

  void _result1() {
    final result = (double.parse(_controller3.text)) *
        ((double.parse(_controller4.text) * birlik1) / 100);

    setState(() {
      rastvor = '$result';
    });
  }
}
