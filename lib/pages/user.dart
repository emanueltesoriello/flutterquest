import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../ui-elements/logout_list_tile.dart';
import '../ui-elements/custom_bottom_navigation_bar.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          Divider(),
          LogoutListTile()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Flutter Quest'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar('user'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "User Page",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
