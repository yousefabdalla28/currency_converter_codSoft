import 'package:flutter/material.dart';
import '../widgets/custom_drop_down.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> currencies;
  late String from;
  late String to;
  late double rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusColor: Colors.green,
                filled: true,
                fillColor: Colors.white,
                labelText: "Please enter value to convert",
                labelStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            SizedBox(height: 300,),
            Row(children: [
              CustomDropDown(currencies, from, (from) { })
            ],)
        ],),
      ),
    );
  }
}
