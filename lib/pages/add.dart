import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  double targetWidth;
  double targetHeight;

  Widget _buildText(double deviceWidth) {
    return Container(
      padding: EdgeInsets.only(right: deviceWidth / 25, left: deviceWidth / 25),
      child: Container(
              padding: EdgeInsets.only(
                  left: deviceWidth / 8,
                  top: deviceWidth / 12,
                  right: deviceWidth / 8,
                  bottom: deviceWidth / 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(22)),
              ),
              child: Text(
                'Type here your question',
                style: TextStyle(fontSize: 18),
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
        title: Text('Add new questions'),
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
                'Answer n.1',
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
                'Answer n.2',
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
                'Answer n.3',
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
                'Answer n.4',
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
        tooltip: 'Next question',
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
