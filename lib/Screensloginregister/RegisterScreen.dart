import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Drawer/Login/Register/Animation/registeranimation.dart';
import 'package:hamrobideshikrojgar/Drawer/Login/validation.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';

class Registerscreen extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;

  const Registerscreen(
      {Key key, this.fieldKey, this.hintText, this.labelText, this.helperText})
      : super(key: key);
  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> with ValidationMixin {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final formKey = GlobalKey<FormState>();

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final confirmpassword_controller = TextEditingController();
  final mobile_controller = TextEditingController();

  SharedPreferences logindata;
  bool newuser;
  String mobile = '';
  String email = '';
  String password = '';
  String ConfirmPassword = "";
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Loginscreen()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        AppLocalizations.of(context).translate('Register'),
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
                                            hintText: AppLocalizations.of(
                                                    context)
                                                .translate('Your user name'),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: const Icon(
                                                    Icons.account_box)),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'please enter the username');
                                            } else if (value.length < 8) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Password must be at least 8 digit');
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
                                          controller: mobile_controller,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "98xxxxxxxx",
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .translate('mobile number'),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: const Icon(
                                                    Icons.phone_android)),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Mobile number is required');
                                            } else if (value.length < 10) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Invalid mobile number');
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
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .translate('Email'),
                                            hintText:
                                                AppLocalizations.of(context)
                                                    .translate('Email'),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            icon: const Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: const Icon(Icons.mail)),
                                          ),
                                          validator:
                                              validateEmail, //passing the reference of the validation mixin, not calling directly
                                          onSaved: (String value) {
                                            email = value;
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
                                              hintText: AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'enter your password'),
                                              labelText:
                                                  AppLocalizations.of(context)
                                                      .translate('Password'),
                                              helperText: widget.helperText,
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText =
                                                        !_obscureText;
                                                  });
                                                },
                                                child: Icon(_obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              ),
                                              icon: const Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child:
                                                      const Icon(Icons.lock)),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Password is required');
                                            } else if (value.length < 8) {
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Password must be at least 8 characters');
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
                                          controller:
                                              confirmpassword_controller,
                                          key: widget.fieldKey,
                                          obscureText: _obscureText,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: AppLocalizations.of(
                                                      context)
                                                  .translate('Retype password'),
                                              labelText:
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'Confirm Password'),
                                              helperText: widget.helperText,
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText =
                                                        !_obscureText;
                                                  });
                                                },
                                                child: Icon(_obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              ),
                                              icon: const Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child:
                                                      const Icon(Icons.lock)),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (value) {
                                            if (value.isEmpty)
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'confirm password required');
                                            if (value !=
                                                password_controller.text)
                                              return AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'Password Not Match');
                                            return null;
                                          } //passing the
                                          ),
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
                            .translate('Welcome to Family'),
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
                            textColor: Colors.white,
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Loginscreen()));
                              }
                              String username = username_controller.text;
                              String password = password_controller.text;

                              if (username != '' && password != '') {
                                print('Successfull');
                                logindata.setBool('login', false);

                                logindata.setString('username', username);
                                logindata.setString('password', password);
                              }
                            },
                            child: Text(AppLocalizations.of(context)
                                .translate('Register')),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      2,
                      InkWell(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            AppLocalizations.of(context).translate(
                                'Already have account?Back to login'),
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, .6)),
                          ),
                        )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginscreen()));
                        },
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
