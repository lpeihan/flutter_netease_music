import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('John@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://p2.music.126.net/wpahk9cQCDtdzJPE52EzJQ==/109951163271025942.jpg'),
            ),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Color(0xfff5f2ed),
            //       Color(0xfff1e1e1),
            //     ],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter
            //   )
            // ),
          ),
          ListTile(
            title: Text('Message',),
            leading: Icon(Icons.message, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite',),
            leading: Icon(Icons.favorite, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Setting',),
            leading: Icon(Icons.settings, size: 22.0,),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}