import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  const SearchPage({ Key key, this.arguments }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Center(
        child: Text(arguments['text']),
      ),
    );
  }
}