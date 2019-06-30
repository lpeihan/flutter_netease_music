import 'package:flutter/material.dart';

import 'user_drawer.dart';
import '../../components/play_bar.dart';
import '../discover/discover.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 1;

  final List<_TabItem> tabs = [
  _TabItem(
    normal: Image.asset('assets/music.png'),
    active: Image.asset('assets/music_active.png'),
    page: Text('music')
  ),
  _TabItem(
    normal: Image.asset('assets/discover.png'),
    active: Image.asset('assets/discover_active.png'),
    page: Discover()
  ),
  _TabItem(
    normal: Image.asset('assets/video.png'),
    active: Image.asset('assets/video_active.png'),
    page: Text('video')
  )
];

  @override
  void initState() {
    super.initState();

    tabController = new TabController(
      vsync: this,
      length: 3,
      initialIndex: this.currentIndex
    );

    tabController.addListener(() {
      setState(() {
        this.currentIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.all(0.0),
            controller: tabController,
            tabs: this.tabs.map((item) {
              return tabs.indexOf(item) == this.currentIndex ? Tab(child: item.active) : Tab(child: item.normal);
            }).toList()
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { Navigator.pushNamed(context, '/search'); },
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: this.tabs.map((item) {
          return item.page;
        }).toList()
      ),
      drawer: UserDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: PlayBar(),
      ),
    );
  }
}

class _TabItem {
  Image active;
  Image normal;
  Widget page;

  _TabItem({this.active, this.normal, this.page});
}
