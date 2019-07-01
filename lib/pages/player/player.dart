import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('播放器'),),
    );
  }
}