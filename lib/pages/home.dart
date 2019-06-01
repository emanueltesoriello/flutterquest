import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../ui-elements/logout_list_tile.dart';
import '../ui-elements/custom_bottom_navigation_bar.dart';
import '../scoped-models/main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
      margin: EdgeInsets.only(
        top: (targetHeight / 10),
      ),
      child: Image(
        image: AssetImage("assets/logo.png"),
        height: targetHeight / 4.8,
      ),
    );
  }

  Widget _buildPlayButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? CircularProgressIndicator()
            : ButtonTheme(
                minWidth: targetWidth / 2,
                height: targetHeight / 10,
                child: RaisedButton(
                  color: Color.fromRGBO(242, 100, 25, 1),
                  textColor: Color.fromRGBO(0, 19, 57, 1),
                  child: Text(
                    'PLAY',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onPressed: () => Navigator.pushNamed<bool>(context, '/game'),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(
                      targetHeight / 14 / 4,
                    )),
                  ), /*RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),*/
                ),
              );
      },
    );
  }

  Widget _buildText(double deviceWidth) {
    return Container(
      padding: EdgeInsets.only(right: deviceWidth / 25, left: deviceWidth / 25),
      child: Center(
        child: Text(
          '''Welcome to the  FlutterQuest!

Now you can test your Flutter proficiency with hundreds of community created questions''',
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
      drawer: _buildSideDrawer(context),
      bottomNavigationBar: CustomBottomNavigationBar('home'),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: targetWidth / 20,
              ),
              _buildLogo(),
              SizedBox(
                height: targetHeight / 10,
              ),
              _buildText(deviceWidth),
              SizedBox(
                height: deviceWidth / 5,
              ),
              _buildPlayButton(),
            ],
          ),
        ),
      ),
    );
  }
}
