
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../Common/http_request.dart';
InAppLocalhostServer localhostServer = new InAppLocalhostServer();
class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();

}

class WebViewLoadUI extends State<WebViewLoad> {

  @override
  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return

       Scaffold(

        backgroundColor: common.getColorFromHex('#F7F7F7'),
        appBar: AppBar(
          centerTitle: true,

          title: Text(
            'Live Streaming',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.nunito().fontFamily),
          ),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: InAppWebView(
                    shouldOverrideUrlLoading: (controller, action) async {
                      return NavigationActionPolicy.ALLOW;
                    },

                    initialFile: "assets/index.html",
                    initialSettings: InAppWebViewSettings(
                      mediaPlaybackRequiresUserGesture: false,
                      useShouldOverrideUrlLoading: true,
                      useHybridComposition: true,
                      allowsInlineMediaPlayback: true,
                    ),
                    onReceivedServerTrustAuthRequest: (controller, challenge) async {
                      return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;

                    },
                  ),
                ),
              )
            ])
        ),
    );
  }

  @override
  void dispose() {
    localhostServer.close();
    super.dispose();
  }
}

