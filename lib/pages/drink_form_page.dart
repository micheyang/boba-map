import 'package:boba_map/main.dart';
/// Flutter code sample for Form

// This example shows a [Form] with one [TextFormField] to enter an email
// address and an [ElevatedButton] to submit the form. A [GlobalKey] is used here
// to identify the [Form] and validate input.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/form.png)

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(DrinkFormPage());

/// This is the main application widget.
class DrinkFormPage extends StatelessWidget {
  static const String _title = 'Add New Drink';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: const Color(0xFF1DE9B6),
          ),
        body: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RatingBar(
              initialRating: 0,
              minRating: 0,
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
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Boba shop name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Drink name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ice & sugar levels',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Thoughts',
              ),
            ),
            Icon(
              Icons.drive_folder_upload, 
              size: 100,
              color: Colors.black38,
              ),
            Text('Upload image',
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: RaisedButton(
                color: const Color(0xFF1DE9B6),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    print('pre-pop');
                    Navigator.pop(context, 'popped!');
                  }
                },
                child: Text('Submit',
                style: TextStyle(color: Colors.black38)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
