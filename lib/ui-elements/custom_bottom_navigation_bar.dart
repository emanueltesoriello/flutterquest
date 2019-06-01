import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        child: Row(
          // alignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/home'),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/add'),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/user'),
            ),
          ],
        ),
      ),
    );
  }
}
