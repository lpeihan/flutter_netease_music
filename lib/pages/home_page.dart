import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('search'),
          onPressed: () {
            Navigator.pushNamed(context, '/search', arguments: { 'text': 'hello search' });
          },
        ),
      ),
    );
  }
}