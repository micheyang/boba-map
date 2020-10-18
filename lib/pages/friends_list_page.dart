  
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:boba_map/models/Friend.dart';

class FriendsPage extends StatefulWidget {
  FriendsPage({Key key}) : super(key: key);

  @override
  FriendsState createState() => new FriendsState();
}

class FriendsState extends State<FriendsPage> {

  bool _isProgressBarShown = true;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  List<Friend> _listFriends;

  @override
  void initState() {
    super.initState();
    _fetchFriendsList();
  }

  @override
  Widget build(BuildContext context) {

    Widget widget;

    if(_isProgressBarShown) {
      widget = new Center(
          child: new Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: new CircularProgressIndicator()
          )
      );
    }else {
      widget =  new ListView.builder(
          shrinkWrap:true,
          padding: const EdgeInsets.all(0.0),

          itemBuilder: (context, i) {
            if (i.isOdd) return new Divider();
            return _buildRow(_listFriends[i]);
          }
      );
    }

    return new Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Friends', 
            style: TextStyle(color: Colors.black54)),
            Text('Add',
            style: TextStyle(color: Colors.black38)),
          ],
        ),
        backgroundColor: const Color(0xFFA7FFEB),
      ),
      body: widget,
    );
  }

  Widget _buildRow(Friend friendsModel) {

    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: new NetworkImage(friendsModel.profileImageUrl),
      ),
      title: new Text(friendsModel.name,
        style: _biggerFont,
      ),
      subtitle: new Text('Drinks: ' + friendsModel.drinks),

      onTap: () {
        setState(() {
        });
      },
    );
  }

  _fetchFriendsList() async {

    _isProgressBarShown = true;
    var url = 'https://randomuser.me/api/?results=100&nat=us';
    var httpClient = new HttpClient();

    List<Friend> listFriends = new List<Friend>();
    try {
      JsonDecoder jD = JsonDecoder();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Map data = jD.convert(json);

        for (var res in data['results']) {
          var objName = res['name'];
          String name = objName['first'].toString() + " " +objName['last'].toString();

          var objImage = res['picture'];
          String profileUrl = objImage['large'].toString();
          var rng = new Random();
          Friend friendsModel = new Friend(name, rng.nextInt(1000).toString(), profileUrl);
          listFriends.add(friendsModel);
        }
      }
    } catch (exception) {
      print(exception.toString());
    }

    if (!mounted) return;

    setState(() {
      _listFriends = listFriends;
      _isProgressBarShown = false;
    });

  }
}