import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hamrobideshikrojgar/Latestjob/latestjobs.dart';

import 'Bank/Bankpage.dart';
import 'Insurance/Insurancepage.dart';
import 'Medical centre/Medicalcenterpage.dart';
import 'package:provider/provider.dart';
import 'Drawer/Drawer.dart';

import 'localization/app_language.dart';
import 'localization/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  List<String> _language = ['English', 'Nepali']; // Option 2
  String _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          NetworkImage(
              'https://image.shutterstock.com/image-photo/business-administrator-action-manpower-human-260nw-1336612235.jpg'),
          NetworkImage(
              'https://www.somoynews.tv/img/upload/en/manpower-9373-lg.jpg'),
          NetworkImage(
              'https://blog.uwohoo.com/wp-content/uploads/2019/03/manpower.jpg')
        ],
        autoplay: true,
        indicatorBgPadding: 1.0,
      ),
    );
    return new Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(AppLocalizations.of(context).translate('Dashboard'))),
        actions: <Widget>[
          DropdownButton(
            // Not necessary for Option 1
            value: _selectedLanguage,
            onChanged: (newValue) {
              setState(() {
                _selectedLanguage = newValue;
              });
            },
            items: _language.map((language) {
              return DropdownMenuItem(
                child: new Text(language),
                value: language,
                onTap: () {
                  _setAppLng("Nepali", context);
                  return _setAppLng(language, context);
                },
              );
            }).toList(),
            icon: Icon(Icons.language),
          ),
        ],
      ),
      drawer: leftdrawer(),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              height: 82.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      child: Container(
                        color: Colors.white,
                        height: 81,
                        width: 100,
                        child: Card(
                          color: Colors.white,
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRN4YTFehy8mFOAcLmwn3NDxNPilWPSryuQ6A&usqp=CAU',
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              Divider(
                                  thickness: 2.0,
                                  indent: 5.0,
                                  endIndent: 3.0,
                                  color: Colors.green),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('Country'),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        color: Colors.white,
                        height: 82,
                        width: 100,
                        child: Card(
                          color: Colors.white,
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.network(
                                  'https://icons-for-free.com/iconfiles/png/512/morning+news+newspaper+icon-1320136429130706490.png',
                                  height: 36,
                                  width: 36,
                                ),
                              ),
                              Divider(
                                  thickness: 2.0,
                                  indent: 5.0,
                                  endIndent: 3.0,
                                  color: Colors.green),
                              Text(
                                AppLocalizations.of(context).translate('News'),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        color: Colors.white,
                        height: 81,
                        width: 100,
                        child: Card(
                          color: Colors.white,
                          elevation: 5.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSaalhKvbBNpGJuUYrMoOfBsNppZN79CZ2iLg&usqp=CAU',
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              Divider(
                                  thickness: 2.0,
                                  indent: 5.0,
                                  endIndent: 3.0,
                                  color: Colors.green),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('Catagory'),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: new ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Container(
                        height: 310.0,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            image_slider_carousel,
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  color: Colors.white,
                                  height: 30.0,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(AppLocalizations.of(context)
                                          .translate('Latest Jobs')),
                                      SizedBox(
                                        width: 170.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.visibility,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .translate('View all'),
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    latestjobScreen()),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 45.0,
                                  ),
                                  InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      height: 50,
                                      width: 80,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 5.0,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Image.network(
                                                    'https://img.favpng.com/17/20/6/computer-icons-bank-icon-design-screenshot-png-favpng-BhmjJsMCTcKdg2hDNDTKRkSTL.jpg',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  Text(
                                                    'Bank',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BankScreen()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      height: 50,
                                      width: 80,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 5.0,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Image.network(
                                                    'https://www.nicepng.com/png/detail/208-2081015_free-icons-png-life-insurance-icon-png.png',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  Text(
                                                    'Insurance',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InsuranceScreen()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      height: 50,
                                      width: 80,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 5.0,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Image.network(
                                                    'https://p7.hiclipart.com/preview/732/411/631/physician-health-care-icon-vector-doctor-material.jpg',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  Text(
                                                    'Medical centre',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MedicalcenterScreen()));
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: Container(
                                height: 1,
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 45.0,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 50,
                                          width: 80,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Image.network(
                                                        'https://www.nicepng.com/png/detail/208-2081015_free-icons-png-life-insurance-icon-png.png',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      Text(
                                                        'Insurance',
                                                        style: TextStyle(
                                                            fontSize: 10.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 50,
                                          width: 80,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 5.0,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Image.network(
                                                        'https://p7.hiclipart.com/preview/732/411/631/physician-health-care-icon-vector-doctor-material.jpg',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      Text(
                                                        'Medical centre',
                                                        style: TextStyle(
                                                            fontSize: 10.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  height: 328.0,
                  child: Card(
                    elevation: 1.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(5.0, 5.0, 3.0, 0.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG'),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text('himalayanairlines started flight'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 200.0, 0.0),
                          child: Text('${DateTime.now().month}/'
                              '${DateTime.now().day}/'
                              '${DateTime.now().year}'),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                width: MediaQuery.of(context).size.width,
                                height: 200.0,
                              ),
                              Text(
                                  'Himalayan Flight had started flight from tommorrow and also from tomorrow ticket price will raised down.')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  height: 348.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                child: Image.network(
                                  'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text('airlines '),
                                    Text('airlines ')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                child: Image.network(
                                    'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                    height: 100,
                                    width: 100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text('airlines '),
                                    Text('airlines ')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                child: Image.network(
                                    'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                    height: 100,
                                    width: 100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text('airlines '),
                                    Text('airlines ')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 330.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: Colors.lightBlue,
                                child: Center(
                                    child: Text(AppLocalizations.of(context)
                                        .translate('Notice'))),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 286,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blueAccent)),
                                height: 300,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                        height: 200,
                                        width: 350,
                                      ),
                                      Text(
                                          'Currently the price of ticket is low')
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blueAccent)),
                                height: 300,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                        height: 200,
                                        width: 350,
                                      ),
                                      Text(
                                          'Currently the price of ticket is low')
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blueAccent)),
                                height: 300,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                        height: 200,
                                        width: 350,
                                      ),
                                      Text(
                                          'Currently the price of ticket is low')
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blueAccent)),
                                height: 300,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                        height: 200,
                                        width: 350,
                                      ),
                                      Text(
                                          'Currently the price of ticket is low')
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blueAccent)),
                                height: 300,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://www.edukunja.com/frontassets/img/vacancy/1582456455.JPG',
                                        height: 200,
                                        width: 350,
                                      ),
                                      Text(
                                          'Currently the price of ticket is low')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _setAppLng(String lngName, BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context, listen: false);

    switch (lngName) {
      case 'English':
        appLanguage.changeLanguage(Locale("en"));
        break;
      case 'Nepali':
        appLanguage.changeLanguage(Locale("ne"));
        break;
      default:
        appLanguage.changeLanguage(Locale("en"));
    }
  }
}
