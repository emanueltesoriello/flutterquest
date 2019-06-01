import 'package:flutter/material.dart';

import '../ui-elements/custom_bottom_navigation_bar.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  double targetWidth;
  double targetHeight;

  Widget _buildText(double deviceWidth) {
    return Container(
      padding: EdgeInsets.only(right: deviceWidth / 25, left: deviceWidth / 25),
      child: Center(
        child: Text(
          '''What is the command used to know something went wrong with Flutter SDK?''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 135, 0, 1),
        title: Text('Rate a question'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: targetWidth / 15,
            ),
            _buildText(deviceWidth),
            SizedBox(
              height: targetWidth / 5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: deviceWidth / 10,
                  top: deviceWidth / 14,
                  right: deviceWidth / 10,
                  bottom: deviceWidth / 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(22)),
              ),
              child: Text(
                'Flutter run',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: targetWidth / 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: deviceWidth / 10,
                  top: deviceWidth / 14,
                  right: deviceWidth / 10,
                  bottom: deviceWidth / 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(22)),
              ),
              child: Text(
                'Flutter scan',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: targetWidth / 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: deviceWidth / 10,
                  top: deviceWidth / 14,
                  right: deviceWidth / 10,
                  bottom: deviceWidth / 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(22)),
              ),
              child: Text(
                'Flutter checks',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: targetWidth / 10,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: deviceWidth / 10,
                  top: deviceWidth / 14,
                  right: deviceWidth / 10,
                  bottom: deviceWidth / 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(22)),
              ),
              child: Text(
                'Flutter doctor',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: targetWidth / 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(240, 135, 0, 1),
        onPressed: () {},
        tooltip: 'Like the question',
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar('check'),
    );
  }
}
