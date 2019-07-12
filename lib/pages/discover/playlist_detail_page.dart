import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PlaylistDetailBackground extends StatelessWidget {
  const PlaylistDetailBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('too hard'),
    );
  }
}

class PlaylistDetailPage extends StatefulWidget {
  final Map arguments;
  PlaylistDetailPage({ Key key, this.arguments }) : super(key: key);

  _PlaylistDetailPageState createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage> {
  @override
  void initState() { 
    super.initState();
    
    this.getPlaylistDetail();
  }

  Future getPlaylistDetail() async {
    Response res = await Dio().get('http://47.98.144.117:3000/playlist/detail?id=${widget.arguments["id"]}');

    var avatarUrl = res.data['playlist']['creator']['avatarUrl'];
    print(avatarUrl);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌单详情'),
      ),
    );
  }
}

class PlayListDetail {
  String avatarUrl;
  String nickname;
  String backgroundUrl;
}

class Song {
  int id;
  String singer;
  String name;
  String image;
  String desc;
  String alias;
}


