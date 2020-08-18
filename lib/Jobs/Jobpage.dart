import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';
import 'file:///D:/Flutterproject/hamrobideshikrojgar/lib/Jobs/Jobdetails.dart';
import 'file:///D:/Flutterproject/hamrobideshikrojgar/lib/Embassy/embassycontainer.dart';

import '../Drawer/Drawer.dart';
import '../Embassy/Embassyglobal.dart';
import 'Jobcontainer.dart';
import 'global.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        appBar: AppBar(
          title: Center(
              child: Text(AppLocalizations.of(context).translate('Jobs'))),
          backgroundColor: Colors.blue,
        ),
        drawer: leftdrawer(),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 7.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: jobList.length,
                        itemBuilder: (ctx, i) {
                          return JobContainer(
                            description: jobList[i].description,
                            iconUrl: jobList[i].iconUrl,
                            location: jobList[i].location,
                            title: jobList[i].title,
                            salary: jobList[i].salary,
                            number: jobList[i].number,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => JobDetailsScreen(id: i),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
