import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  Discover({Key key}) : super(key: key);

  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with SingleTickerProviderStateMixin {
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
        title: TabBar(
          controller: tabController,
          indicatorWeight: 2.0,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(bottom: 10),
          tabs: <Widget>[
            Tab(
              child: Text('推荐'),
            ),
            Tab(
              child: Text('排行'),
            ),
            Tab(
              child: Text('歌手'),
            )
          ],
        )
      ),
        body: TabBarView(
          controller: this.tabController,
          children: <Widget>[
            Center(child: Icon(Icons.local_florist),),
            Center(child: Icon(Icons.change_history),),
            Center(child: Icon(Icons.directions_bike),)
          ],
        ),
    );
  }
}