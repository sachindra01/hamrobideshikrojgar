import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';
import 'file:///D:/Flutterproject/hamrobideshikrojgar/lib/Embassy/EmbassyDetail.dart';
import 'file:///D:/Flutterproject/hamrobideshikrojgar/lib/Embassy/embassycontainer.dart';

import '../Drawer/Drawer.dart';
import 'Embassyglobal.dart';

class EmbassyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        appBar: AppBar(
          title: Center(
              child: Text(AppLocalizations.of(context).translate('Embassy'))),
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
                        itemCount: Embassylist.length,
                        itemBuilder: (ctx, i) {
                          return EmbassyContainer(
                            description: Embassylist[i].description,
                            iconUrl: Embassylist[i].iconUrl,
                            location: Embassylist[i].location,
                            title: Embassylist[i].title,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => EmbassyDetailsScreen(id: i),
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
