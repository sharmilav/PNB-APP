/*

import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/api_url.dart';

class FlickPlayer extends StatefulWidget {
  FlickPlayer({Key key}) : super(key: key);

  @override
  _FlickPlayer createState() => _FlickPlayer();
}

class _FlickPlayer extends State<FlickPlayer> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
        centerTitle: true,
      ),
      body:Center(child:
      AspectRatio(
        aspectRatio: 4.0/4.0,
        child: BetterPlayer.network(
          Glob().pickkedvideo,
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 4.0/ 4.0,
          ),
        ),
      ),),
    );
  }

*/