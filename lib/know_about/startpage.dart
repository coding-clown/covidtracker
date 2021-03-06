import 'package:covidtracker/config.dart';

import '../know_about/body_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../know_about/cardmodel.dart';
import '../know_about/divide_parts.dart';
//import 'dart:math' as math;

class StartPage extends StatelessWidget {
  final List<CardModel> spreadList = [
    CardModel(
        title: "Air by Cough or Sneeze",
        imageSource: "assets/images/sneez.png"),
    CardModel(
        title: "Personal \nContact", imageSource: "assets/images/group.png"),
    CardModel(
        title: "Contaminated \nObjects",
        imageSource: "assets/images/handshake.png"),
    CardModel(
      title: "Crowd \nGathering",
      imageSource: "assets/images/bench.png",
    ),
  ];

  final List<CardModel> symptomsList = [
    CardModel(
        title: "Dry Cough",
        imageSource: "assets/images/cough1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "High Fever",
        imageSource: "assets/images/fever1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "Sore \nThroat",
        imageSource: "assets/images/cold1.png",
        cardColor: Colors.redAccent),
    CardModel(
        title: "Difficulty in\nBreathing",
        imageSource: "assets/images/headache1.png",
        cardColor: Colors.redAccent),
  ];

  final List<CardModel> preventList = [
    CardModel(
        title: "Wash Your Hands Often",
        imageSource: "assets/images/Handwashing-pana.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Wear a Face Mask",
        imageSource: "assets/images/Person with medical mask-pana.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Avoid Contact with Sick People",
        imageSource: "assets/images/Social Distancing-amico.png",
        cardColor: Colors.greenAccent),
    CardModel(
        title: "Always Cover Your Cough or Sneeze",
        imageSource: "assets/images/balconies.png",
        cardColor: Colors.greenAccent),
  ];

  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints setconstraints) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF23395D),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: Color(0xFF23395D),
            body: SafeArea(
              child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool isSelected) {
                    return <Widget>[
                      SliverAppBar(
                        primary: true,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        backgroundColor: Color(0xFF23395D),
                        expandedHeight: 30 * SizeConfig.heightMultiplier,
                        floating: false,
                        snap: false,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/bgimage.jpg",
                                ),
                                fit: BoxFit.fill,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: BodyPart(
                    point: 0.5,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                2.61 * SizeConfig.heightMultiplier),
                            topRight: Radius.circular(
                                2.61 * SizeConfig.heightMultiplier),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    left: 4.72 * SizeConfig.widthMultiplier,
                                    right: 4.72 * SizeConfig.widthMultiplier,
                                    top: 3.49 * SizeConfig.heightMultiplier),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'COVID-19 (Coronavirus)',
                                      style: TextStyle(
                                        fontSize:
                                            3.05 * SizeConfig.heightMultiplier,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing:
                                            0.1 * SizeConfig.widthMultiplier,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2 * SizeConfig.heightMultiplier),
                                    BodyPart(
                                      point: 0.5,
                                      child: Text(
                                        'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.',
                                        style: TextStyle(
                                          fontSize: 2.39 *
                                              SizeConfig.heightMultiplier,
                                          fontWeight: FontWeight.w500,
                                          height: 0.16 *
                                              SizeConfig.heightMultiplier,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2.5 * SizeConfig.heightMultiplier),
                                    BodyPart(
                                      point: 0.75,
                                      child: Text(
                                        'Most people who fall sick with COVID-19 will experience mild to moderate symptoms and recover without special treatment.',
                                        style: TextStyle(
                                          fontSize: 2.39 *
                                              SizeConfig.heightMultiplier,
                                          fontWeight: FontWeight.w500,
                                          height: 0.16 *
                                              SizeConfig.heightMultiplier,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            3.27 * SizeConfig.heightMultiplier),
                                    BodyPart(
                                      point: 1,
                                      child: DivideParts(
                                        title: "Symptoms",
                                        infoList: symptomsList,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2.5 * SizeConfig.heightMultiplier),
                                    BodyPart(
                                      point: 1.5,
                                      child: DivideParts(
                                        title: "How it Spreads?",
                                        infoList: spreadList,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2.5 * SizeConfig.heightMultiplier),
                                    BodyPart(
                                      point: 2,
                                      child: DivideParts(
                                        title: "Preventions",
                                        infoList: preventList,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2.5 * SizeConfig.heightMultiplier),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
