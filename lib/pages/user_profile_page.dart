import 'dart:math';

import 'package:flutter/material.dart';
import 'package:boba_map/app_data/app_data.dart';
import 'package:boba_map/models/profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Profile profile;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var rng = new Random();

  @override
  void initState() {
    profile = AppData.profiles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 750),
            transitionBuilder: (Widget child, Animation<double> animation) => SlideTransition(
              child: child,
              position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
            ),
            child: HeaderSection(
              profile: profile,
            ),
          ),
          SizedBox(height: 40),
          ListView.builder (
            shrinkWrap:true,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: 3,
            itemBuilder: (context, i) {
              return Container (
                height: 135,
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
                    _buildRow(AppData.profiles[i+4]),
                  ]
                )
              );
            }
          )
        ],
      ),
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

class HeaderSection extends StatelessWidget {
  final Profile profile;
  HeaderSection({
    this.profile,
    Key key,
  }) : super(key: ValueKey<String>(profile.imageUrl));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(profile.imageUrl), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              profile.name,
              // TODO: Put the username in smaller font underneath
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Text(
              profile.subtitle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      profile.totalDrink,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Drinks')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      profile.totalFollowers,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Followers')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      profile.totalFollowing,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Following')
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      profile.achievements,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('Achievements')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}