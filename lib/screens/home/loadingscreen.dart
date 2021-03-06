import 'package:covidtracker/apidata.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../home/home.dart';
import 'package:covidtracker/config.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Apidata apidata = Apidata();
  var data;
  var districtData;
  var dailydata;
  var countrydata;
  var globalData;
  void setData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "This App Requires an Internet Connection. Restart the App.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFFEB1555),
        textColor: Colors.white,
        fontSize: 1.75 * SizeConfig.textMultiplier,
      );
      return;

    } 
data = await apidata.getData();
    districtData = await apidata.getDistrictData();
    dailydata = await apidata.getDailyData();
    countrydata = await apidata.getCountryData();
    globalData = await apidata.getGlobalData();
    if (data == int || districtData == int) {
      Fluttertoast.showToast(
        msg: "There was an error connecting to the server",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFFEB1555),
        textColor: Colors.white,
        fontSize: 1.75 * SizeConfig.textMultiplier,
      );

     
      return;
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuDashboardPage(
          data: data,
          districtData: districtData,
          dailyData: dailydata,
          countrydata: countrydata,
          globalData: globalData,
          btmcode:0);
    }));
  }

  void initState() {
    super.initState();
    setData();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161625),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
              child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/gocorona.svg",
                width: 47.28 * SizeConfig.imageSizeMultiplier,
              ),
              SizedBox(
                height: 3.27 * SizeConfig.heightMultiplier,
              ),
              Container(
                padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Go ",
                      style: TextStyle(
                          fontSize: 3.5* SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700]),
                    ),
                    Text(
                      "Corona",
                      style: TextStyle(
                          fontSize: 3.5* SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ))),
    );
  }
}
