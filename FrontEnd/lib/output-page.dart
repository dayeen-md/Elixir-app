import 'dart:ui';

import 'package:elixir_app/exchange.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class appointmentpage extends StatefulWidget {
  const appointmentpage({Key? key}) : super(key: key);

  @override
  _appointmentpageState createState() => _appointmentpageState();
}

// ignore: camel_case_types
class _appointmentpageState extends State<appointmentpage>
    with TickerProviderStateMixin {
  help() => help();
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Center(
                  child: Text(
                "Report",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
            ),
            SingleChildScrollView(
              child: Container(
                width: 20,
                decoration: new BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Syndrome",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text("{disease}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Symptoms",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text("{syndrome}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Disorder",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text("{disorder}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Additional Information",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text("{info}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFB40284A),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'Finding your doctor',
                                  style: TextStyle(fontSize: 20),
                                ),
                                LinearProgressIndicator(
                                  value: 5,
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          child: Text(
                            'Get appointment',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFB71C1C),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                            content: Column(
                              children: <Widget>[
                                const Text(
                                  'Contacting nearest Hospital',
                                  style: TextStyle(fontSize: 20),
                                ),
                                LinearProgressIndicator(),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Container(
                          child: Text(
                            'Emergency',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
