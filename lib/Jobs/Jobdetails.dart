import 'package:flutter/material.dart';

import 'global.dart';

class JobDetailsScreen extends StatefulWidget {
  final int id;
  String iconUrl;

  JobDetailsScreen({Key key, @required this.id, @required this.iconUrl})
      : super(key: key);

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                "https://www.rollingplans.com.np/image/catalog/logo_RPPL.png",
                height: 100,
                width: 100,
                fit: BoxFit.fill,
                color: Colors.black38,
                colorBlendMode: BlendMode.darken,
              ),
            ),
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
                        "${jobList[widget.id].title}",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Text(
                            "${jobList[widget.id].location}",
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .apply(color: Colors.grey),
                          ),
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
                        "${jobList[widget.id].description}",
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.grey),
                        maxLines: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          Text(
                            "${jobList[widget.id].number}",
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .apply(color: Colors.grey),
                            maxLines: 3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                          ),
                          Text(
                            "${jobList[widget.id].salary}",
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .apply(color: Colors.grey),
                            maxLines: 3,
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
                          itemCount: jobList[widget.id].photos.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                    "${jobList[widget.id].photos[i]}"),
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
                            "Call us",
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
