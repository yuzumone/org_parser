import 'package:flutter/material.dart';
import 'package:org_parser/org_parser.dart';

class DetailView extends StatelessWidget {
  final Headline headline;

  DetailView({Key key, @required this.headline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                headline.title,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Flexible(
              child: Text(
                headline.chunks.skip(1).join('\n'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
