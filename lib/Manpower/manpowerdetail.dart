import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hamrobideshikrojgar/Manpower/manpowerglobal.dart';

import '../Embassy/Embassyglobal.dart';

class ManpowerDetailsScreen extends StatefulWidget {
  int id;
  String iconUrl;

  ManpowerDetailsScreen({Key key, @required this.id, @required this.iconUrl})
      : super(key: key);

  @override
  _ManpowerDetailsScreenState createState() => _ManpowerDetailsScreenState();
}

class _ManpowerDetailsScreenState extends State<ManpowerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 550,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          NetworkImage(
              'https://www.gonepaltours.com/wp-content/uploads/2019/03/Bhaktapur-Durbar-Square-cultural-world-heritage-nepal.jpg'),
          NetworkImage(
              'https://www.explorehimalaya.com/wp-content/uploads/nepal-cultural-tours.jpg'),
          NetworkImage(
              'https://whc.unesco.org/uploads/thumbs/news_1480-890-520-20160425110533.jpg'),
          NetworkImage(
              'https://www.travelhousenepal.com/wp-content/uploads/2020/01/Banner-1.jpg'),
          NetworkImage(
              'https://www.nepalrentalcar.com/uploads/img/janaki-temple.jpg'),
          NetworkImage(
              'https://www.welcomenepal.com/uploads/destination/pashupatinath-sm-pilgrims.jpeg')
        ],
        autoplay: true,
        indicatorBgPadding: 1.0,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            image_slider_carousel,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${Manpowerlist[widget.id].title}",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "${Manpowerlist[widget.id].location}",
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .apply(color: Colors.grey),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 20.0,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Overview",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        "${Manpowerlist[widget.id].description}",
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.black),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Contact",
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              Text(
                                "${Manpowerlist[widget.id].number}",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Colors.black),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Photos",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Manpowerlist[widget.id].photos.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                    "${Manpowerlist[widget.id].photos[i]}"),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * .7,
                        height: 45,
                        child: RaisedButton(
                          child: Text(
                            "Visit",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .apply(color: Colors.white),
                          ),
                          color: Colors.blue,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
