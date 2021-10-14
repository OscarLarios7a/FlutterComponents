import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.dangerous,
          color: Colors.red.shade800,
        ),
        centerTitle: true,
        title: Text('Alert Page'),
      ),
    );
  }
}
