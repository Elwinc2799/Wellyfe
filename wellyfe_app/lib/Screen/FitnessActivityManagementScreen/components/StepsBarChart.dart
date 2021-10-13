import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StepsBarChart extends StatefulWidget {
  @override
  _StepsBarChartState createState() => _StepsBarChartState();
}

class _StepsBarChartState extends State<StepsBarChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.grey.withOpacity(0.1)
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Steps',
                style: TextStyle(
                    color: Color(0XFF394D70),
                    fontSize: 22.5,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: size.height * 0.002),
              Text(
                'Weekly',
                style: TextStyle(
                  color: Color(0XFF394D70).withOpacity(0.5),
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: "NunitoSans",
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: BarChart(
                    mainBarData(),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.005),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 15,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 5 : y,
          colors: isTouched ? [Colors.indigoAccent] : [Colors.indigo],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 75,
            colors: [Colors.black26.withOpacity(0.1)],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 25, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 36.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 15, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 57.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 65, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 16.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(
              color: Color(0XFF394D70),
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),
          margin: 10,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
