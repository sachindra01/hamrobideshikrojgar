import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Bank/Bankdetailpage.dart';
import 'package:hamrobideshikrojgar/localization/app_localizations.dart';

import '../Drawer/Drawer.dart';
import 'Bankcontainer.dart';
import 'Bankglobal.dart';

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
        appBar: AppBar(
          title: Center(
              child: Text(AppLocalizations.of(context).translate('Banks'))),
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
                        itemCount: Banklist.length,
                        itemBuilder: (ctx, i) {
                          return BankContainer(
                            description: Banklist[i].description,
                            iconUrl: Banklist[i].iconUrl,
                            location: Banklist[i].location,
                            title: Banklist[i].title,
                            number: Banklist[i].number,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => BankDetailScreen(id: i),
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
