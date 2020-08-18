import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Drawer/Login/Register/Animation/registeranimation.dart';
import 'package:hamrobideshikrojgar/Drawer/Login/validation.dart';
import 'package:hamrobideshikrojgar/Mainscreen/MainScreen.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'RegisterScreen.dart';

class Loginscreen extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;

  const Loginscreen(
      {Key key, this.fieldKey, this.hintText, this.labelText, this.helperText})
      : super(key: key);
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> with ValidationMixin {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final confirmpassword_controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SharedPreferences logindata;
  String username;
  String password;
  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
      password = logindata.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Images/background.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Images/background-2.png'),
                                  fit: BoxFit.fill)),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      Text(
                        AppLocalizations.of(context).translate('Login'),
                        style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.7,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                          controller: username_controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  AppLocalizations.of(context)
                                                      .translate('Username'),
                                              hintText: '$username',
                                              icon: const Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: const Icon(
                                                      Icons.account_box)),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (value) {
                                            String pattern = r'(^[a-zA-Z ]*$)';
                                            RegExp regExp = new RegExp(pattern);
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Username is required');
                                            } else if (!regExp
                                                .hasMatch(value)) {
                                              return 'Username must be a-z and A-Z';
                                            }
                                            return null;
                                          }),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                          controller: password_controller,
                                          key: widget.fieldKey,
                                          obscureText: _obscureText,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '$password',
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: const Icon(Icons.lock)),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .translate('Password'),
                                            helperText: widget.helperText,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                              child: Icon(_obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                            ),
                                          ),
                                          validator: (value) {
                                            String pattern = r'(^[a-zA-Z ]*$)';
                                            RegExp regExp = new RegExp(pattern);
                                            if (value.isEmpty)
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'password required');
                                            if (value !=
                                                password_controller.text)
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Password Not Match');
                                            return null;
                                          }),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.7,
                      Center(
                          child: Text(
                        AppLocalizations.of(context)
                            .translate('Forget Password?'),
                        style:
                            TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
                      ))),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.9,
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(49, 39, 79, 1),
                        ),
                        child: Center(
                          child: FlatButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabLayoutDemo()));
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context).translate('Login'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.9,
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(49, 39, 79, 1),
                        ),
                        child: Center(
                          child: FlatButton(
                            onPressed: () {
                              logindata.setBool('login', true);
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Registerscreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('Register'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      2,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Center(
                            child: InkWell(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('New user?Register'),
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, .6)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerscreen()));
                          },
                        )),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
