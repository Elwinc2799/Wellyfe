import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Services/FirebaseData.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/ImageHolder.dart';

class LowerColumnWidget extends StatelessWidget {
  const LowerColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PlaceholderContainer(width: 250),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            FirebaseData.getAllMoodData(context);
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0XFFF2F3F7),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-3, -3),
                      color: Colors.white
                  ),
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                      color: Colors.black.withOpacity(.15)
                  )
                ]
            ),
            child: ImageHolder(image: "assets/pictures/mood.png",),
          ),
        ),
      ],
    );
  }
}