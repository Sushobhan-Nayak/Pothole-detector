import 'package:flutter/material.dart';
import 'package:pothole_detector/map.dart';
import 'package:pothole_detector/captureimage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CaptureImage()),
                    );
                  },
                  child: const Text(
                    'Capture Pothole',
                    style: TextStyle(fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
