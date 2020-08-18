import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Jobs/Jobcontainer.dart';
import 'package:hamrobideshikrojgar/Jobs/global.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';
import 'file:///D:/Flutterproject/hamrobideshikrojgar/lib/Jobs/Jobdetails.dart';

import '../Drawer/Drawer.dart';

class latestjobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        appBar: AppBar(
          title: Center(
              child: Text(AppLocalizations.of(context).translate('Jobs'))),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
