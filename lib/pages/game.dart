import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Time!'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'How many constructors you can have in Flutter?',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text('Only one',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    print('Answer 1');
                  },
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                      'As many as you want, just override it with new parameters.',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    print('Answer 1');
                  },
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text('As many as you want, using factory keyword.',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    print('Answer 1');
                  },
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
