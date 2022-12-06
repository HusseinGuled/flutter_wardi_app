import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  static List<String> tasbiix = [
    'أستغفر ألله',
    'ألحمدلله',
    'ألله اكبر',
    'لا إله إلا ألله',
    'أللهم صلي علي سيدنا محمد',
    'سبحان ألله',
    'لا حول ولا قة إلا بالله'
  ];
  String defValue = tasbiix.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Tasbiix App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: counter > 33
                      ? Border.all(width: 2, color: Colors.yellow)
                      : Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  focusColor: Colors.black,
                  value: defValue,
                  items: tasbiix.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      defValue = value!;
                      counter = 0;
                    });
                  },
                  style: new TextStyle(
                    color: Colors.green,
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              counter.toString(),
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RawMaterialButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        counter += 1;
                      });
                    },
                    child:
                        Icon(Icons.add_circle, color: Colors.white, size: 44),
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ]),
                Column(children: [
                  RawMaterialButton(
                      shape: CircleBorder(),
                      child: Icon(Icons.block, color: Colors.white, size: 44),
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                      }),
                  Text(
                    'Reset',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Tasbiix App'),
                  content: Text(
                      'Waa Application kuu sahlaya inaad si fudud ugu tasbiixsato \nHussein Guled 2022'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ))
                  ],
                );
              });
        },
        child: Icon(Icons.info_outline_rounded, color: Colors.black),
      ),
    );
  }
}
