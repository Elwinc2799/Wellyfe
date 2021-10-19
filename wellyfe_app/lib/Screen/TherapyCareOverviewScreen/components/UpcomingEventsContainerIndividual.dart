import 'package:flutter/material.dart';

class UpcomingEventsContainerIndividual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
       children: [
         Container(
           height: size.height * 0.25,
           width: size.width * 0.8,
           child: ClipRRect(
             borderRadius: BorderRadius.circular(20.0),
             child: Image(
               image: AssetImage("assets/pictures/poster.jpg"),
               fit: BoxFit.fitWidth,
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 0.0),
           child: Container(
             width: size.width * 0.5,
             child: Column(
               children: [
                 Text(
                   "Take care of mental health during pandemic\n\nJoin us for the talk",
                   style: TextStyle(
                     fontSize: 20,
                     fontFamily: "NunitoSans",
                     color: Color(0XFF394D70),
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ],
             ),
           ),
         )
       ],
      ),
    );
  }
}