
import 'package:covidtracker/screens/home/world_screen/country.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../home_widgets/infoCardset.dart';



class ShowDistrictData extends StatefulWidget {
  var districtData;
  var index;
  var text;
  ShowDistrictData({this.districtData, this.index,this.text});
  @override
  _ShowDistrictDataState createState() => _ShowDistrictDataState();
}

class _ShowDistrictDataState extends State<ShowDistrictData> {
  bool toggle = false;
  var myDistrictData;
  var index;
  var text;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  @override
  void initState() {
    super.initState();
    myDistrictData = widget.districtData;
    index = widget.index;
    text=widget.text;
  if(text=="country")  {
        dataMap.putIfAbsent("Deaths",
        () => double.parse((myDistrictData[index]["deaths"]).toString()));}
        else{
            dataMap.putIfAbsent("Deaths",
        () => double.parse((myDistrictData[index]["deceased"]).toString()));
        }
    dataMap.putIfAbsent("Recovered",
        () => double.parse((myDistrictData[index]["recovered"]).toString()));
    dataMap.putIfAbsent("Active",
        () => double.parse((myDistrictData[index]["active"]).toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (text=="country")?Text(myDistrictData[index]["country"].toString()):Text(myDistrictData[index]["district"].toString()),
      ),
      body: Column(
        children: <Widget>[
         Container(
           child: Center(child: (text=="country")?Infoset(worldData:myDistrictData[index] ,code: 4,):Infoset(districtData:myDistrictData[index] ,code: 3)),
         ),

          Container(
            child: Center(
              child: toggle
                  ? PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32.0,
                      chartRadius: MediaQuery.of(context).size.width / 2.7,
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      showChartValuesOutside: false,
                      chartValueBackgroundColor: Colors.grey[200],
                      colorList: colorList,
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                      decimalPlaces: 1,
                      showChartValueLabel: true,
                      initialAngle: 0,
                      chartValueStyle: defaultChartValueStyle.copyWith(
                        color: Colors.blueGrey[900].withOpacity(0.9),
                      ),
                      chartType: ChartType.disc,
                    )
                  : Text("Press FAB to show chart"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}
