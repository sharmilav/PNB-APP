import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innlite_mobile/Common/api_url.dart';
import 'package:innlite_mobile/Common/common_dart.dart';
import 'package:innlite_mobile/Common/http_request.dart';
import 'package:innlite_mobile/View/camera_ageing.dart';
import 'package:innlite_mobile/View/dashboard_view.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
bool islogin=false;
var tcktscount,sitecount;
SharedPreferences? prefs ;
final common= Common();
final httpreq= HttpRequest();
var count;
var sitedetails;
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  MySplashScreen createState() => MySplashScreen();

}
Future getsharedprefence(BuildContext context) async{
  prefs= await SharedPreferences.getInstance();
  islogin = prefs!.getBool('isloggedin')?? false;


  void callurl() async{
print(prefs!.getStringList("allsite").toString());
if(prefs!.getStringList("allsite").toString()!="") {
   sitedetails = prefs!
      .getStringList("allsite")
      ?.map((e) => jsonDecode(e))
      .toList();
  print(sitedetails);
}
//List<dynamic> listdata=  jsonDecode(count.toString().substring(1,count.toString().length-1));
      sitecount = (await httpreq.getdata(
          Glob().getSites() + "/" + prefs!.getString('bankcode').toString(),
          prefs!.getString('token'), context));
print(sitecount);
      List<dynamic> overalllist = sitecount['Table'];
      Glob().sites = overalllist;
      Glob().totalsites = overalllist.length.toString();
    tcktscount = (await httpreq.getdata(Glob().getTicketCount()+"/"+prefs!.getString('bankcode').toString(),prefs!.getString('token'),context));
    print(tcktscount);

     List<dynamic> counts = sitedetails;
     var offlinecount = counts.asMap();
     Glob().totalofflinesite =
     (offlinecount[0]['TotalOfflineSiteCount'].toString());
     Glob().totalonlinesite =
     (offlinecount[0]['TotalOnlineSitecount'].toString());

    // tcktscount = (await httpreq.getdata(Glob().getTicketCount()+"/"+prefs!.getString('bankcode').toString(),prefs!.getString('token'),context));
     Timer(Duration(seconds: 0), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                MyDashboardPage(prefs!.getString('username').toString(),tcktscount))));

  }

  if(islogin==null){
    Timer(Duration(seconds: 3), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));

  }
else  if(!islogin)
    Timer(Duration(seconds: 3), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  else {
    callurl();
  }
  return prefs!.getBool('isloggedin')?? false;
}
class MySplashScreen extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double yourWidth = width * 0.50;
    getsharedprefence(context);
    return Scaffold(

      backgroundColor: common.getColorFromHex('2F2F2F'),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

         Image.asset("icons/logo.png"),
        SizedBox(height:  yourWidth*1.3),
        Align(
          alignment: Alignment.bottomCenter,

            child:


              Padding(padding: EdgeInsets.fromLTRB(30.0,0,30,0),child:
              Center(child: Image.asset("icons/pnblogo.png")),)

    )


        ],)
    );
  }
}
