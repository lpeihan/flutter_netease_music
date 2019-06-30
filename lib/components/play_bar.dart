import 'package:flutter/material.dart';

class PlayBar extends StatefulWidget {
  PlayBar({Key key}) : super(key: key);

  _PlayBarState createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      height: 60.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 44.0,
            height: 44.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44.0),
              image: DecorationImage(image: NetworkImage('https://p2.music.126.net/wpahk9cQCDtdzJPE52EzJQ==/109951163271025942.jpg'), fit: BoxFit.cover)
            ),
          )
        ],
      ),
    );
  }
}