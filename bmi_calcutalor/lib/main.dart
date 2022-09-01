import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



//void main(){
//runApp(Calculator());

//}






class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weighttController = TextEditingController();
  late double _result=0;
  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weighttController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('BMI calculator'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller:_heightController ,
                  decoration: InputDecoration(
                    icon: Icon(Icons.trending_up),
                    hintText: 'weight in cm'
                  ),
                ),
                TextField(
                  controller: _weighttController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.line_weight),
                      hintText: 'weight in kg'
                  ),
                ),
                TextButton(onPressed:calculateBMI, child: Text('submit')),
                Text(
                  _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 19.0
                  ),
                )


              ],

            ),
          ),
        ),
      ),
    );
  }


}
