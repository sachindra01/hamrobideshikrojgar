import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Drawer/Drawer.dart';

import 'package:hamrobideshikrojgar/Manpower/manpowerdetail.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import 'ManpowerContainer.dart';
import 'manpowerglobal.dart';

class ManpowerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        drawer: leftdrawer(),
        appBar: AppBar(
          title: Center(
              child: Text(AppLocalizations.of(context).translate('Manpower'))),
          backgroundColor: Colors.blue,
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
                        itemCount: Manpowerlist.length,
                        itemBuilder: (ctx, i) {
                          return BankContainer(
                            description: Manpowerlist[i].description,
                            iconUrl: Manpowerlist[i].iconUrl,
                            location: Manpowerlist[i].location,
                            title: Manpowerlist[i].title,
                            number: Manpowerlist[i].number,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ManpowerDetailsScreen(id: i),
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
