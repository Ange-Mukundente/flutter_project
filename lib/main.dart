import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _convertTemperature() {
    double? inputTemp = double.tryParse(_controller.text);
    if (inputTemp == null) return;

    if (_isCelsius) {
      // Convert Celsius to Fahrenheit
      double fahrenheit = (inputTemp * 9 / 5) + 32;
      setState(() {
        _result = "$inputTemp °C = ${fahrenheit.toStringAsFixed(2)} °F";
      });
    } else {
      // Convert Fahrenheit to Celsius
      double celsius = (inputTemp - 32) * 5 / 9;
      setState(() {
        _result = "$inputTemp °F = ${celsius.toStringAsFixed(2)} °C";
      });
    }
  }

  bool _isCelsius = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCelsius = true;
                    });
                    _convertTemperature();
                  },
                  child: Text('Convert to °F'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCelsius = false;
                    });
                    _convertTemperature();
                  },
                  child: Text('Convert to °C'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
