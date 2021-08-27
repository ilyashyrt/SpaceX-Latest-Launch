import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_app/http_service.dart';
import 'package:spacex_app/model.dart';

HttpService httpService = HttpService();

Text buildName(AsyncSnapshot<SpaceX> snapshot) {
  return Text(
    "${snapshot.data.name}",
    style: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: Colors.red[800], fontWeight: FontWeight.bold, fontSize: 25)),
  );
}

Padding buildDetails(double deviceWidth, AsyncSnapshot<SpaceX> snapshot) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth / 40),
    child: Text(
      "${snapshot.data.details}",
      textAlign: TextAlign.center,
      style: GoogleFonts.raleway(
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}

Card buildPatch(
    double deviceWidth, AsyncSnapshot<SpaceX> snapshot, double deviceHeight) {
  return Card(
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: deviceWidth / 175, color: Colors.black)),
    elevation: 9,
    child: Image.network(
      "${snapshot.data.links.patch.small}",
      width: deviceWidth / 2,
      height: deviceHeight / 3,
    ),
  );
}

FutureBuilder<SpaceX> buildLatestData(double deviceWidth, double deviceHeight) {
  return FutureBuilder<SpaceX>(
    future: httpService.getData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildName(snapshot),
            buildDetails(deviceWidth, snapshot),
            buildPatch(deviceWidth, snapshot, deviceHeight),
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red[800]),
      );
    },
  );
}
