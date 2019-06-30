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
  }

  Future getBanners() async {
    try {
      Response res = await Dio().get('http://47.98.144.117:3000/banner');

      setState(() {
        banners = res.data['banners'].map<Banner>((item) => Banner.fromJson(item)).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  _buildSwiper() {
    if (banners != null && banners.length > 0) {
      return Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 12.0 / 5.0,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: AspectRatio(
              aspectRatio: 12.0 / 5.0,
              child: Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.network(banners[index].imageUrl, fit: BoxFit.cover,);
                },
                itemCount: banners.length,
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
          )
        ],
      );
    }
    
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSwiper()
      ],
    );
  }
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