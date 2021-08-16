import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ValueNotifier<double> _value = ValueNotifier(2.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Color> colorList = [
      Color(0XFFFFCF30), Color(0XFFB3CFFF), Color(0XFF7CE1FF),
    ];
    List<String> emoji = [
      'awesome', 'great', 'not good',
    ];

    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: _value,
            builder: (BuildContext context, double list, Widget? children) {
              return Container(
                height: size.height,
                width: size.width,
                color: colorList[_value.value.toInt() - 1],
              );
            }
          ),
          Center(
            child: ValueListenableBuilder<double>(
                valueListenable: _value,
                builder: (BuildContext context, double list, Widget? children) {
                  return GestureDetector(
                    onDoubleTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/pictures/${emoji[_value.value.toInt() - 1]}.gif"),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Positioned(
            bottom: size.height * 0.125,
            left: size.width * 0.1,
            child: Container(
              width: size.width * 0.8,
              child: SliderTheme(
                data: SliderThemeData(
                  thumbColor: Colors.green,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                ),
                child: Slider(
                  value: _value.value,
                  min: 1.0,
                  max: 3.0,
                  divisions: 2,
                  onChanged: (double value) {
                    setState(() {
                      _value.value = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

