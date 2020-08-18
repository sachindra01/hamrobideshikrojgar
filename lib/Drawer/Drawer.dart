import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Drawer/Login/register.dart';
import 'package:hamrobideshikrojgar/Drawer/Profileui.dart';
import 'package:hamrobideshikrojgar/Mainscreen/MainScreen.dart';
import 'package:hamrobideshikrojgar/Screensloginregister/LoginScreen.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

class leftdrawer extends StatefulWidget {
  @override
  _leftdrawerState createState() => _leftdrawerState();
}

class _leftdrawerState extends State<leftdrawer> {
  SharedPreferences logindata;
  String username;
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
    });
  }

  bool _isBluetoothOn = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Rollingplans pvt Ltd'),
            accountEmail: Text('$username'),
            currentAccountPicture: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.dashboard),
              color: Colors.blue,
              highlightColor: Colors.red,
              hoverColor: Colors.green,
              focusColor: Colors.purple,
              splashColor: Colors.yellow,
              disabledColor: Colors.amber,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _isBluetoothOn = !_isBluetoothOn;
                });
              },
            ),
            title: Text(AppLocalizations.of(context).translate('Dashboard')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabLayoutDemo()));
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.account_box),
              color: Colors.blue,
              highlightColor: Colors.red,
              hoverColor: Colors.green,
              focusColor: Colors.purple,
              splashColor: Colors.yellow,
              disabledColor: Colors.amber,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _isBluetoothOn = !_isBluetoothOn;
                });
              },
            ),
            title: Text(AppLocalizations.of(context).translate('Login')),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Loginscreen()));
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            autofocus: true,
            leading: IconButton(
              icon: Icon(Icons.contact_mail),
              color: Colors.blue,
              highlightColor: Colors.red,
              hoverColor: Colors.green,
              focusColor: Colors.purple,
              splashColor: Colors.yellow,
              disabledColor: Colors.amber,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _isBluetoothOn = !_isBluetoothOn;
                });
              },
            ),
            title: Text(AppLocalizations.of(context).translate('Contact us')),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.info),
              color: Colors.blue,
              highlightColor: Colors.red,
              hoverColor: Colors.green,
              focusColor: Colors.purple,
              splashColor: Colors.yellow,
              disabledColor: Colors.amber,
              iconSize: 20,
              onPressed: () {
                setState(() {
                  _isBluetoothOn = !_isBluetoothOn;
                });
              },
            ),
            title: Text(AppLocalizations.of(context).translate('About us')),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2.0,
          ),
        ],
      ),
    );
  }
}
