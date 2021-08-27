import 'package:flutter/material.dart';
import 'package:spacex_app/http_service.dart';
import 'package:spacex_app/model.dart';
import 'package:spacex_app/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: buildLatestData(deviceWidth, deviceHeight),
      ),
    );
  }
}
