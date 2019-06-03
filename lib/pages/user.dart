import 'package:flutter/material.dart';

import '../ui-elements/logout_list_tile.dart';
import '../ui-elements/custom_bottom_navigation_bar.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  double targetWidth;
  double targetHeight;

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

  Widget _buildLogo() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        color: Color.fromRGBO(196, 196, 196, 1),
      ),
      height: targetHeight / 10.5,
      child: Image(
        image: AssetImage("assets/logo.png"),
        height: targetHeight / 3,
      ),
    );
  }

  Widget _buildProfileButton() {
    return ButtonTheme(
      minWidth: targetWidth / 3,
      height: targetHeight / 32,
      child: RaisedButton(
        //color: Color.fromRGBO(35, 100, 170, 1),
        color: Color.fromRGBO(250, 150, 85, 1), // orange
        textColor: Colors.white,
        child: Text('Your profile'),
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90.0),
        ),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return IconButton(
      iconSize: 25,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 0),
      icon: Icon(
        Icons.settings,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: targetHeight / 10.5,
          ),
          _buildLogo(),
          SizedBox(
            height: targetHeight / 14.2,
          ),
          Text(
            'Username',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: targetWidth / 50,
          ),
          _buildProfileButton(),
          SizedBox(
            height: targetHeight / 4,
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    targetWidth = deviceWidth; //> 550.0 ? 500.0 : deviceWidth * 0.9;
    targetHeight = deviceHeight;
    return Scaffold(
      backgroundColor: Color.fromRGBO(84, 197, 248, 1),
      drawer: _buildSideDrawer(context),
      body: Container(
        child: _buildBody(),
      ),
      floatingActionButton: _buildFloatingButton(),
      bottomNavigationBar: CustomBottomNavigationBar('user'),
    );
  }
}
