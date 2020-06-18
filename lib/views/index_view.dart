import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:init_widgets/widgets/description_widget.dart';
import 'package:init_widgets/widgets/footer_widget.dart';

class IndexView extends StatefulWidget {
  IndexView({Key key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  var dataCharacters = [];

  var dataPlaces = [];

  loadData(context) async {
    if (dataCharacters.length == 0) {
      dataCharacters = jsonDecode(await DefaultAssetBundle.of(context)
          .loadString("assets/data/characters.json"));
      setState(() {});
    }

    if (dataPlaces.length == 0) {
      dataPlaces = jsonDecode(await DefaultAssetBundle.of(context)
          .loadString("assets/data/places.json"));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    loadData(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My favourite things'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var character in dataCharacters)
                    DescriptionWidget(
                      image: character['img'],
                      title: character['name'],
                      properties: [character['born']],
                      orientation: Axis.vertical,
                    )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                    for (var character in dataPlaces)
                    DescriptionWidget(
                      image: character['img'],
                      title: character['name'],
                      properties: [],
                      orientation: Axis.horizontal
                    )
                ],
              )
            ),
            Expanded(
              flex: 1,
              child: FooterWidget(),
            )
          ],
        ),
      ),
    );
  }
}
