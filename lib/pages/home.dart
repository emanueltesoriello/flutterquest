import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../ui-elements/logout_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
          centerTitle: true,
          elevation: 1.0,
          leading: Icon(Icons.camera_alt),
          title: SizedBox(
            height: 35.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Moments',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('Home Sweet Home'),
        ));
  }
}
