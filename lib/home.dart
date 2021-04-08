import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      _updateImcMessage(imc);
    });
  }

  void _updateImcMessage(double imc) {
    if (imc < 18.6) {
      _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
    } else if (imc < 24.9) {
      _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
    } else if (imc < 29.9) {
      _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
    } else if (imc < 35) {
      _infoText = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
    } else if (imc < 39.9) {
      _infoText = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
    } else {
      _infoText = "Obesidade grau 3 (${imc.toStringAsPrecision(3)})";
    }
  }

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
            onPressed: () => _resetFields(),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.blueAccent,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
                controller: weightController,
                validator: (value) => (value.isEmpty)? "Insira seu peso": null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
                controller: heightController,
                validator: (value) => (value.isEmpty)? "Insira sua altura": null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
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
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 24.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
