import 'dart:math';

import 'package:boba_map/app_data/app_data.dart';
import 'package:boba_map/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ActivityFeedPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

final _biggerFont = const TextStyle(fontSize: 16.0);
var rng = new Random();

class _State extends State<ActivityFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Feed',
        style: TextStyle(color: Colors.black54)),
        backgroundColor: const Color(0xFFA7FFEB),
      ),
      body: ListView.builder(
        shrinkWrap:true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 3,
        itemBuilder: (context, i) {
          return Container (
            height: 130,
            margin: EdgeInsets.all(2),
            child: new Column (
              children: [
                RatingBar(
                  initialRating: 3.5 + rng.nextDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                _buildRow(AppData.profiles[i+1]),
              ]
            )
          );
        }
      )
    );
  }

  Widget _buildRow(Profile person) {

    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.grey,
        // drink images
        backgroundImage: new AssetImage(person.imageUrl),
      ),
      title: new Text(person.username,
        style: _biggerFont,
      ),
      subtitle: new Text(person.subtitle),

      onTap: () {
        setState(() {
        });
      },
    );
  }
}

