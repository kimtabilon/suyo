import 'package:flutter/material.dart';

class SampleCard extends StatefulWidget {
  @override
  _SampleCardState createState() => _SampleCardState();
}

class _SampleCardState extends State<SampleCard> {
  @override
  Widget build(BuildContext context) {

    var test = Icons.ac_unit;

    return new Column(
      children: <Widget>[
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.album),
                title: const Text('The Enchanted Nightingale'),
                subtitle: const Text(
                    'Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              new ButtonBarTheme(
                data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
                // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    new FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.album),
                title: const Text('The Enchanted Nightingale'),
                subtitle: const Text(
                    'Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              new ButtonBarTheme(
                data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
                // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    new FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new GestureDetector(
            child: new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Icon(
                    test,
                    size: 200.0,
                  ),
                ],
              ),
            ),
            onLongPress: () {
              setState(() {
                if (test == Icons.language) {
                  test = Icons.person;
                } else if (test == Icons.person) {
                  test = Icons.language;
                }
              });
            })
      ],
    );
  }
}
