import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../models/auth.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'name': null,
    'surname': null,
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;
  double targetWidth;
  double targetHeight;

  ScopedModelDescendant _buildScopedModelDescendant() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? CircularProgressIndicator()
            : MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SUBMIT'),
                onPressed: () => _submitForm(model.authenticate),
              );
      },
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  FlatButton _buildFlatButton() {
    return FlatButton(
      child:
          Text('Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}'),
      onPressed: () {
        setState(() {
          _authMode =
              _authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
        });
      },
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'Name',
          filled: true,
          fillColor: Color.fromRGBO(254, 254, 252, 1)),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty || value.length > 20) {
          return 'Please enter a valid name';
        }
      },
      onSaved: (String value) {
        _formData['name'] = value;
      },
    );
  }

  Widget _buildSurnameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'Surname',
          filled: true,
          fillColor: Color.fromRGBO(254, 254, 252, 1)),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty || value.length > 20) {
          return 'Please enter a valid surname';
        }
      },
      onSaved: (String value) {
        _formData['surname'] = value;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'E-Mail',
          filled: true,
          fillColor: Color.fromRGBO(254, 254, 252, 1)),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'Password',
          filled: true,
          fillColor: Color.fromRGBO(254, 254, 252, 1)),
      obscureText: true,
      controller: _passwordTextController,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'Password',
          filled: true,
          fillColor: Color.fromRGBO(254, 254, 252, 1)),
      obscureText: true,
      validator: (String value) {
        if (_passwordTextController.text != value) {
          return 'Passwords do not match.';
        }
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation;
    successInformation = await authenticate(
        _formData['email'], _formData['password'], _authMode);
    if (successInformation['success']) {
      // Navigator.pushReplacementNamed(context, '/');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(successInformation['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    targetWidth = deviceWidth; 
    targetHeight = deviceHeight;
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 135, 0, 1),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Theme(
          data: _buildThemeData(),
          isMaterialAppTheme: true,
          child: Container(
            child: SingleChildScrollView(
                child: Container(
              width: targetWidth,
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                //autovalidate: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: (targetHeight / 25),
                      ),
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        height: targetHeight / 6,
                      ),
                    ),
                    _authMode == AuthMode.Signup
                        ? SizedBox(
                            height: 50.0,
                          )
                        : SizedBox(
                            height: 100.0,
                          ),
                    _authMode == AuthMode.Signup
                        ? _buildNameTextField()
                        : Container(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _authMode == AuthMode.Signup
                        ? _buildSurnameTextField()
                        : Container(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _authMode == AuthMode.Signup
                        ? _buildPasswordConfirmTextField()
                        : Container(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildFlatButton(),
                    SizedBox(
                      height: targetWidth/25,
                    ),
                    _buildScopedModelDescendant(),
                  ],
                ),
              ),
            )),
          ),
        ),
      ]),
    );
  }
}
