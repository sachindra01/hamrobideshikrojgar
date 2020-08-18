import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Manpower/manpowerpage.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import '../Embassy/Embassypage.dart';
import '../Home.dart';
import '../Jobs/Jobpage.dart';

class TabLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.yellow,
      child: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              MyHomePage(),
              JobScreen(),
              ManpowerScreen(),
              EmbassyScreen(),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                child: Text(
                  AppLocalizations.of(context).translate('Dashboard'),
                  style: TextStyle(fontSize: 11.0),
                ),
                icon: new Icon(Icons.dashboard),
              ),
              Tab(
                child: Text(
                  AppLocalizations.of(context).translate('Jobs'),
                  style: TextStyle(fontSize: 11.0),
                ),
                icon: new Icon(Icons.work),
              ),
              Tab(
                child: Text(
                  AppLocalizations.of(context).translate('Manpower'),
                  style: TextStyle(fontSize: 11.0),
                ),
                icon: new Icon(Icons.business),
              ),
              Tab(
                child: Text(
                  AppLocalizations.of(context).translate('Embassy'),
                  style: TextStyle(fontSize: 11.0),
                ),
                icon: new Icon(Icons.list),
              ),
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
