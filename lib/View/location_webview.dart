

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
WebViewController? controller;
class Location extends StatefulWidget {
  String latitude,longitude;
Location(this.latitude,this.longitude);


  _Location createState() => _Location();
}
class _Location extends State<Location> {

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("https://www.google.com/maps/?q="+widget.latitude.toString()+','+widget.longitude.toString(),),
      );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          'Location',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.nunito().fontFamily),
        ),
      ),
      body: Center(
          child: WebViewWidget(
           controller: controller!,
          )
      ),
    );
  }

  @override
  void dispose() {

    super.dispose();
  }
}