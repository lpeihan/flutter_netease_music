import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final Map arguments;
  const PlaylistPage({ Key key, this.arguments }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌单详情'),
      ),
      body: Text('${arguments["id"]}'),
    );
  }
}