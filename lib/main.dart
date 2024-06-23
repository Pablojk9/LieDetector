import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LieDetectorApp());
}

class LieDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lie Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LieDetectorHomePage(),
    );
  }
}

class LieDetectorHomePage extends StatefulWidget {
  @override
  _LieDetectorHomePageState createState() => _LieDetectorHomePageState();
}

class _LieDetectorHomePageState extends State<LieDetectorHomePage> {
  String _result = 'Toca el escáner para verificar si estás mintiendo';
  bool _scanning = false;

  void _startScanning() {
    setState(() {
      _scanning = true;
      _result = 'Escaneando...';
    });

    Future.delayed(Duration(seconds: 2), () {
      final isLying = Random().nextBool();
      setState(() {
        _result = isLying ? '¡Estás mintiendo!' : '¡Dices la verdad!';
        _scanning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lie Detector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _result,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _startScanning,
              child: _scanning
                  ? Image.asset('assets/fingerprint_scanner.gif')
                  : Image.asset('assets/fingerprint_scanner.gif'),
            ),
          ],
        ),
      ),
    );
  }
}
