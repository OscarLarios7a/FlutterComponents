import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person_pin, color: Colors.cyanAccent.shade700),
        centerTitle: true,
        title: Text('Avatar Page'),
      ),
    );
  }
}
