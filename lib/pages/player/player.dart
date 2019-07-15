import 'package:flutter/material.dart';
import 'dart:ui';

class Player extends StatefulWidget {
  final Map arguments;

  Player({Key key, this.arguments}) : super(key: key);

  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return _Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(widget.arguments['name'], style: TextStyle(fontSize: 17.0)),
              Text(widget.arguments['singer'], style: TextStyle(fontSize: 13.0))
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: () {},)
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      song: widget.arguments
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;
  final Map song;

  const _Background({Key key, this.child, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(song['picUrl']),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.overlay,
                ),
              ),
            ),
          ),
          Container(
            child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 14.0),
            child: Opacity(
              opacity: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          )),
          Positioned(child: child)
        ],
      ),
    );
  }
}
