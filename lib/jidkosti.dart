import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  List<String> measures = [
    'мг',
    'кг',
    'мкг',
  ];
  String drugs;
  double birlik1 = 1;
  double birlik2 = 1;
  String init1Measure = 'мг';
  String init2Measure = 'мг';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf0da),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Жидкости/Инъекции'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    child: Text('Нужная Доза', style: _style()),
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
                    width: 120,
                    child: Row(
                      children: [
                        Text(
                          init1Measure,
                          style: _style(),
                        ),
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
                                  birlik1 = 1000;
                                else if (value == 'мкг')
                                  birlik1 = 0.001;
                                else if (value == 'мг') birlik1 = 1;
                                init1Measure = value;
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
                      'Доза в Ампуле',
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
                      'Жидкости в Ампуле',
                      style: _style(),
                    ),
                  ),
                  SizedBox(
                      width: 120,
                      child: TextField(
                        controller: _controller3,
                        textAlign: TextAlign.center,
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
                          child: Text('мл', style: _style()),
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
                      'Результат',
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
                          child: Text('мл', style: _style()),
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
                    _controller3.clear();
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
      ),
    );
  }

  TextStyle _style() {
    return TextStyle(
      fontSize: 19,
    );
  }

  void _result() {
    final result = (double.parse(_controller1.text) * birlik1) /
        (double.parse(_controller2.text) * birlik2) *
        (double.parse(_controller3.text));

    setState(() {
      drugs = '$result';
    });
  }
}
