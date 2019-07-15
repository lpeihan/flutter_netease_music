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
  List<Song> songs = [];

  @override
  void initState() { 
    super.initState();
    
    this.getPlaylistDetail();
  }

  Future getPlaylistDetail() async {
    var id = widget.arguments["id"];

    Response res = await Dio().get('http://47.98.144.117:3000/playlist/detail?id=${id}');

    setState(() {
      songs = res.data['playlist']['tracks'].map<Song>((item) =>Song.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments["name"]),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          Song song = songs[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/player', arguments: song.toJson());
            },
            child: Container(
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffefefef), width: 1))
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 55,
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          song.name,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          '${song.name} - ${song.desc}',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert, color: Colors.grey,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}

class PlayListDetail {
  String avatarUrl;
  String nickname;
  String backgroundUrl;
  List<Song> songs;
}

class Song {
  int id;
  String name;
  String singer;
  String picUrl;
  String desc;

  Song({this.id, this.name, this.singer, this.picUrl, this.desc});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    singer = singerName(json['ar']);
    picUrl = json['al']['picUrl'];
    desc = json['al']['name'];
  }

  String singerName(ar) {
    String name = '';

    for (int i = 0; i < ar.length; i++) {
      name = name + '/${ar[i]["name"]}';
    }

    return name.substring(1);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['singer'] = this.singer;
    data['picUrl'] = this.picUrl;
    data['desc'] = this.desc;
    return data;
  }
}


