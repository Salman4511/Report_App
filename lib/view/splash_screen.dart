import 'package:flutter/material.dart';
import 'dart:async';

import 'package:report_app/view/home_screen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({
    super.key,
  });

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      if (_start == 0) {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.network(
                  'https://requirements.com/Portals/0/EasyDNNnews/34/img-report.png',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Reports',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(55.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 85, 85, 87)),
                  value: 1 - (_start / 5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
