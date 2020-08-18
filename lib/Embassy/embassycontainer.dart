import 'package:flutter/material.dart';

class EmbassyContainer extends StatefulWidget {
  EmbassyContainer({
    Key key,
    @required this.iconUrl,
    @required this.title,
    @required this.location,
    @required this.description,
    @required this.onTap,
  }) : super(key: key);
  String iconUrl, title, location, description;

  Function onTap;

  @override
  _EmbassyContainerState createState() => _EmbassyContainerState();
}

class _EmbassyContainerState extends State<EmbassyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "${widget.iconUrl}",
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.title}",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(fontSizeFactor: 0.70),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 10.0,
                          ),
                          Text(
                            "${widget.location}",
                            style: Theme.of(context).textTheme.subtitle.apply(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              "${widget.description}",
              style:
                  Theme.of(context).textTheme.body1.apply(color: Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}
