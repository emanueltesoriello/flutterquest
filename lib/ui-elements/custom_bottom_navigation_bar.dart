import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String pageName;

  CustomBottomNavigationBar(this.pageName);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        color: Color.fromRGBO(240, 135, 0, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/home'),
              color: pageName == 'home' ? Colors.black : Colors.white,
            ),
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/add'),
              color: pageName == 'add' ? Colors.black : Colors.white,
            ),
            IconButton(
              icon: Icon(
                Icons.person,
              ),
              onPressed: () => Navigator.pushNamed<bool>(context, '/user'),
              color: pageName == 'user' ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
