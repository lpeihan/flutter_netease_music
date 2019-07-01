import 'package:flutter/material.dart';
import 'package:flutter_netease_music/pages/discover/recommend_page.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key}) : super(key: key);

  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = new TabController(
      vsync: this,
      length: 3,
    );

    tabController.addListener(() {
      print(tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TabBar(
          controller: tabController,
          indicatorWeight: 2.0,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(bottom: 10.0),
          tabs: <Widget>[
            Tab(child: Text('推荐', style: TextStyle(fontSize: 15.0),),),
            Tab(child: Text('排行', style: TextStyle(fontSize: 15.0),),),
            Tab(child: Text('歌手', style: TextStyle(fontSize: 15.0),),),
          ],
        )
      ),
      body: TabBarView(
        controller: this.tabController,
        children: <Widget>[
          RecommendPage(),
          Center(child: Icon(Icons.change_history),),
          Center(child: Icon(Icons.directions_bike),)
        ],
      ),
    );
  }
}