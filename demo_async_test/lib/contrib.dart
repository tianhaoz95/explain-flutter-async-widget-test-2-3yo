import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContribScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help me make more content?'),
        key: Key('contrib_title'),
      ),
      body: Center(
        child: Text('The goal is to let more people have the fun of making stuff'),
      ),
    );
  }
}