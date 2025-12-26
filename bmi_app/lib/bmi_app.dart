import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BmiApp()));
}

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {a
  final wtcontroller = TextEditingController();
  final htcontroller = TextEditingController();
  final inchcontroller = TextEditingController();

  var result = '';
  var msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI app')),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 21),

            
              TextFormField(
                controller: wtcontroller,
                decoration: InputDecoration(
                  hintText: 'enter your weight',
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 21),

              TextFormField(
                controller: htcontroller,
                decoration: InputDecoration(
                  hintText: 'enter your height in feet',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 21),

              TextFormField(
                controller: inchcontroller,
                decoration: InputDecoration(
                  hintText: 'enter your height in inch',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  var wt = wtcontroller.text.toString();
                  var ft = htcontroller.text.toString();
                  var inch = inchcontroller.text.toString();

                  if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);
                    var totalinch = ift * 12 + iinch;
                    var totalcm = totalinch * 2.54;
                    var totalM = totalcm / 100;
                    var bmi = iwt / (totalM * totalM);

                    if (bmi > 25) {
                      msg = 'you are overweight';
                    
                    }
                    if (bmi < 18) {
                      msg = 'you are underweight';
                    } else {
                      msg = 'you are healthy';
                    }

                    setState(() {
                      result = " your bmi is : ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = 'please enter the all details';
                    });
                  }
                },
                child: Text('Calculate'),
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
