import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter_swiper/flutter_swiper.dart';

class Recommend extends StatefulWidget {
  Recommend({Key key}) : super(key: key);

  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List<Banner> banners = [];

  @override
  void initState() {
    super.initState();

    this.getBanners();
    this.getSongSheet();
  }

  // 获取 banners
  Future getBanners() async {
    try {
      Response res = await Dio().get('http://47.98.144.117:3000/banner');

      setState(() {
        banners = res.data['banners'].map<Banner>(
          (item) => Banner.fromJson(item))
          .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  // 获取推荐歌单
  Future getSongSheet() async {
    try {
      Response res = await Dio().get('http://47.98.144.117:3000/personalized');

      print(res);
    } catch(e) {
      print(e);
    }
  }
  
  // 轮播图
  _buildSwiper() {
    if (banners != null && banners.length > 0) {
      return Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: 110.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0),
            height: 140.0,
            child: Swiper(
              itemBuilder: (BuildContext context,int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(image: NetworkImage(banners[index].imageUrl), fit: BoxFit.cover)
                  ),
                );
              },
              itemCount: banners.length,
              pagination: SwiperPagination(),
              control: null,
              loop: true,
              autoplay: true,
            ),
          )
        ],
      );
    }
    
    return Container();
  }

  List<Menu> menus = [
    Menu(title: '每日推荐', icon: Icon(Icons.date_range, color: Colors.white,)),
    Menu(title: '歌单', icon: Icon(Icons.queue_music, color: Colors.white,)),
    Menu(title: '电台', icon: Icon(Icons.radio, color: Colors.white,)),
    Menu(title: '直播', icon: Icon(Icons.video_call, color: Colors.white,)),
  ];

  _buildMenus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: menus.map((item) {
          return Column(
            children: <Widget>[
              Container(
                width: 48.0,
                height: 48.0,
                margin: EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(colors: [Color(0xfffc6259), Color(0xfffb2725),])
                ),
                child: item.icon,
              ),
              Text(item.title)
            ],
          );
        }
      ).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSwiper(),
        SizedBox(height: 20.0,),
        _buildMenus(),
        SizedBox(height: 5.0),
        Divider()
      ],
    );
  }
}

class Menu {
  String title;
  Icon icon;

  Menu({ this.title, this.icon });
}

class Banner {
  final int id;
  final String imageUrl;

  Banner(this.id, this.imageUrl);

  Banner.fromJson(Map json)
    : id = json['targetId'],
      imageUrl = json['imageUrl'];
  
  Map toJson() => {
    'id': id,
    'imageUrl': imageUrl
  };
}