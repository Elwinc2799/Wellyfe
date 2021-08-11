import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.04,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AUTO",
                    style: TextStyle(
                      height: 0.25,
                      fontSize: 15,
                      fontFamily: "TitilliumWeb",
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "SAVE",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "TitilliumWeb",
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.04,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
              child: Text(
                DateFormat('EEE, d MMM / y').format(DateTime.now()).toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "TitilliumWeb",
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage("assets/logo/tick.png"),
            ),
          )
        ],
      ),
    );
  }
}