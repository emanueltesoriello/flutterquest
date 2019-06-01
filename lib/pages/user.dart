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
      drawer: _buildSideDrawer(context),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                Color.fromRGBO(0, 129, 175, 1),
                Color.fromRGBO(6, 174, 213, 1),
              ],
            ),
          ),
          child: _buildBody()),
      floatingActionButton: _buildFloatingButton(),
      bottomNavigationBar: CustomBottomNavigationBar('user'),
    );
  }
}

class ShapesPainter extends CustomPainter {
  double targetWidth;
  double targetHeight;

  ShapesPainter(this.targetHeight, this.targetWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color.fromRGBO(254, 254, 252, 1);

    Rect rect = Rect.fromLTWH(-(0.5 * ((targetHeight / 1.15) - targetWidth)),
        targetHeight / 2.15, targetHeight / 1.15, targetHeight / 2.8);
    Rect rect2 = Rect.fromLTWH(-(0.5 * ((targetHeight / 1.15) - targetWidth)),
        (targetHeight * 0.69), targetHeight / 1.15, targetHeight / 2.8);

    canvas.drawOval(rect, paint);
    canvas.drawRect(rect2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
