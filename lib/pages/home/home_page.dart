import 'package:flutter/material.dart';

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
    page: Text('discover')
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

  List<Widget> buildTabs() {
    return this.tabs.map((item) {
      if (tabs.indexOf(item) == this.currentIndex) {
        return Tab(child: item.active);
      }
      return Tab(child: item.normal);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TabBar(
            indicatorColor: Colors.transparent,
            controller: tabController,
            tabs: this.buildTabs()
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { Navigator.pushNamed(context, '/search'); },
          )
        ],
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
