import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      home: Scaffold(body: _ColorChange()),
    );
  }
}

class _ColorChange extends StatefulWidget {
  const _ColorChange();

  @override
  State<_ColorChange> createState() => __ColorChangeState();
}

class __ColorChangeState extends State<_ColorChange> {
  int _counter = 0;
  double _brightness = 0.5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.amber.withOpacity(_brightness),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Number before user ckick: $_counter'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Hit')),
          Slider(
              value: _brightness,
              min: 0.0,
              max: 1.0,
              label: (_brightness * 100).round().toString(),
              onChanged: (double value) {
                setState(() {
                  _brightness = value;
                });
              })
        ],
      ),
    );
  }
}
