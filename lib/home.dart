import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: null,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.blueAccent,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => null,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      textStyle: TextStyle(fontSize: 24.0)),
                ),
              ),
            ),
            Text(
              "Info",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
